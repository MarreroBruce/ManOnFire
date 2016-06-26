package Data;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.ArrayList;

public class Attribute implements Serializable {
	private static final long serialVersionUID = 1L;

	public String name;

	public int ranking;

	public int rating;

	public BigInteger wins;
	
	public BigInteger entries;
	
	public BigInteger points;

	public Attribute(String name, int ranking,int rating, BigInteger wins, BigInteger entries, BigInteger points) {
		this.name = name;
		this.ranking = ranking;
		this.rating = rating;
		this.wins = wins;		
		this.entries = entries;		
		this.points = points;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public int getRanking() {
		return ranking;
	}

	public void setRanking(int ranking) {
		this.ranking = ranking;
	}
	
	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}
	
	public BigInteger getWins() {
		return wins;
	}

	public void setWins(BigInteger wins) {
		this.wins = wins;
	}
	
	public BigInteger getEntries() {
		return entries;
	}

	public void setEntries(BigInteger entries) {
		this.entries = entries;
	}
	
	public BigInteger getPoints() {
		return points;
	}

	public void setPoints(BigInteger points) {
		this.points = points;
	}

}
