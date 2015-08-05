function save()
{
    var f= document.forms[0]
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServAdAssignEvaluator";
    f.submit(); 
}
function save_psm2()
{
    var f= document.forms[0]
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServAdAssignEvaluator_psm2";
    f.submit(); 
}

function selectDay(obj)
{
    var f = document.forms[0];
    if(!(obj.value==""))
        {
            f.day.disabled=false;
        }
    else
        {
            f.day.disabled=true;
        }
}

function selectRoomDay ()
{
    var f = document.forms[0];
    var d = document;
    var r = document.getElementsByName("roomID");
    var roomID;
    var objClass = "day"+f.day.value +"_"+ f.room.value;
    var className;
    if(!((f.day.value=="")&&(f.room.value==""))){
        
    for(var i=0;i<r.length;i++){
        for(var j=1;j<6;j++){
            roomID=r[i].value
            className="day"+j+"_"+roomID;
            
            if(className==objClass)
               d.getElementById(className).className = "Show";
             else
               d.getElementById(className).className = "Hide";
        }
    }
  }
  if(!((f.day.value=="")||(f.room.value==""))){
      d.getElementById("itemBtn").className = "Show";
  }
  else
      {d.getElementById("itemBtn").className = "Hide";}
}

function checkTitle(obj,stud)
{ 
    var f = document.getElementsByName(obj.name)[0];
    if(!((obj.value=="") &&(stud.value=="")))
    {
        if(obj.value==stud.value)
        {
            
            alert(f.options[f.selectedIndex].text+ " has been assigned.\n Please select again.");
            obj.value="";
            return;
        }
    } 
}

function checkAvailability()
{   var d = document;
    var room = document.getElementsByName("roomID") ;
    
    // show all options
    for(k=0; k<room.length; k++){
      for(c=1; c<6; c++){
        for(r=2; r<13; r++){
          try{
            try{
              for(j=0; j<numOfTitle; j++){
                d.getElementsByName("s1_tt" + completeStr(c.toString(), 2) + completeStr(r.toString(), 2) + "_" + room[k].value)[0].options[j].className = "Show1";
              }
            }
            catch(err){}
          }
          catch(err){}

          

          try{
            try{
              for(j=0; j<numOfTitle; j++){
                d.getElementsByName("s2_tt" + completeStr(c.toString(), 2) + completeStr(r.toString(), 2) + "_" + room[k].value)[0].options[j].className = "Show1";
              }
            }
            catch(err){}
          }
          catch(err){}
          
        }
      }
    }
    
    var selectedIndex = new Array();
    var loop = 0;
    
    // get selectedIndex
    for(k=0; k<room.length; k++){
      for(c=1; c<6; c++){
        for(r=2; r<13; r++){
          
          try{
              if(!d.getElementsByName("s1_tt" + completeStr(c.toString(), 2) + completeStr(r.toString(), 2) + "_" + room[k].value)[0].selectedIndex === 0){
                selectedIndex[loop] = d.getElementsByName("s1_tt" + completeStr(c.toString(), 2) + completeStr(r.toString(), 2) + "_" + room[k].value)[0].selectedIndex;
                loop++;
                //alert(selectedIndex[loop-1]);
              }
          }
          catch(err){}      
          

          

          try{
              if(!d.getElementsByName("s2_tt" + completeStr(c.toString(), 2) + completeStr(r.toString(), 2) + "_" + room[k].value)[0].selectedIndex == 0){
                selectedIndex[loop] = d.getElementsByName("s2_tt" + completeStr(c.toString(), 2) + completeStr(r.toString(), 2) + "_" + room[k].value)[0].selectedIndex;
                loop++;
                //alert(selectedIndex[loop-1]);
              }
          }
          catch(err){}  
          
        }
      }
    }
    
    for(k=0; k<room.length; k++){
      for(c=1; c<6; c++){
        for(r=2; r<13; r++){
          for(sIndex=0; sIndex<loop; sIndex++){
            try{
              var index = selectedIndex[sIndex];
              d.getElementsByName("s1_tt" + completeStr(c.toString(), 2) + completeStr(r.toString(), 2) + "_" + room[k].value)[0].options[index].className = "Hide1";
              d.getElementsByName("s2_tt" + completeStr(c.toString(), 2) + completeStr(r.toString(), 2) + "_" + room[k].value)[0].options[index].className = "Hide1";
            }
            catch(err){}
          }
        }
      }
    }
        
    for(k=0; k<room.length; k++){
      for(c=1; c<6; c++){
        for(r=2; r<13; r++){
          try{
            d.getElementsByName("s1_tt" + completeStr(c.toString(), 2) + completeStr(r.toString(), 2) + "_" + room[k].value)[0].options[d.getElementsByName("s1_tt" + completeStr(c.toString(), 2) + completeStr(r.toString(), 2) + "_" + room[k].value)[0].selectedIndex].className = "Show1";
          }
          catch(err){}
        }
      }
    }
}
function completeStr(str, length){
        for(i=str.length; i<length; i++)
    str = "0" + str;
return str;
}










function assignvalueEX1(value){

    var exNo = "";
    var assignEX1;
    var f=document.forms[0];
    var valueEX2=document.getElementById("assignEX2"+value).value;
    f.assignEX1.value=document.getElementById("assignEX1"+value).value;
    f.metricNo.value=value;
    //if(f.assignEX1.value!==valueEX2){ 
    exNo = f.assignEX1.value;
  
    var c = confirm("You have assign Examiner 1 to "+exNo+"");
    if (c === true) {
    if(f.assignEX1.value!==valueEX2){ 
        
    //f.exNo.value=exNo;
    //f.assignEX1.value=assignEX1;
    
    f.method = "POST";
    f.target = "_self";
    f.action = "ServAdAssignEvaluator?Option=AssignEx1";
    f.submit();
    } 
    }
    else{
        alert("Evaluator 1 and Evaluator 2 Same Person.Please choose other evaluator");
        return;
    }
}


function assignvalueEX2(value){
    
    var ex2No = "";
    
    var f=document.forms[0];
    var valueEX1=document.getElementById("assignEX1"+value).value;
    f.assignEX2.value=document.getElementById("assignEX2"+value).value;
    f.metricNo.value=value;
    
    ex2No = f.assignEX2.value;
    var d = confirm("You have assign Examiner 2 to "+ex2No+"");
    if (d === true) {
    if(f.assignEX2.value!==valueEX1){
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServAdAssignEvaluator?Option=AssignEx2";
    f.submit();
    }
    }
    else{
        alert("Evaluator 1 and Evaluator 2 Same Person.Please choose other evaluator");
        return;
    }
    
   
}