function studApprove()
{
    var f = document.forms[0];
    var status = f.status.value;
    if(status=="")
    {
        alert("Please select status.");
        return;
    }
    
    var c = confirm("You have change status to "+status);
    if(c==true)
    {
       
       
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServAdViewStudApp";
        f.submit();
    }
    else
    {
        f.status.value="";
        return
    }
    
}