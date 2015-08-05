var n = 0;

function chg(obj, hid){
       
	if(obj.style.backgroundColor == "rgb(255,146,182)" || obj.style.backgroundColor == "rgb(255, 146, 182)"){
            obj.style.backgroundColor = "rgb(102, 255, 102)";
            hid.value = "1";
	}
	else if(obj.style.backgroundColor == "rgb(102,255,102)" || obj.style.backgroundColor == "rgb(102, 255, 102)"){
            obj.style.backgroundColor = "rgb(255, 146, 182)";
            hid.value = "0";
        }
        
}

function saveTimeTable(value)
{
    
      var f = document.lecTT;
      f.method = "POST";
      f.target = "_self";
      f.action = "./ServLecTimeTable?Option="+value;
      f.submit();
}

function showSelectEv(value){
    if(!(value=="")){
        document.lecTT.selectedEv.disabled=false;
    }
    else{
        document.lecTT.selectedEv.disabled=true;
        return;
    }  
}

function selectEv(value){
      if(!(value=="")){
        var f = document.lecTT;
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServLecTimeTable?Option="+value;
        f.submit(); 
      }
      else 
          return;
      
      
}
function viewTitle(value){
        var f = document.lecTT;
        f.metric.value=value;
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServLecTimeTable?Option=viewTitle";
        f.submit(); 
}
