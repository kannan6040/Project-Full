function userloginvalidate() 
{
	var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	var emailId= document.getElementById("emailId");
    var password= document.getElementById("password");
    var valid=true;
	
	
	 document.getElementById("id1").style.visibility = "hidden";
     document.getElementById("id2").style.visibility = "hidden";
				
	if(emailId.value.length<=0)
		{
		 document.getElementById("id1").style.visibility = "visible";
		 valid=false;
		}
	if(emailPattern.test(emailId.value)==false )
			{
			document.getElementById("id1").style.visibility = "visible";
			valid=false;
			}
	if(password.value.length<=0)
		{
		document.getElementById("id2").style.visibility = "visible";
		 valid=false;
		}
	return valid;
	
}

function userregvalidate()
{
	var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	var phoneno = /^\(?([7-9]{1})\)??([0-9]{9})$/;
	var emailId= document.getElementById("emailid");
	var username= document.getElementById("username");
	var phone= document.getElementById("phone");
	var gender= document.getElementById("gender");
	var occupation= document.getElementById("occupation");
	var address= document.getElementById("address");
	var state= document.getElementById("state");
	var age= document.getElementById("age");
	

	var valid=true;
	
	
	 document.getElementById("eemailid").style.visibility = "hidden";
     document.getElementById("eusername").style.visibility = "hidden";
     document.getElementById("ephone").style.visibility = "hidden";
     document.getElementById("eoccupation").style.visibility = "hidden";
     document.getElementById("eaddress").style.visibility = "hidden";
     document.getElementById("estate").style.visibility = "hidden";
     document.getElementById("eage").style.visibility = "hidden";
     
     if(emailId.value.length<=0)
		{
		 document.getElementById("eemailid").style.visibility = "visible";
		 valid=false;
		}
     if(username.value.length<=0)
		{
		 document.getElementById("eusername").style.visibility = "visible";
		 valid=false;
		}
     if(phone.value.length<=0)
		{
		 document.getElementById("ephone").style.visibility = "visible";
		 valid=false;
		}
     if(address.value.trim() =='') 
     {      
    	 document.getElementById("eaddress").style.visibility = "visible";
          
          valid=false;       
     }
     if(age.value.length<=0)
		{
		 document.getElementById("eage").style.visibility = "visible";
		 valid=false;
		}
     if(emailPattern.test(emailId.value)==false )
		{
		document.getElementById("eemailid").style.visibility = "visible";
		valid=false;
		}
     
   if(!(phone.value.match(phoneno)))
   {
	   document.getElementById("ephone").style.visibility = "visible";
		 valid=false;
   }
   if (occupation.value == "select") {
       //If the "Please Select" option is selected display error.
	   document.getElementById("eoccupation").style.visibility = "visible";
       valid=false;
   }
   if (state.value == "select") {
       //If the "Please Select" option is selected display error.
	   document.getElementById("estate").style.visibility = "visible";
       valid=false;
   }
   if(isNaN(age.value))
	{
	   document.getElementById("eage").style.visibility = "visible";
		 valid=false;
	}
   if(((age.value)<=0)||((age.value)>100))
	{
	   document.getElementById("eage").style.visibility = "visible";
		 valid=false;
	}
 




	return valid;
}


function verifymodifyuser()
{
	        var username= document.getElementById("username");
	        var password= document.getElementById("password");
	        var confirmpassword= document.getElementById("confirmpassword");

	        var phoneno = /^\(?([7-9]{1})\)??([0-9]{9})$/;
		    var phone= document.getElementById("phone");

			var address= document.getElementById("address");
			 var occupation= document.getElementById("occupation");
			 var state= document.getElementById("state");
			 var age= document.getElementById("age");


         var valid=true;
     document.getElementById("eusername").style.visibility = "hidden";
      document.getElementById("epassword").style.visibility = "hidden";
      document.getElementById("econfirmpassword").style.visibility = "hidden";

     document.getElementById("ephone").style.visibility = "hidden";
     document.getElementById("eoccupation").style.visibility = "hidden";
     document.getElementById("eaddress").style.visibility = "hidden";
          document.getElementById("estate").style.visibility = "hidden";
               document.getElementById("eage").style.visibility = "hidden";


    if(username.value.length<=0)
		{
		 document.getElementById("eusername").style.visibility = "visible";
		 valid=false;
		}
		
		if(password.value.length<8)
		{
		 document.getElementById("epassword").style.visibility = "visible";
		 valid=false;
		}
		
		if(confirmpassword.value.length<8)
		{
		 document.getElementById("econfirmpassword").style.visibility = "visible";
		 valid=false;
		}
		if (password.value != confirmpassword.value) {
		 document.getElementById("econfirmpassword").style.visibility = "visible";
		 valid=false;
        }
		if(phone.value.length<=0)
		{
		 document.getElementById("ephone").style.visibility = "visible";
		 valid=false;
		}
		if(!phone.value.match(phoneno))
       {
	   document.getElementById("ephone").style.visibility = "visible";
		 valid=false;
        }
		  if(address.value.trim() =='') 
     {      
    	 document.getElementById("eaddress").style.visibility = "visible";
          
          valid=false;       
     }
     if (occupation.value == "select") {
       //If the "Please Select" option is selected display error.
	   document.getElementById("eoccupation").style.visibility = "visible";
       valid=false;
   }
   if (state.value == "select") {
       //If the "Please Select" option is selected display error.
	   document.getElementById("estate").style.visibility = "visible";
       valid=false;
   }
   if(isNaN(age.value))
	{
	   document.getElementById("eage").style.visibility = "visible";
		 valid=false;
	}
   if(((age.value)<=0)||((age.value)>100))
	{
	   document.getElementById("eage").style.visibility = "visible";
		 valid=false;
	}

			return valid;

}