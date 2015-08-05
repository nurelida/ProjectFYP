function assignEV(value,i,row)
{
    var f = document.forms[0];
    var evNo;
    var lecNme;
   
    if(row<=1)
        {
            evNo = f.asgEv.value;
            lecName = f.asgEv.options[f.asgEv.selectedIndex].text;
        }
    else
        {
            evNo = f.asgEv[i].value;
            lecName = f.asgEv[i].options[f.asgEv[i].selectedIndex].text;
        }
     
    //var i = f.asgEv.selectedIndex;  
    if(evNo=="")
    {
        alert("Please select evaluator !!!! ");
        return;
    }
    
    var c = confirm("You have change the evaluator to "+lecName+".");
    if(c==true)
    {
        f.proID.value=value;
        f.evNo.value=evNo;
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServAdAsgEvT";
        f.submit(); 
    
    }
}