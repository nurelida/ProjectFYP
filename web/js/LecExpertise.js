function checkAddExpertise()
{
    var f = document.editExpertise;
    var description = f.addDescription.value;
    var proField = f.addProField.value;
    
    if(proField=="")
        {
            alert("Expertise Field must be select.");
            proFiled.focus();
            return;
        }
    if(description=="")
        {
            alert("Description Field cannot be blanked.");
            description.focus();
            return;
        }
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServLecExpertise?Option=Add";
    f.submit();
    
}

function showAddExpertise()
{   
//    var d = document;
//    var f = document.editExpertise;
    
      document.getElementById("addexp").classList.remove("hide");
      document.getElementById("addexp").classList.add("show");
      document.getElementById("btnaddexp").classList.remove("show");
      document.getElementById("btnaddexp").classList.add("hide");
      
}

function hideAddExpertise()
{   
    var d = document;
    var f = document.editExpertise;
    f.addDescription.value="";
    f.addProField.value=""; 
    d.getElementById("addexp").classList.remove("show");
    d.getElementById("addexp").classList.add("hide");
    document.getElementById("btnaddexp").classList.remove("hide");
      document.getElementById("btnaddexp").classList.add("show");
}
function hideEditExpertise()
{   
    var d = document;
    var f = document.editExpertise;
    f.editDescription.value="";
    //f.editProField.value=""; 
    d.getElementById("editexp").classList.remove("show");
    d.getElementById("editexp").classList.add("hide");
    document.getElementById("btnaddexp").classList.remove("hide");
      document.getElementById("btnaddexp").classList.add("show");
    
   
}

function editExpertiseID(value)
{   
    var d = document;
    var f = editExpertise;
    f.expertiseID.value = value;
    
   document.getElementById("btnaddexp").classList.remove("show");
      document.getElementById("btnaddexp").classList.add("hide");
      
    //d.getElementById("itemEditExpertise").className = "editExpertiseShow";
    //d.getElementById("btnAddExpertise").className= "addExpertiseHide";
    //alert(f.expertiseID.value);
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServLecExpertise?Option=Edit";
    f.submit(); 
   
}

function updateExpertiseID(value)
{   
    var d = document;
    var f = document.editExpertise;
    var description = f.editDescription.value;
 
    
    
    if(description=="")
        {
            alert("Description Field cannot be blanked.");
            description.focus();
            return;
        }
    
    f.expertiseID.value = value;
    
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServLecExpertise?Option=Update";
    f.submit(); 
   
}

function deleteExpertiseID(value)
{   
    
    var d = document;
    var f = document.editExpertise;
    f.expertiseID.value = value;
    
    var del = confirm("Are you sure you want to delete this item.");
    if(del==true)
    { f.method = "POST";
      f.target = "_self";
      f.action = "./ServLecExpertise?Option=Delete";
      f.submit(); 
    }
    
}