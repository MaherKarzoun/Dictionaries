$(document).ready(function(){
 var height , searchWidth , newWordWidth , width ;
 	
 	function adjsutHeight(){  
 	   height = $(window).height() - $(".main-header").outerHeight() ;
 		$(".search").height(height);
		$(".newWord").height(height);
		$(".middle").height(height);
	}

 	 function adjsutWidth(){  
 	   width = $(window).width() ;
 	   searchWidth = $(".search").width();
 	   newWordWidth = $(".newWord").width() ; 
 	   var w = width * 0.5;
 	    		$(".newWord").width(w);
	 	    	$(".search").width(w);
	 	    	$(".middle").hide();
	 	if(width > 700){
	 		$(".newWord").width("300px");
	 	    $(".search").width("300px");

	 	    $(".middle").show();
	 	}
	}

	function init(){  
		adjsutHeight();
		adjsutWidth();
	}

  	$(window).resize(function(){ init(); });


	$(".resultSearch ").on( "click" , "li" , function(){
		$("input[name='findWord']").val($(this).text());
		$("ul.resultSearch").html("");
	});

	$("input[name='findWord']").keyup(function(){
		$("#WORD").text("");$("#MEANING").html("");
		var find = $(this).val();
		var lang = $("select[name='language-search']").val();
		if(find.length > 0){
			$.post("./DB/showSuggestions.php",{
				word : find,
				language : lang
			},function(response){			
				if(response.length > 0 ){
					var list='';
				 	var res = response.split("#$%");
						res.forEach(function(result){
							list+="<li>"+result+"</li>"
						});
					$("ul.resultSearch").html(list);
				}
				else{ $("ul.resultSearch").html(""); }
			});
		}
		else{  $("ul.resultSearch").html("");  }
	});


	$("input[name='submit-search']").click(function(){
		$("#WORD").text("");
		$("#MEANING").html("");
		$(".resultSearch").html("");
		var find = $("input[name='findWord']").val();
		var lang = $("select[name='language-search']").val();
		if(find.length > 0){
			$("#WORD").text(find);
			$.post("./DB/search.php",{
				word : find,
				language : lang
			},function(response){
				if(response.length > 0 ){
					var list='' ;
					var res = response.split("#$%");
					res.forEach(function(result){
						list +="<li>"+result+"</li>"; 
					});
					$("#MEANING").html(list);
				}
				else{  $("#WORD").text("Can't find a result ! ");  }
			});
		}else{ $("#WORD").text("please fill in the Field with a word you are searching for");}
	});

	$("input[name='submit-newWord']").click(function(){
		var Insert = $("input[name='new-word']");
		var Meaning =$("textarea[name='meaning']");
		var lang = $("select[name='language-newWord']").val();
		$.post("./DB/insert.php",{
			word : Insert.val().trim(),
			meaning : Meaning.val().trim(),
			language : lang
		},function(response){
			$("p.msg-newWord").removeClass("error , sucessful");
			switch(response) {
				case "Success":
					$("p.msg-newWord").text(Insert.val()+" was saved   into Dic. "+lang+"Successfully ").addClass("sucessful").show().fadeOut(4000);
					Insert.val("");Meaning.val("");
					break;
				case "Existed":
					$("p.msg-newWord").text("Error : Already existed in Dic. "+lang).addClass("error").show().fadeOut(4000);
					Meaning.val("");
					break;
				case "Empty":
					$(".msg-newWord").text("Error : Please Fill in All Fields").addClass("error").show().fadeOut(4000); 
				 	break;
				case "Failed":
					$(".msg-newWord").text("Error : "+Insert.val()+" was not saved in Dic. "+lang).addClass("error").show().fadeOut(4000); 
					break;
				default: 
       				console.log(response);
			}
			return false ;
		});
	});
	
		$("button[name='showMe']").click(function(){
		    var lang = $("select[name='language-show']").val();
			$.post("./DB/show.php",{
				language : lang
				},function(response){
				console.log(response);
				$("table[name='dictionarySelected']").html(response);
			});	
		});	

init();				
});