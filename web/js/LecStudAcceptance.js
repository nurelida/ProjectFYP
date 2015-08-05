function studAccept(value)
{
    var f = document.studentAcceptance;
    var status = f.status.value;
    if(status=="")
    {
        alert("Please select status.");
        return;
    }
   
    var c = confirm("You have change status to "+status);
    if(c==true)
    {
       
        f.metric.value=value;
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServLecStudAcceptance?Option=Status";
        f.submit();
    }
    else
    {
        f.status.value="";
        return
    }
    
}
function submit(value,sem){
    var f = document.studentAcceptance;
    f.selectSemester.value = sem;
    f.selectPSM.value = f.psm.value;
    var c = confirm("Submit evaluation mark ?");
    if(c==true)
    {
       
        f.metric.value=value;
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServLecStudAcceptance?Option=Submit";
        f.submit();
    }
    else
    {
        return;
    }
    
}

function viewStud(value)
{
    var f = document.studentAcceptance;
   
    
        f.metric.value=value;
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServLecStudAcceptance?Option=ViewStud";
        f.submit();
}

function viewTitle(value)
{
    var f = document.studentAcceptance;
   
        f.metric.value=value;
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServLecStudAcceptance?Option=ViewTitle";
        f.submit();
   
}

function viewAppForm(value)
{
    var f = document.studentAcceptance;
   
        f.metric.value=value;
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServLecStudAcceptance?Option=ViewAppForm";
        f.submit();
   
}

function evaluate_psm1(value)
{
    var f = document.studentAcceptance;
   
        f.metric.value=value;
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServLecStudAcceptance?Option=Evaluate_psm1";
        f.submit();
   
}

function evaluate_psm2(value)
{
    var f = document.studentAcceptance;
   
        f.metric.value=value;
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServLecStudAcceptance?Option=Evaluate_psm2";
        f.submit();
   
}


function choosePSM(value)
{
    
    var f = document.studentAcceptance;
    if(f.psm.value==""){
        f.semester.disabled=true;
    }
    if(!(value=="")){
    f.selectPSM.value = value;
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServLecStudAcceptance?Option=selectPSM";
    f.submit();
    }
    return;
}

function chooseSemester(value)
{
    var f = document.studentAcceptance;
    if(!(value=="")){
    f.selectSemester.value = value;
    f.selectPSM.value = f.psm.value;
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServLecStudAcceptance?Option=selectSemester";
    f.submit();
    }
    return;
}

