function showAdd()
{   
    var d = document;
    var f = document.forms[0];
   
    d.getElementById("itemAdd").className = "addShow";
    d.getElementById("btnAdd").className= "addHide";
}


function hideAdd()
{   
    var d = document;
    var f = document.forms[0];
     
    d.getElementById("itemAdd").className = "addHide";
    d.getElementById("btnAdd").className= "addShow";
    d.getElementById("itemEdit").className = "addHide";
}

function save(opt,roomID)
{
    var f = document.forms[0];
    f.roomID.value =  roomID;
    if(!((opt=="delete")&&(opt=="edit")))
        {   var room;
            if(opt=="add")
                room=f.demoRoom.value;
            else if(opt=="saveChanges")
                room=f.editDemoRoom.value;
            if(room=="")
            {
                alert("Presentation room cannot be blanked.")
                return;
            }
        }
        
    if(opt=="delete")
        {
            var c = confirm("Are you sure want to delete ???");
            if(c==false)
                return;
        }
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServAdDemoRoom?Option="+opt;
    f.submit();
    
    
}