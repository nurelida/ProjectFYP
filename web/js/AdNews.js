function btnAddNews(){
    document.getElementById("tableadd").classList.remove("hide");
    document.getElementById("tableadd").classList.add("show");
    document.getElementById("checkaddnews").classList.remove("hide");
    document.getElementById("checkaddnews").classList.add("show");
    document.getElementById("btnaddnews").classList.remove("show");
    document.getElementById("btnaddnews").classList.add("hide");
}
function checkAddNews()
{
    var f = document.forms[0];
    var content = f.addContent.value;
    var title = f.addTitle.value;
    
    
    if(title=="")
        {
            alert("Name title cannot be blanked.");
            title.focus();
            return;
        }
    if(content=="")
        {
            alert("Content Field cannot be blanked.");
            description.focus();
            return;
        }
    f.enctype="multipart/form-data";
    f.method = "POST";
    f.target = "_self";
    f.action = "./FileUploadHandler?Option=Add";
    f.submit();
}
