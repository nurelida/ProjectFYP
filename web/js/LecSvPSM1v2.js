
function checkm(id){
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

function add(id,input,valuem,valuep,valuetotm){
    var f=document.evalScheme;
    var x=checkm(input);
    
    
    var totm=parseInt(document.getElementById(id+"_m").value);
    //var totp=parseInt(document.getElementById(id+"_p").value);
    

    document.getElementById(id+"_m").value=(totm-x)+parseInt(valuem);
    var tempP=(parseInt(document.getElementById(id+"_m").value)/parseInt(valuetotm))*parseInt(valuep);
    document.getElementById(id+"_p").value=tempP;
   
}
function update(){
    var f=document.evalScheme;
    
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServLecSvPSM?Option=UpdateEvaluatePSM1";
    f.submit();
    
}
function submit(){
    var f=document.evalScheme;
    
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServLecSvPSM?Option=SubmitEvaluatePSM1";
    f.submit();
    
}
function save(){
    var f=document.evalScheme;
    
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServLecSvPSM?Option=SaveEvaluatePSM1";
    f.submit();
    
}