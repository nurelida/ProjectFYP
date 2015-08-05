function checkAddAnn()
{
    var f = document.forms[0];
    var description = f.addDescription.value;
    var title = f.addTitle.value;
    var show = f.annShow.value;
    
    if(title==="")
        {
            alert("Announcement title cannot be blanked.");
            title.focus();
            return;
        }
    if(description==="")
        {
            alert("Description Field cannot be blanked.");
            description.focus();
            return;
        }
        
    if(show==="")
        {
            alert("Please select Hide / Show");
            show.focus();
            return;
        }
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServAdAnnouncement?Option=Add";
    f.submit();
}

function showAddAnn()
{   
    var d = document;
    var f = document.forms[0];
   
    d.getElementById("itemAddAnn").className = "addAnnShow";
    d.getElementById("btnAddAnn").className= "addAnnHide";
   
   
}

function hideAddAnn()
{   
    var d = document;
    var f = document.forms[0];
    f.addDescription.value="";
    f.addTitle.value=""; 
    d.getElementById("itemAddAnn").className = "addAnnHide";
    d.getElementById("btnAddAnn").className= "addAnnShow";
}
function hideEditAnn()
{   
    var d = document;
    var f = document.forms[0];
    f.editDescription.value="";
    
    d.getElementById("itemEditAnn").className = "addAnnHide";
    d.getElementById("btnAddAnn").className= "addAnnShow";
   
}

function editAnnID(value)
{   
    var d = document;
    var f = document.forms[0];
    f.annID.value = value;
    
    
    //d.getElementById("itemEditAnn").className = "editAnnShow";
    //d.getElementById("btnAddAnn").className= "addAnnHide";
  
   f.method = "POST";
   f.target = "_self";
   f.action = "./ServAdAnnouncement?Option=Edit";
   f.submit(); 
   
}

function updateAnnID(value)
{   
    var d = document;
    var f = document.forms[0];
    f.annID.value = value;
    
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServAdAnnouncement?Option=Update";
    f.submit(); 
   
}

function deleteAnnID(value)
{   var d = document;
    var f = document.forms[0];
    f.annID.value = value;
    
    var del = confirm("Are you sure you want to delete this item.");
    if(del===true)
    { 
      f.method = "POST";
      f.target = "_self";
      f.action = "./ServAdAnnouncement?Option=Delete";
      f.submit(); 
    }
    
}