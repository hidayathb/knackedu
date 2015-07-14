function ValidateCategories()
{
    var msg="";
    if (document.getElementById("MainContent_drpcategoryID") != null && document.getElementById("MainContent_drpcategoryID").selectedIndex == 0)
    {
        msg += "Please select category";
    }

    if (document.getElementById("MainContent_txtName") != null && document.getElementById("MainContent_txtName").Value == "") {
        msg += "Please select name";
    }

    if (msg.length == 0)
        return 0;
    else
        alert(msg.toString());

    return 1;
}