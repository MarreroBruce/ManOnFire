$(document).ready(function() {

	var window_width = $(window).width();
	//set mobile size
	var mobile_size = 768;
	if (window_width < mobile_size) {
		//build mobile menu
		$("#top-nav").addClass("mobile");
		$("#top-nav").removeClass("showmethemoney");
		$("#top-nav").addClass("hidden");
		$("#top-nav").find("ul").removeClass("showmethemoney");
		$("#top-nav").find("ul").addClass("hidden");

		$("#clicker").click(function() {
			$("#top-nav").removeClass("hidden");
			$("#top-nav").addClass("showmethemoney");
		});
		$(".menu-item").click(function(event) {
			event.stopPropagation();
			if ($(this).hasClass("final")) {
				// do something to set the category
				// close everything hurr
				$("#top-nav").find("ul").removeClass("showmethemoney");
				$("#top-nav").find("ul").addClass("hidden");
				$("#top-nav").removeClass("showmethemoney");
				$("#top-nav").addClass("hidden");

				if ($(this).hasClass("all_class")) {
					var stringest = $(this).find("a").html();
					var newstringest = stringest.split("All ");
					var curr_cat = newstringest[1];
					$("#showCategory").html(curr_cat);
					$("#isCategoryList").val("false");
					$("#currentCategory").val(curr_cat);
				} else {
					$("#showCategory").html($(this).find("a").html());
					if ($(this).hasClass("list-item")) {
						var dbid = event.target.getAttribute("database-id");
						$("#currentCategory").val(dbid);
						$("#isCategoryList").val("true");
					} else {
						$("#currentCategory").val($(this).find("a").html());
						$("#isCategoryList").val("false");
					}
				}
				//start a new matchup, this code is in homescripts.js
				newMatchup();
			} else if ($(this).hasClass("children")) {
				// $("#top-nav").find("ul").removeClass("showmethemoney");
				// $("#top-nav").find("ul").addClass("hidden");
				// $("#top-nav").removeClass("showmethemoney");
				// $("#top-nav").addClass("hidden");
				// $(this).parent().parent().parent().removeClass("showmethemoney");
				// $(this).parent().parent().parent().addClass("hidden");
				$(this).children("ul").removeClass("hidden");
				$(this).children("ul").addClass("showmethemoney");
			}
		});
		$(".closemenu").click(function() {
			$("#top-nav").find("ul").removeClass("showmethemoney");
			$("#top-nav").find("ul").addClass("hidden");
			$("#top-nav").removeClass("showmethemoney");
			$("#top-nav").addClass("hidden");
		});
		$(".upmenu").click(function(event) {
			event.stopPropagation();
			$(this).parent().removeClass("showmethemoney");
			$(this).parent().addClass("hidden");
		});
	} else {
		//build desktop menu
		$("#top-nav").addClass("desk");
		$("#top-nav").addClass("center-block");
		$(".closemenu").addClass("hide");
		$(".upmenu").addClass("hide");
		var menu_ul = $("#top-nav");
		var menu_offset = menu_ul.offsetHeight;
		var ul_elements = $("ul", "#top-nav");
		for (i = 0; i < ul_elements.length; i++) {
			var parentdude = ul_elements[i].parentNode;
			ul_elements[i].style.left = parentdude.offsetWidth + "px";
			ul_elements[i].style.top = parentdude.offsetTop + "px";
		}
		;

		$("#top-nav").removeClass("showmethemoney");
		$("#top-nav").addClass("hidden");
		$("#top-nav").find("ul").removeClass("showmethemoney");
		$("#top-nav").find("ul").addClass("hidden");

		$("#top-nav").removeClass("showmethemoney");
		$("#top-nav").addClass("hidden");
		$("#top-nav").find("ul").removeClass("showmethemoney");
		$("#top-nav").find("ul").addClass("hidden");
		// clicker functions go here
		$("#clicker").click(function() {
			if ($("#top-nav").hasClass("hidden")) {
				$("#top-nav").removeClass("hidden");
				$("#top-nav").addClass("showmethemoney");
			} else if ($("#top-nav").hasClass("showmethemoney")) {
				$("#top-nav").find("ul").removeClass("showmethemoney");
				$("#top-nav").find("ul").addClass("hidden");
				$("#top-nav").removeClass("showmethemoney");
				$("#top-nav").addClass("hidden");
				$("#top-nav").find("a").removeClass("selected");
			}
		});
		$(".menu-item").click(function(event) {
			event.stopPropagation();
			if ($(this).hasClass("final")) {
				// do something to set the code
				// do something more
				if ($(this).hasClass("all_class")) {
					var stringest = $(this).find("a").html();
					var newstringest = stringest.split("All ");
					var curr_cat = newstringest[1];
					$("#showCategory").html(curr_cat);
					$("#isCategoryList").val("false");
					$("#currentCategory").val(curr_cat);
				} else {
					$("#showCategory").html($(this).find("a").html());
					if ($(this).hasClass("list-item")) {
						var dbid = event.target.getAttribute("database-id");
						$("#currentCategory").val(dbid);
						$("#isCategoryList").val("true");
					} else {
						$("#currentCategory").val($(this).find("a").html());
						$("#isCategoryList").val("false");
					}
				}
				
				//start a new matchup, this code is in homescripts.js
				newMatchup();
				$("#top-nav").find("ul").removeClass("showmethemoney");
				$("#top-nav").find("ul").addClass("hidden");
				$("#top-nav").removeClass("showmethemoney");
				$("#top-nav").addClass("hidden");
				$("#top-nav").find("a").removeClass("selected");
			}
			;
			if ($(this).hasClass("children")) {
				$(this).parent().find("a").removeClass("selected");
				$(this).children("a").addClass("selected");
				$(this).parent().find("ul").removeClass("showmethemoney");
				$(this).parent().find("ul").addClass("hidden");
				$(this).children("ul").removeClass("hidden");
				$(this).children("ul").addClass("showmethemoney");
			}
			;
		});
	}
	;
});
