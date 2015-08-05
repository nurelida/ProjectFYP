function showPSM()
{
    var d = document;
    var f = d.comments;
    
    if (f.psm.value == "psm1"){
       
        //d.getElementById("psm1Comments").className = "show";
        //d.getElementById("psm2Comments").className = "hide";
        document.getElementById("psm1Comments").hidden=false;
        
    }
    else if(f.psm.value == "psm2"){
        d.getElementById("psm1Comments").className = "hide";
        d.getElementById("psm2Comments").className = "show";
        
    }
    else{
       document.getElementById("psm1Comments").hidden=true;
        d.getElementById("psm1Comments").className = "hide";
        d.getElementById("psm2Comments").className = "hide";
    }
}

function showComment(){
    var d = document;
    var f = d.comments;
    
    d.getElementById("penilaianItem").className = "hide";
    d.getElementById("penilaian_psm2Item").className = "hide";
    d.getElementById("pembentanganItem").className = "hide";
    d.getElementById("pembentangan_psm2Item").className = "hide";
    d.getElementById("penyeliaanItem").className = "hide";
    d.getElementById("penyeliaan_psm2Item").className = "hide";
    d.getElementById("fasa1Item").className = "hide";
    d.getElementById("fasa2Item").className = "hide";
    
    if(f.psm.value == "psm1"){
        if(f.psm1.value == "penilaian")
            d.getElementById("penilaianItem").className = "show";
        else if(f.psm1.value == "pembentangan")
            d.getElementById("pembentanganItem").className = "show";
        else if(f.psm1.value == "penyeliaan")
            d.getElementById("penyeliaanItem").className = "show";
    }
    else if(f.psm.value == "psm2"){
        if(f.psm2.value == "penilaian")
            d.getElementById("penilaian_psm2Item").className = "show";
        else if(f.psm2.value == "pembentangan")
            d.getElementById("pembentangan_psm2Item").className = "show";
        else if(f.psm2.value == "penyeliaan")
            d.getElementById("penyeliaan_psm2Item").className = "show";
        else if(f.psm2.value == "fasa1")
            d.getElementById("fasa1Item").className = "show";
        else if(f.psm2.value == "fasa2")
            d.getElementById("fasa2Item").className = "show";
    }
}