function SA(value,obj,staffNo)
{
    var c = confirm("Status "+ value +" was change to "+ obj+".");
    if( c== true)
        {
          var f = document.forms[0];
          f.staffNo.value=staffNo;
          f.lecActive.value=obj;
          f.method = "POST";
          f.target = "_self";
          f.action = "./ServAdView?Option=SetActive";
          f.submit();
        }
    else
        return;
}
function viewStud(value)
{
    var f = document.forms[0];
   
        
        f.metricNo.value=value;
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServAdView?Option=ViewStud";
        f.submit();
}

function viewStudTitle(value)
{
    var f = document.forms[0];
        f.metricNo.value=value;
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServAdView?Option=ViewStudTitle";
        f.submit();
}

function deleteStud(value,name)
{
        var f = document.forms[0];
        
        var c = confirm("Are you sure want to delete "+name+"from data base.")
        if(c==true){
           
            f.metricNo.value=value;
            f.method = "POST";
            f.target = "_self";
            f.action = "./ServAdView?Option=DeleteStud";
            f.submit();
       }
       else
           return;
}

function viewLec(value)
{
    var f = document.forms[0];
        f.staffNo.value=value;
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServAdView?Option=ViewLec";
        f.submit();
}

function deleteLec(value,name)
{
        var f = document.forms[0];
   
        var c = confirm("Are you sure want to delete "+name+" from data base.")
        if(c==true){
            f.staffNo.value=value;
            f.method = "POST";
            f.target = "_self";
            f.action = "./ServAdView?Option=DeleteLec";
            f.submit();
       }
       else
           return;
}
function viewAppForm(value)
{
    var f = document.forms[0];
   
       f.metricNo.value=value;
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServAdView?Option=ViewApp";
        f.submit();
   
}

function viewEvPSM1(value)
{
    var f = document.forms[0];
   
       f.metricNo.value=value;
       f.method = "POST";
       f.target = "_self";
       f.action = "./ServAdView?Option=PSM1";
       f.submit();
   
}
function viewEvPSM2(value)
{
    var f = document.forms[0];
        f.metricNo.value=value;
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServAdView?Option=PSM2";
        f.submit();
   
}


function choosePSM(value)
{
    
    var f = document.forms[0];
    if(!(value=="")){
    f.selectPSM.value = value;
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServAdView?Option=selectPSM";
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
    f.action = "./ServAdView?Option=selectSemester";
    f.submit();
    }
    return;
}