/**
 * 
 */

function validateAdminReg()
{
	
	
	var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	var emailId= document.getElementById("emailid");
	var username= document.getElementById("username");
	var password= document.getElementById("password");
	var confirmpassword= document.getElementById("confirmpassword");

	var phone= document.getElementById("phone");
	var phoneno = /^\(?([7-9]{1})\)??([0-9]{9})$/;



var valid=true;


	document.getElementById("eemailid").style.visibility = "hidden";
     document.getElementById("eusername").style.visibility = "hidden";
     document.getElementById("epassword").style.visibility = "hidden";
     document.getElementById("ephone").style.visibility = "hidden";
     document.getElementById("econfirmpassword").style.visibility = "hidden";



if(emailId.value.length<=0)
{
document.getElementById("eemailid").style.visibility = "visible";
valid=false;
}

if(emailPattern.test(emailId.value)==false )
{
document.getElementById("eemailid").style.visibility = "visible";
valid=false;
}
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
if(confirmpassword.value.length<=0)
{
document.getElementById("econfirmpassword").style.visibility = "visible";
valid=false;
}
if(password.value != confirmpassword.value)
{
document.getElementById("econfirmpassword").style.visibility = "visible";
valid=false;
}
 if(phone.value.length<=0)
{
document.getElementById("ephone").style.visibility = "visible";
valid=false;
}
if(!(phone.value.match(phoneno)))
   {
  document.getElementById("ephone").style.visibility = "visible";
valid=false;
   }

return valid;

}


function validatemodifyadmin()
{
		        var username= document.getElementById("username");

                var newpassword= document.getElementById("newpassword");
	            var confirmpassword= document.getElementById("confirmpassword");
                var phoneno = /^\(?([7-9]{1})\)??([0-9]{9})$/;
		        var phone= document.getElementById("phone");
                var valid=true;

                document.getElementById("eusername").style.visibility = "hidden";

                document.getElementById("enewpassword").style.visibility = "hidden";
                document.getElementById("econfirmpassword").style.visibility = "hidden";
                document.getElementById("ephone").style.visibility = "hidden";
         if(username.value.length<=0)
		{
		 document.getElementById("eusername").style.visibility = "visible";
		 valid=false;
		}
        if(newpassword.value.length<8)
		{
		 document.getElementById("enewpassword").style.visibility = "visible";
		 valid=false;
		}
		
		if(confirmpassword.value.length<8)
		{
		 document.getElementById("econfirmpassword").style.visibility = "visible";
		 valid=false;
		}
		if (newpassword.value != confirmpassword.value) {
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
return valid;


}
