function val2() 
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

function validate2()
{
	var cars = document.getElementById("cars");
	var phone=document.getElementById("phone");
	var phoneno = /^\(?([7-9]{1})\)??([0-9]{9})$/;
	var name=document.getElementById("name").value;
    if (cars.value == "select") {
        //If the "Please Select" option is selected display error.
        alert("Please select an option!");
return false;
    }
//    if((phone.value.match(phoneno)))
//          {
//        return true;
//          }
//        else
//          {
//          alert("message");
//          }
    if(isNaN(name))
    	{
    	alert("Nan");
    	return true;
    	}
    else
    	{
    	alert("Number");
    	return false;
    	}
    
    
    
	
}