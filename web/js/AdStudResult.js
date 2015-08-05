function choosePSM(value)
{
    
    var f = document.forms[0];
    if(!(value=="")){
    f.selectPSM.value = value;
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServAdStudResult?Option=selectPSM";
    f.submit();
    }
    return;
}

function chooseSemester(value)
{
    var f = document.forms[0];
    if(!(value=="")){
    f.selectSemester.value = value;
    f.selectPSM.value = f.psm.value;
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServAdStudResult?Option=selectSemester";
    f.submit();
    }
    return;
}
function moveToPSM2(value,metric,studName)
{
    var f = document.forms[0];
    f.psm2_semester.value=value;
    f.psm2_metric.value=metric;
    var c = confirm("Are you sure want to move "+studName+" metric number "+metric+" to PSM 2 for semester "+value);
    if(c==true){
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServAdStudResult?Option=psm1Pass";
        f.submit();
    }
    else 
        return;
    
  
}
