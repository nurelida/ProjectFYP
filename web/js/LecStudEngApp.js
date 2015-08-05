function addSvReason()
{
    var f = document.applyEng;
    var svReason = f.svReason.value;
    
    if(svReason=="")
        {
            alert("Reason field cannot be blanked. Please filled in before submit form.");
            svReason.focus();
        }
   
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServLecSTudEngApp?Option=Submit";
    f.submit();
}



function showChg()
{
    var d = document;
    var f=document.applyEng;
    f.svReasonEdit.readOnly = false;
    
    d.getElementById("chgItem").className = "show";
    d.getElementById("editItem").className = "hide";
}

function saveChanges()
{
    var f = document.applyEng;
    var svReasonEdit = f.svReasonEdit.value;
    
    if(svReasonEdit=="")
        {
            alert("Reason field cannot be blanked. Please filled in before submit form.");
            svReasonEdit.focus();
        }
   
   
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServLecSTudEngApp?Option=Update";
    f.submit();
}