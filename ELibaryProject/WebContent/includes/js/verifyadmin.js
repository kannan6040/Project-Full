/**
 * 
 */
function verifyadminlogin()
{
    var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	var emailId= document.getElementById("emailid");

		        var password= document.getElementById("password");
		        document.getElementById("epassword").style.visibility = "hidden";


	var valid=true;



		 document.getElementById("eemailid").style.visibility = "hidden";


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
     
     if(password.value.length<8)
		{
		 document.getElementById("epassword").style.visibility = "visible";
		 valid=false;
		}

     return valid;


}
