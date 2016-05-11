package importing;

import Database.*;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;

import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClient;
import com.amazonaws.services.dynamodbv2.document.AttributeUpdate;
import com.amazonaws.services.dynamodbv2.document.DynamoDB;
import com.amazonaws.services.dynamodbv2.document.Item;
import com.amazonaws.services.dynamodbv2.document.ItemCollection;
import com.amazonaws.services.dynamodbv2.document.QueryOutcome;
import com.amazonaws.services.dynamodbv2.document.ScanOutcome;
import com.amazonaws.services.dynamodbv2.document.Table;
import com.amazonaws.services.dynamodbv2.document.spec.QuerySpec;
import com.amazonaws.services.dynamodbv2.document.utils.ValueMap;
import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

public class Reader {
	private static DatabaseAccessor db;
	private static Table attributeTable;
	private static Table listsTable;
	private static Table listItemsTable;
	private static Table categoriesTable;
	private static int list_id_counter;
	private static int item_id_counter;
	private static List<String> conflicts;
	private static HashMap hm;
	
	public Reader () {
		
		db = new DatabaseAccessor ();
		attributeTable = db.getDDB().getTable("Attributes");
		listsTable = db.getDDB().getTable("Lists");
		listItemsTable	= db.getDDB().getTable("ListItems");
		categoriesTable = db.getDDB().getTable("Categories");
		
		list_id_counter = 1000;
		item_id_counter = 1000;
		conflicts = new ArrayList<String> ();
		conflicts.add("The Following Item names were already in the DB\n");
		conflicts.add("Item Name,List Name, Item ID");
		hm = new HashMap();
		ItemCollection<ScanOutcome> collection = listItemsTable.scan();
		Iterator<Item> iterator = collection.iterator();
		while (iterator.hasNext()) {
			Item listitem = iterator.next();
			String name = listitem.getString("ItemName");
			try {
			int id =  listitem.getNumber("ItemID").intValue();
			hm.put(name, id);
			} catch (Exception e) {
				continue;
			}
		}
	}
	
	static List<String> parseCell (String inputstring) {
		String longstring = inputstring.substring(1,inputstring.length()-1);
		String [] things = longstring.split("; ");
		List<String> returnbro = new ArrayList<String>();
		for (String thing : things) {
			returnbro.add(thing);
		}
		return returnbro;
	}
	
	static void Parser (String filename) {
		BufferedReader fileReader = null;
		
		String line = "";
		boolean first_line = true;
		try {
			fileReader = new BufferedReader (new FileReader(filename));
			while ((line = fileReader.readLine())!=null) {
				if (first_line) {
					first_line = false;
					continue;
				}
				buildLine(line);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	static void itemEntry (String itemname, String list, String picpath, int itemid, int listid) {
		Item item = new Item()
				.withPrimaryKey("ItemName",itemname,"BelongingList",list)
				.withString("PicPath", picpath)
				.withNumber("Win",0)
				.withNumber("Loss",0)
				.withNumber("ItemID",itemid)
				.withNumber("ListID", listid);
		listItemsTable.putItem(item);
	}
	
	static void itemEntry (String itemname, String list, int itemid, int listid, List<String> attributes) {
		Item item = new Item()
				.withPrimaryKey("ItemName",itemname,"BelongingList",list)
				.withNumber("Win",0)
				.withNumber("Loss",0)
				.withNumber("ItemID",itemid)
				.withNumber("ListID", listid);
		listItemsTable.putItem(item);
		
		for (int att_value = 0;att_value<attributes.size();att_value++) {
			attributeEntry(listid,att_value,itemid);
			System.out.println("Adding " + attributes.get(att_value) + "to item " + itemname);
		}
	}
	
	static void attributeEntry (int listid,int att,int itemid) {
		String codestring = encodeString(listid,att);
		Item item = new Item () 
				.withPrimaryKey("ItemID",itemid,"ListAttribute",codestring)
				.withNumber("ItemID",itemid)
				.withNumber("Average",75)
				.withNumber("n_rated",1);
		attributeTable.putItem(item);
	}
	static void buildLine (String line) {
		String [] tokens = line.split(",");
		String listname = tokens[0];
		String picpath = tokens[1];
		List<String> attributes	= parseCell(tokens[2]);
		List<String> items = parseCell(tokens[3]);
		String category = tokens[4];
		insertList(list_id_counter,listname,attributes,picpath,items.size(),items);
		for (int i = 0; i<attributes.size();i++) {
			System.out.println(attributes.get(i));
		}
		list_id_counter++;
		
	}
	
	static void addCategory (String Category, int listid) {
		Map <String,String> expressionAttributeNames = new HashMap<String,String>();
		expressionAttributeNames.put("#L", "ListIds");
		
		Map <String,Object> expressionAttributeValues = new HashMap<String,Object>();
		expressionAttributeValues.put(":val1",
				new HashSet <Integer>(Arrays.asList(listid)));
		categoriesTable.updateItem("CategoryName",Category,
				"add #L :val1",expressionAttributeNames,expressionAttributeValues);
		
	}
	static int getItemID(String itemname) {
		//unused
		
		try {
		QuerySpec spec = new QuerySpec()
				.withKeyConditionExpression("ItemName = :name")
				.withValueMap(new ValueMap()
						.withString(":name", itemname));
		ItemCollection<QueryOutcome> items = listItemsTable.query(spec);
		Iterator<Item> iterator = items.iterator();
		Item item = iterator.next();
		System.out.println(item.getNumber("ItemID"));

		} catch (NoSuchElementException e) {
			
		}
		return 0;
	}
	
	@SuppressWarnings("unchecked")
	static void insertList (int listid, String listname, List<String> attributes, String picpath, int listsize,List<String> items) {
		Item item = new Item ()
				.withPrimaryKey("Id",listid)
				.withString("ListName", listname)
				.withList("Attributes", attributes)
				.withString("PicPath",picpath)
				.withNumber("ListSize",listsize);
		listsTable.putItem(item);

		for (int i = 0;i<items.size();i++) {
			String listitem = items.get(i);
			try {
				Integer tempid = (Integer) hm.get(listitem);
				int itemid = tempid;
				itemEntry(listitem,listname, itemid, listid, attributes);
				String tempstring = listitem + "," + listname + "," + tempid;
				conflicts.add(tempstring);
			} catch (NullPointerException e) {
				itemEntry(listitem,listname, item_id_counter, listid, attributes);
				hm.put(listitem, item_id_counter);
				item_id_counter++;
				
			}

		}
	}
	
	public static int getListNumber (String in) {
		String newint = in.substring(0,10);
		return Integer.parseInt(newint);
	}
	
	public static int getAttributeNumber (String in) {
		String newint = in.substring(12);
		return Integer.parseInt(newint);
	}
	
	public static String encodeString (int id,int att) {
		String zeros = "0000000000";
		String idstring = zeros + id;
		String attstring = zeros + att;
		String first = idstring.substring((idstring.length()-10));
		String last = attstring.substring((attstring.length()-2));
		String bigstring = first + "xx" + last;
		return bigstring;
	}

	static void writeConflicts () {
		try{

		FileWriter writer = new FileWriter ("Maintenance/Outputs/conflicts.csv");
		for (String line : conflicts) {
			writer.write(line);
			writer.write("\n");
		}
		writer.close();
		} catch (Exception e) {e.printStackTrace();}
	}
	
	static void writeCategories (String filename) {
		//some stuff to do still 
	}

	public static void main (String[] args) {
		//new Reader();
		//Reader.Parser("Maintenance/Inputs/import_test.csv");
		//Item item = listItemsTable.getItem("ItemName","Drake","BelongingList","Rappers");
		//System.out.println(item.getString("BelongingList"));
		//Reader.getItemID("Drakers");
		//writeConflicts();
		//addCategory("Movies",3);
		System.out.println(encodeString(4,4));
		System.out.println(encodeString(4388,40));

	}
}
