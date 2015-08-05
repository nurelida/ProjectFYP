function select_day(){
    var f = document.forms[0];
    if(f.selectedRoom==""){
        return;
    }
    else{
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServAdAssignEvaluatorTest?Option=selectedDay";
        f.submit(); 
    }
}
function select_room(value){
    var f = document.forms[0];
    if(value==""){
        f.selectedDay.disabled=true;
    }
    else{
        f.selectedDay.disabled=false;
    }
}