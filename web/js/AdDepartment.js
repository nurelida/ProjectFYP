function checkAddDept()
{
    var f = document.forms[0];
    var name = f.addDeptName.value;
    var code = f.addDeptCode.value;
  
    
    if(name=="")
        {
            alert("Name of department cannot be blanked.");
            name.focus();
            return;
        }
    if(code=="")
    {
        alert("Code of department cannot be blanked.");
            code.focus();
            return;
    }
 
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServAdDepartment?Option=Add";
    f.submit();
}

function showAddAnn()
{   
    var d = document;
    var f = document.forms[0];
   
    d.getElementById("itemAddAnn").className = "addAnnShow";
    d.getElementById("btnAddAnn").className= "addAnnHide";
   
   
}

//function hideAddAnn()
//{   
//    var d = document;
//    var f = document.forms[0];
//    f.addDescription.value="";
//    f.addTitle.value=""; 
//    d.getElementById("itemAddAnn").className = "addAnnHide";
//    d.getElementById("btnAddAnn").className= "addAnnShow";
//}
//function hideEditAnn()
//{   
//    var d = document;
//    var f = document.forms[0];
//    f.editDescription.value="";
//    
//    d.getElementById("itemEditAnn").className = "addAnnHide";
//    d.getElementById("btnAddAnn").className= "addAnnShow";
//   
//}
//
//function editAnnID(value)
//{   
//    var d = document;
//    var f = document.forms[0];
//    f.annID.value = value;
//    
//    
//    //d.getElementById("itemEditAnn").className = "editAnnShow";
//    //d.getElementById("btnAddAnn").className= "addAnnHide";
//  
//   f.method = "POST";
//   f.target = "_self";
//   f.action = "./ServAdAnnouncement?Option=Edit";
//   f.submit(); 
//   
//}
//
//function updateAnnID(value)
//{   
//    var d = document;
//    var f = document.forms[0];
//    f.annID.value = value;
//    
//    f.method = "POST";
//    f.target = "_self";
//    f.action = "./ServAdAnnouncement?Option=Update";
//    f.submit(); 
//   
//}

function deleteDept(value)
{   var d = document;
    var f = document.forms[0];
    f.id.value = value;
   
    var del = confirm("Are you sure you want to delete this item.");
    if(del==true)
    { 
      f.method = "POST";
      f.target = "_self";
      f.action = "./ServAdDepartment?Option=DeleteDept";
      f.submit(); 
    }
    
}