/**
 * 
 */

function searchValidate()
{
	

	var search= document.getElementById("searchfor");
	
	

	var valid=true;
	
	
     document.getElementById("esearch").style.visibility = "hidden";
     


   
   if(search.value.length<=0)
	   {
	   document.getElementById("esearch").style.visibility = "visible";
	   valid=false;
	   }
   




	return valid;
}

function verifyaddbook() 

{

	    //var descriptionPattern=^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]+$;
	   // var splChars = /"*|,\":<>[]{}`\';()@&$#%"/;
	   var authorname=/^[a-zA-Z ]*$/;

		var title= document.getElementById("title");
		var genre= document.getElementById("genre");
		var author= document.getElementById("author");

		var language= document.getElementById("language");
		var description= document.getElementById("description");
		var publisher= document.getElementById("publisher");
        var publishedyear= document.getElementById("publishedyear");
        var booktype= document.getElementById("booktype");




		var valid=true;
        






        document.getElementById("etitle").style.visibility = "hidden";
        document.getElementById("eauthor").style.visibility = "hidden";
        document.getElementById("egenre").style.visibility = "hidden";
        document.getElementById("elanguage").style.visibility = "hidden";
        document.getElementById("edescription").style.visibility = "hidden";
        document.getElementById("epublisher").style.visibility = "hidden";
        document.getElementById("epublishedyear").style.visibility = "hidden";
        document.getElementById("ebooktype").style.visibility = "hidden";








        if(title.value.length<=0)
		{
		 document.getElementById("etitle").style.visibility = "visible";
		 valid=false;
		}

		if (genre.value == "select") 
		{
       //If the "Please Select" option is selected display error.
	   document.getElementById("egenre").style.visibility = "visible";
       valid=false;
        }

        if(author.value.length<=0)
		{
		 document.getElementById("eauthor").style.visibility = "visible";
		 valid=false;
		}

		if(authorname.test(author.value)==false)
		{
		document.getElementById("eauthor").style.visibility = "visible";
		valid=false;
		}

      if(!isNaN(author.value))
	      {
	         document.getElementById("eauthor").style.visibility = "visible";
		  valid=false;
	       }


        if (language.value == "select") 
		{
       //If the "Please Select" option is selected display error.
	   document.getElementById("elanguage").style.visibility = "visible";
       valid=false;
        }

        if(description.value.trim() =='') 
        {      
    	 document.getElementById("edescription").style.visibility = "visible";
          
          valid=false;  
        }

      if(!isNaN(description.value))
	      {
	         document.getElementById("edescription").style.visibility = "visible";
		  valid=false;
	       }

	    //    if(splChars.test(description.value)==false )
		// {
		// document.getElementById("edescription").style.visibility = "visible";
		// valid=false;
		// }
         
         if(publisher.value.length<=0)
		{
		 document.getElementById("epublisher").style.visibility = "visible";
		 valid=false;
		}
         
         if(!isNaN(publisher.value))
	      {
	         document.getElementById("epublisher").style.visibility = "visible";
		  valid=false;
	       }

		 if(publishedyear.value.length<=0)
		{
		 document.getElementById("epublishedyear").style.visibility = "visible";
		 valid=false;
		}

		if(isNaN(publishedyear.value))
	      {
	         document.getElementById("epublishedyear").style.visibility = "visible";
		  valid=false;
	       }

	      if(((publishedyear.value)<=1700)||((publishedyear.value)>=2020))
	{
	   document.getElementById("epublishedyear").style.visibility = "visible";
		 valid=false;
	}


	if (booktype.value == "select") 
		{
       //If the "Please Select" option is selected display error.
	   document.getElementById("ebooktype").style.visibility = "visible";
       valid=false;
        }

		
		return valid;



}
function verifybrowse(){
	
           var file = document.getElementById("file");
           var valid=true;

           document.getElementById("efile").style.visibility = "hidden";

            if(file.files.length ==false )
            { 
                //down.innerHTML = "No files selected"; 
                document.getElementById("efile").style.visibility = "visible";
		      valid=false;
            } 
       return valid;
}

