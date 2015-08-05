function comfirmdeletecriteria(value,name,section){
    var f=document.forms[0];
    var del = confirm("Are you sure you want to delete "+name+" from "+section+"?");
    if(del==true){
        
        document.body.innerHTML += '<form id="deletecriteria"  action="./ServAdEvalScheme?Option=DeleteCriteria" method="POST">' +
                                             '<input type="hidden" name="deleteidcri" value="'+value+'">' +
                                         '</form>';
             document.getElementById("deletecriteria").submit();
        
//        f.method = "POST";
//        f.target = "_self";
//        f.action = "./ServAdEvalScheme?Option=DeleteCriteria";
//        f.submit();

    }
    else{
        
        return;
    }
    
}
function deletescheme(value,valueid){
        var f = document.forms[0];
        
        var com=confirm("Are you sure want to delete evaluation scheme : "+value);
        if(com==true){
            f.selectedid.value=valueid;
            f.method = "POST";
            f.target = "_self";
            f.action = "./ServAdEvalScheme?Option=DeleteScheme";
            f.submit();
            
        }
        else{
            return;
        }
        
    
}
function viewScheme(value,valueid)
{
        
        var f = document.forms[0];
        
        f.scheme.value = value;
        f.selectedid.value=valueid;
       
       
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServAdEvalScheme?Option=ViewScheme";
        f.submit();
}
function viewGenScheme(value,valueid)
{
    var f = document.forms[0];
        
        f.scheme.value = value;
        f.selectedid.value=valueid;
       
       
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServAdEvalScheme?Option=ViewGenScheme";
        f.submit();
}
function viewSection(scheme,schemeid,value,valueid)
{
    
  
    if(scheme!=""&&value!=""&&valueid!=""){
     
    document.body.innerHTML += '<form id="frm_viewsectionscheme"  action="./ServAdEvalScheme?Option=ViewSection" method="POST">' +
                                             '<input type="hidden" name="section" value="'+value+'">' +
                                             '<input type="hidden" name="sectionid" value="'+valueid+'">' +
                                             '<input type="hidden" name="scheme" value="'+scheme+'">' +
                                             '<input type="hidden" name="idscheme" value="'+schemeid+'">' +
              
                 
                                         '</form>';
             document.getElementById("frm_viewsectionscheme").submit();
         }
         else{
             return;
         }
  
}
function updateScheme()
{
    var f=document.forms[0];
    
    f.method="POST";
    f.target="_self";
    f.action="./ServAdEvalScheme?Option=UpdateScheme";
    f.submit();
}
function editScheme(value)
{
    
        var f = document.forms[0];
        
        f.editidscheme.value = value;
    
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServAdEvalScheme?Option=EditScheme";
        f.submit();
}
function addcriteria(){
    valid=true;
    var f=document.forms[0];
    var addcriteria=document.getElementById("addcriinput").value;
    if(addcriteria==""){
        alert("Please Insert Criteria Field");
        valid=false;
        return;
    }
    
    
    
    if(valid&&addcriteria!=""&&f.selectedidsection.value!=""&&f.selectedsection.value!=""&&f.selectedidschemesection.value!=""){
        alert("masuk");
        document.body.innerHTML += '<form id="frm_addcriteria"  action="./ServAdEvalScheme?Option=AddCriteria" method="POST">' +
                                             '<input type="hidden" name="selectedidsection" value="'+f.selectedidsection.value+'">' +
                                             '<input type="hidden" name="selectedsection" value="'+f.selectedsection.value+'">' +
                                             '<input type="hidden" name="selectedidschemesection" value="'+f.selectedidschemesection.value+'">' +
                                             '<input type="hidden" name="addcriteriainput" value="'+addcriteria+'">' +
                      
                 
                                         '</form>';
             document.getElementById("frm_addcriteria").submit();
    }
        
    return;
    
}
function generateScheme(value){
    
    if(value!=""){
        document.body.innerHTML += '<form id="frm_generateScheme"  action="./ServAdEvalScheme?Option=GenerateScheme" method="POST">' +
                                             '<input type="hidden" name="idscheme" value="'+value+'">' +
                                         '</form>';
             document.getElementById("frm_generateScheme").submit();
    }
   
    return;
}
function addsection()
{
    var f=document.forms[0];
    var addsectcode=document.getElementById("addsectcode").value;
    var addsectdesc=document.getElementById("addsectdesc").value;
    var addsectrole=document.evalScheme.addsectrole.value;
    var addsectmark=document.getElementById("addsectmark").value;
    var totalmark=document.getElementById("mark").value;
    var currtotal;
    valid=true;
    validatorMark=/^[0-9]+$/;
   
    if(addsectmark.match(validatorMark)){
        currtotal=parseInt(addsectmark)+parseInt(totalmark);
        
        if(currtotal>100){
        alert("Exceed maximum value of total mark. Current Total Mark :"+totalmark+"/100");
        valid=false;
        return;
        }
    }
    else{
        alert("Invalid Number Section Percentage Value");
        valid=false;
        return;
    }
    if(addsectcode==""){
        alert("Please Insert Section Code");
        valid=false;
        return;
    }
    if(addsectdesc==""){
        alert("Please Insert Section Description");
        valid=false;
        return;
    }
    if(addsectrole==""){
        alert("Please Select Section Role");
        valid=false;
        return;
    }
    if(addsectmark==""){
        alert("Please Insert Section Percentage");
        valid=false;
        return;
    }
   
  if(valid&&f.selectedscheme.value!=""&&f.selectedidscheme.value!=""){
    
    
  
   document.body.innerHTML += '<form id="frm_addtitlescheme"  action="./ServAdEvalScheme?Option=AddTitleScheme" method="POST">' +
                                             '<input type="hidden" name="addCode" value="'+addsectcode+'">' +
                                             '<input type="hidden" name="addDesc" value="'+addsectdesc+'">' +
                                             '<input type="hidden" name="addRole" value="'+addsectrole+'">' +
                                             '<input type="hidden" name="addMark" value="'+addsectmark+'">' +
                                             '<input type="hidden" name="selectedscheme" value="'+f.selectedscheme.value+'">' +
                                             '<input type="hidden" name="selectedidscheme" value="'+f.selectedidscheme.value+'">' +
                 
                                         '</form>';
             document.getElementById("frm_addtitlescheme").submit();
   }
//    f.method="POST";
//    f.target="_self";
//    f.action="./ServAdEvalScheme?Option=AddTitleScheme";
//    f.submit();
    
    
    
}
function showaddcrisection(){
    document.getElementById("addcrisection").classList.remove("hide");
    document.getElementById("addcrisection").classList.add("show");
    document.getElementById("btnshowaddcrisection").classList.remove("show");
    document.getElementById("btnshowaddcrisection").classList.add("hide");
    document.getElementById("divcrischeme").classList.remove("hide");
    document.getElementById("divcriescheme").classList.add("show"); 
    
}
function canceladdcrisection(){
    document.getElementById("addcrisection").classList.remove("show");
    document.getElementById("addcrisection").classList.add("hide");
    document.getElementById("btnshowaddcrisection").classList.remove("hide");
    document.getElementById("btnshowaddcrisection").classList.add("show");
    
}
function addinputtitlescheme()
{
  
    var f=document.forms[0];
    var sectcode=f.sectcode;
    var desc=f.inputsectdesc;
    var role=f.inputsectrole;
    var mark=f.inputsectmark;
    alert(sectcode);
    if(sectcode==""){
        alert("Please Fill Section Code");
        code.focus();
        return;
    }
    return;
//    f.method="POST";
//    f.target="_self";
//    f.action="./ServAdEvalScheme?Option=AddTitleScheme";
//    f.submit();
    
}
function addScheme()
{
   
        var f = document.forms[0];
        var name=f.addScheme.value;
        var desc=f.addSchemeDesc.value;
        
       
        if(name=="")
        {
            alert("Please Enter Evaluation Scheme Name");
            return;
        }
        if(desc=="")
        {
            alert("Please Enter Evaluation Scheme Description");
            return;
        }
       
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServAdEvalScheme?Option=AddScheme";
        f.submit();
}
function addtitlescheme()
{
   document.getElementById("addtitlescheme").classList.remove("hide");
    document.getElementById("addtitlescheme").classList.add("show"); 
    document.getElementById("btnaddtitlescheme").classList.remove("show");
    document.getElementById("btnaddtitlescheme").classList.add("hide"); 
    document.getElementById("divtitlescheme").classList.remove("hide");
    document.getElementById("divtitlescheme").classList.add("show"); 
}
function showAddScheme()
{
    document.getElementById("itemAddScheme").classList.remove("hide");
    document.getElementById("itemAddScheme").classList.add("show");
    document.getElementById("showaddscheme").classList.remove("show");
    document.getElementById("showaddscheme").classList.add("hide");
    
}
function cancel()
{
    document.getElementById("itemAddScheme").classList.remove("show");
    document.getElementById("itemAddScheme").classList.add("hide");
    document.getElementById("showaddscheme").classList.remove("hide");
    document.getElementById("showaddscheme").classList.add("show");
    document.getElementById("divtitlescheme").classList.remove("show");
    document.getElementById("divtitlescheme").classList.add("hide");
    document.getElementById("addtitlescheme").classList.remove("show");
    document.getElementById("addtitlescheme").classList.add("hide");
    document.getElementById("btnaddtitlescheme").classList.remove("hide");
    document.getElementById("btnaddtitlescheme").classList.add("show");
    
}
function canceleditscheme()
{
    document.getElementById("itemEditScheme").classList.remove("show");
    document.getElementById("itemEditScheme").classList.add("hide");
    
    
}
function check(id){
    var x=document.evalScheme.elements[id];
    
        if(x[0].checked){
            return x[0].value;
        }
        else if(x[1].checked){
            return x[1].value;
        }
        else if(x[2].checked){
            return x[2].value;
        }
        else if(x[3].checked){
            return x[3].value;
        }
        else if(x[4].checked){
            return x[4].value;
        }
        else if(x[5].checked){
            return x[5].value;
        }
        else{
            return 0;
        }
       
        
    
  
}
function add(id,input,value){
    var f=document.evalScheme;
    var x=check(input);
 
    var tot=parseInt(document.getElementById(id+"_m").value);
    
//    alert(x);
    document.getElementById(id+"_m").value=(tot-x)+parseInt(value);
    
   
}


