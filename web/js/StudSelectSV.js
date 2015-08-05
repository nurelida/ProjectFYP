function SV(Name,ID)
{ 
  
 
  var c = confirm("You was selected "+Name+" as your supervisor.")
  
  
  if(c==true)
 {

    document.body.innerHTML += '<form id="frm_selectSV"  action="./ServStudSelectSV?Option=Select" method="POST">' +
                                      '<input type="hidden" name="lecID" value="'+ID+'">' +
                                     '</form>';
             document.getElementById("frm_selectSV").submit();
    
 }
    else 
    return;
}
    
function reApply()
{
  
    var f = document.forms[0];
    
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServStudSelectSV?Option=ReApply";
    f.submit();
}
function goToPage(value){
    var f=document.page;
    f.pageid.value=value;
    f.method="POST";
    f.target="_self";
    f.action="./ServStudSelectSV?Option=ViewLec";
    f.submit();
}