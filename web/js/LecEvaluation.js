function evaluation()
{
    var f = document.forms[0];
    console.log(document.forms.length);
        console.log(f.proStatus);

    var status = f.proStatus.options[f.proStatus.selectedIndex].text;
  
    if(f.proStatus.value=="")
    {
        alert("Please select status of project.");
        return;
    }
    else
    if(!(f.proStatus.value=="Full Approval"))
    {   
        if(f.comment.value=="")
            {
                alert("Please state reasons for conditional or failed approval)");
                return;
            }
  
    }
    var c = confirm("You have change status to "+status);
    if(c==true)
    {
        
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServLecStudAcceptance?Option=Evaluation";
        f.submit();
    }
    else
    {
        f.proStatus.value="";
        return
    }
    
}

function chairmanEvaluation(metricNo)
{
    
    var f = document.forms[0];
    f.metricNo.value=metricNo;
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServLecEvaluation?Evaluation=chairman";
    f.submit();
}

function chairmanEvaluation_psm2(metricNo)
{
    
    var f = document.forms[0];
    f.metricNo.value=metricNo;
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServLecEvaluation?Evaluation=chairman_psm2";
    f.submit();
}
function panelEvaluation(metricNo)
{
    
    var f = document.forms[0];
    f.metricNo.value=metricNo;
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServLecEvaluation?Evaluation=panel";
    f.submit();
}

function panelEvaluation_psm2(metricNo)
{
    
    var f = document.forms[0];
    f.metricNo.value=metricNo;
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServLecEvaluation?Evaluation=panel_psm2";
    f.submit();
}