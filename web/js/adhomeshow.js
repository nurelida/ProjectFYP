function showResult(value){
    var f = document.showres;
    var c = confirm("Show student grade : "+value+". ");
    if(c==true){
        
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServAdGenerateTTable?Option=ShowResult";
        f.submit();  
    }
    else
        return;
   
}
function showSchedule(value){
    var c = confirm("Show evaluation schedule : "+value+". ");
    if(c==true){
        var f = document.showshed;
        f.method = "POST";
        f.target = "_self";
        f.action = "./ServAdGenerateTTable?Option=ShowSchedule";
        f.submit();  
    }
    else
        return;
   
}