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
    
    f.svQuota.value = "";
    f.ev1.value = "";
    f.ev2.value = "";
    f.evTitle.value = "";
    d.getElementById("itemAdd").className = "addHide";
    d.getElementById("itemEdit").className = "addHide";
    d.getElementById("btnAdd").className= "addShow";
}

function isValidQuota(v)
{
   var rePattern = /^[0-9]+$/;
    var re = new RegExp(rePattern);

    if(v.match(re))
       {    return true;}
    else
       {    return false;}
} 

function save(opt,sem){
    var f = document.forms[0];
    f.semester.value = sem;
    var ev1;
    var ev2;
    var evTitle;
    var sv;
    var ev1_psm2;
    var ev2_psm2;
    
   if(!((opt=="delete")||(opt=="edit"))){
          if(opt=="saveChanges")
              {
                   ev1 = f.editEv1.value ;
                   ev2 = f.editEv2.value;
                   ev1_psm2 = f.editEv1_psm2.value ;
                   ev2_psm2 = f.editEv2_psm2.value;
                   evTitle = f.editEvTitle.value;
                   sv = f.editSvQuota.value;
                   
              }
           else if(opt=="add")
               {
                   ev1 = f.ev1.value ;
                   ev2 = f.ev2.value;
                   ev1_psm2 = f.ev1_psm2.value ;
                   ev2_psm2 = f.ev2_psm2.value;
                   evTitle = f.evTitle.value;
                   sv = f.svQuota.value;
               }
          
        if(sv=="")
            {
                alert("Supervision quota cannot be blanked.");
                sv.focus();
                return ;
            }
        if(!(isValidQuota(sv)))
            {
                alert("Please insert a number for quota of supervisor .");
                sv.focus();
                return;
            }

        if(ev1=="")
            {
                alert("Quota of chairman PSM 1 cannot be blanked.");
                ev1.focus();  
                return ;
            }
        if(!(isValidQuota(ev1)))
            {
                alert("Please insert a number for quota of chairman PSM 1 .");
                ev1.focus();  
                return ;
            }

        if(ev2=="")
            {
                alert("Quota of panel PSM 1 cannot be blanked.");
                ev2.focus();  
                return ;
            }
        if(!(isValidQuota(ev2)))
            {
                alert("Please insert a number for quota of panel PSM 1 .");
                ev2.focus();  
                return ;
            }
        if(ev1_psm2=="")
            {
                alert("Quota of chairman PSM 2 cannot be blanked.");
                ev1.focus();  
                return ;
            }
        if(!(isValidQuota(ev1_psm2)))
            {
                alert("Please insert a number for quota of chairman PSM 2 .");
                ev1.focus();  
                return ;
            }

        if(ev2_psm2=="")
            {
                alert("Quota of panel PSM 1 cannot be blanked.");
                ev2.focus();  
                return ;
            }
        if(!(isValidQuota(ev2_psm2)))
            {
                alert("Please insert a number for quota of panel PSM 2.");
                ev2.focus();  
                return ;
            }

        if(evTitle=="")
            {
                alert("Quota of evaluator of project proposal cannot be blanked.");
                evTitle.focus();  
                return ;
            }
        if(!(isValidQuota(evTitle)))
            {
                alert("Please insert a number for quota of evaluator of project propasal.");
                evTitle.focus();  
                return ;
            }
        
    }
    else if(opt=="delete"){
          var c = confirm("Are you sure want to delete ????");
          if(c==false)
              return;
        
    }
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServAdQuotaLec?Option="+opt;
    f.submit();
}