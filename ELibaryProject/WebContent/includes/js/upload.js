/**
 * 
 */
function validatebrowse()
{
	
	var file = document.getElementById("file");
	var valid = true;
	document.getElementById("efile").style.visibility = "hidden";

	if(file.files.length == false)
	{
		document.getElementById("efile").style.visibility = "visible";
		valid = false;
	}
	return valid;
}