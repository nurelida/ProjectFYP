function checkEvaluator(obj,ev)
{ 
    if(!((obj.value=="") &&(ev.value=="")))
    {
        if(obj.value==ev.value)
        {
            alert("Panel cannot same with chairman");
            obj.value="";
            return;
        }
    } 
}

function checkAll(obj,name,quota,ev)
{  
   var count=0;
   var r = document.getElementsByName("roomID");
   for (var k=0;k<r.length;k++){
     var roomID = r[k].value;
        for(var i=2;i<13;i++){
            for(var j=1;j<6;j++){
                var rStr = j.toString();
                var cStr = i.toString();
                var combo=name + completeStr(rStr.toString(),2) + completeStr(cStr.toString(),2)+"_"+roomID;
              try{

                  var f = document.getElementsByName(combo)[0];
                  var c = f.value;
                 if(!(obj.value==""))
                      {
                        if(obj.value==c)
                        {     
                          if(count>=quota){
                            alert(f.options[f.selectedIndex].text+" has exceed his/her quota ("+count+") as Evaluator "+ev+"  \n Plese select again!!!!")
                            f.value="";
                            return;
                          }
                          count++;
                        }
                      }
              }
              catch(err){}
             }
        }
        
   }
   
}

function checkP1(obj,quota){
    
    var name="p1tt";
    var ev = "1";
    checkAll(obj,name,quota,ev);
}

function checkP2(obj,quota){
    
    var name="p2tt";
    var ev = "2";
    checkAll(obj,name,quota,ev);
}

function completeStr(str, length){
        for(i=str.length; i<length; i++)
    str = "0" + str;
return str;
}

function saveTimeTable(value)
{
    var f = document.forms[0];
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServAdGenerateTTable?Option="+value;
    f.submit(); 
}
function showTable(opt)
{   
     var d = document;
     var f = d.forms[0];
     var index = f.demoRoom.selectedIndex-1;
     if(opt=="generate")
        { d.getElementById("itemButton").className = "show";
            if (f.demoRoom.value=="")
                d.getElementById("itemButton").className = "hide";
        }
     for(var i=0;i<d.getElementsByTagName("table").length;i++){
         if(index==i)
            d.getElementsByTagName("table")[index].className = "show";
         else
            d.getElementsByTagName("table")[i].className = "hide";
     }
}

function checkSlot(obj){ 
   var r = document.getElementsByName("roomID");
   var name = obj.name;
   var room = name.substring(9);
   var slot = name.substring(2,8);
 
   for (var k=0;k<r.length;k++){
     var roomID = r[k].value;
         if(!(room==roomID)){
            for(var i=2;i<13;i++){
                for(var j=0;j<6;j++){
                    var rStr = j.toString();
                    var cStr = i.toString();
                    var time = "tt"+completeStr(rStr.toString(),2) + completeStr(cStr.toString(),2);
                    if(time==slot){
                          var comboP1="p1" + time +"_"+roomID;
                          var comboP2="p2" + time +"_"+roomID;
                          var f = document.getElementsByName(obj.name)[0];
                         
                         if(!(obj.value=="")){
                             if(document.getElementsByName(comboP1)[0].value==obj.value)
                              {
                                 alert(f.options[f.selectedIndex].text+ " was assgined in this slot. Please select again !!!");
                                 obj.value="";
                                 return;
                              }
                              if(document.getElementsByName(comboP2)[0].value==obj.value)
                              {
                                 alert(f.options[f.selectedIndex].text+ " was assgined in this slot. Please select again !!!");
                                 obj.value="";
                                 return; 
                              }
                         }
                    }
               }
          }  
      }
   }
}

function showSchedule(value){
    var c = confirm("Show evaluation schedule : "+value+". ");
    if(c==true){
        var f = document.forms[0];
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServAdGenerateTTable?Option=ShowSchedule";
        f.submit();  
    }
    else
        return;
   
}

function showResult(value){
    var c = confirm("Show student grade : "+value+". ");
    if(c==true){
        var f = document.showResult;
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServAdGenerateTTable?Option=ShowResult";
        f.submit();  
    }
    else
        return;
   
}