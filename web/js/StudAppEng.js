function validate()
{
    var f = document.applyEng;
    var reason = f.reason.value;
    
    if(reason=="")
        {
            alert("Reason field cannot be blanked. Please filled in before submit form.");
            reason.focus();
        }
}
function applyEngForm()
{
    validate();
    var f=document.applyEng;
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServStudAppEng?Option=Submit";
    f.submit();
}

function showChg()
{
    
    var f=document.applyEng;
    f.reason.readOnly = false;
    document.getElementById("savediv").hidden=false;
    
   
}

function saveChanges()
{
    validate();
    var f=document.applyEng;
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServStudAppEng?Option=Update";
    f.submit();
}