function addPhase1()
{
    var f = document.evaluatePSM2;
    var marks=0 ;
    var temp = new Number(0.00);
    if((f.gantt.value=="")){
       f.gantt_m.value=""; 
    }
    if(!(f.gantt.value=="")){
     temp = f.gantt.value/10*5;
     f.gantt_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.gantt_m.value);
    }
    if((f.kebolehan.value=="")){
       f.kebolehan_m.value=""; 
    }
    if(!(f.kebolehan.value=="")){
     temp = f.kebolehan.value/10*2;
     f.kebolehan_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.kebolehan_m.value);
    }
    if((f.daya.value=="")){
        f.daya_m.value="";
    }
    if(!(f.daya.value=="")){
     temp = f.daya.value/10*2;
     f.daya_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.daya_m.value);
    }
    if((f.kekerapan.value=="")){
       f.kekerapan_m.value=""; 
    }
    if(!(f.kekerapan.value=="")){
     temp = f.kekerapan.value/10*2;
     f.kekerapan_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.kekerapan_m.value);
    }
    if((f.peningkatan.value=="")){
        f.peningkatan_m.value="";
    }
    if(!(f.peningkatan.value=="")){
     temp = f.peningkatan.value/10*2;
     f.peningkatan_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.peningkatan_m.value);
    }
    if((f.keberkesanan.value=="")){
        f.keberkesanan_m.value="";
    }
    if(!(f.keberkesanan.value=="")){
     temp = f.keberkesanan.value/10*2;
     f.keberkesanan_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.keberkesanan_m.value);
    }
    temp = marks;
    f.total.value=temp.toFixed(2);
}

function savePhase1(option)
{
    var f = document.evaluatePSM2;
   
    if((f.gantt.value=="")){
      alert("Medan markah Pencapaian perancangan Projek berdasarkan carta Gantt tidak boleh dikosngkan");
      return;
    }
    if((f.kebolehan.value=="")){
     alert("Medan markah Kebolehan merancang dan menyelesaikan masalah tidak boleh dikosongkan.");
     return;
    }
    if((f.daya.value=="")){
     alert("Medan markah Daya usaha dan kebolehan berdikari tidak boleh dikosongkan.");
     return;
    }
    if((f.kekerapan.value=="")){
     alert("Medan markah Kekerapan pelajar berbincang dan mengemukakan perkembangan tidak boleh dikosongkan.");
     return;
    }
    if((f.peningkatan.value=="")){
     alert("Medan markah Peningkatan pengetahuan dan kemahiran tidak boleh dikosongkan.");
     return;
    }
    if((f.keberkesanan.value=="")){
     alert("Medan markah Keberkesanan berkomunikasi/perhubungan tidak boleh dikosongkan.");
     return;
    }
     if((f.comment.value=="")){
        alert("Comment Cannot be blanked");
        return;
    }
    var add = "";
    if(option=="save"){
       add = "./ServLecSvPSM?Option=phase1_psm2";
    }
    else if(option=="saveChanges"){
        add="./ServLecSvPSM?Option=phase1_psm2_Edit";
    }
    var c = confirm("Submit Evaluation Form");
    if(c==true){
    f.method = "POST";
    f.target = "_self";
    f.action = add;
    f.submit();
    }
    else 
        return;

}

function editPhase1()
{
    var f = document.evaluatePSM2;
    document.getElementById("itemEditPhase1").className="hide";
    document.getElementById("itemSaveChangesPhase1").className="show";
    f.gantt.disabled=false;
    f.kebolehan.disabled=false;
    f.daya.disabled=false;
    f.kekerapan.disabled=false;
    f.peningkatan.disabled=false;
    f.keberkesanan.disabled=false;
    f.comment.readOnly=false;
}

function addPhase2()
{
    var f = document.evaluatePSM2;
    var marks=0 ;
    var temp = Number(0.00);
     if((f.gantt2.value=="")){
        f.gantt_m2.value="";
     }
     if(!(f.gantt2.value=="")){
     temp = f.gantt2.value/10*5;
     f.gantt_m2.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.gantt_m2.value);
    }
    if((f.kebolehan2.value=="")){
       f.kebolehan_m2.value=""; 
    }
    if(!(f.kebolehan2.value=="")){
     temp = f.kebolehan2.value/10*2;
     f.kebolehan_m2.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.kebolehan_m2.value);
    }
    if((f.daya2.value=="")){
        f.daya_m2.value="";
    }
    if(!(f.daya2.value=="")){
     temp = f.daya2.value/10*2;
     f.daya_m2.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.daya_m2.value);
    }
    if((f.kekerapan2.value=="")){
        f.kekerapan_m2.value="";
    }
    if(!(f.kekerapan2.value=="")){
     temp = f.kekerapan2.value/10*2;
     f.kekerapan_m2.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.kekerapan_m2.value);
    }
    if((f.peningkatan2.value=="")){
       f.peningkatan_m2.value=""; 
    }
    if(!(f.peningkatan2.value=="")){
     temp = f.peningkatan2.value/10*2;
     f.peningkatan_m2.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.peningkatan_m2.value);
    }
    if((f.keberkesanan2.value=="")){
       f.keberkesanan_m2.value=""; 
    }
    if(!(f.keberkesanan2.value=="")){
     temp = f.keberkesanan2.value/10*2;
     f.keberkesanan_m2.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.keberkesanan_m2.value);
    }
    temp = marks;
    f.total2.value=temp.toFixed(2);
}

function savePhase2(option)
{
    var f = document.evaluatePSM2;
    if((f.comment2.value=="")){
      alert("Comment cannot be blanked.");
      return;
    }
    if((f.gantt2.value=="")){
      alert("Medan markah Pencapaian perancangan Projek berdasarkan carta Gantt tidak boleh dikosngkan");
      return;
    }
    if((f.kebolehan2.value=="")){
     alert("Medan markah Kebolehan merancang dan menyelesaikan masalah tidak boleh dikosongkan.");
     return;
    }
    if((f.daya2.value=="")){
     alert("Medan markah Daya usaha dan kebolehan berdikari tidak boleh dikosongkan.");
     return;
    }
    if((f.kekerapan2.value=="")){
     alert("Medan markah Kekerapan pelajar berbincang dan mengemukakan perkembangan tidak boleh dikosongkan.");
     return;
    }
    if((f.peningkatan2.value=="")){
     alert("Medan markah Peningkatan pengetahuan dan kemahiran tidak boleh dikosongkan.");
     return;
    }
    if((f.keberkesanan2.value=="")){
     alert("Medan markah Keberkesanan berkomunikasi/perhubungan tidak boleh dikosongkan.");
     return;
    }
     if((f.comment2.value=="")){
        alert("Comment Cannot be blanked");
        return;
    }
   var add = "";
   if(option=="save")
   {
       add="./ServLecSvPSM?Option=phase2_psm2";    
   }
   else if(option=="saveChanges"){
       add="./ServLecSvPSM?Option=phase2_psm2_Edit";
   }
    var c = confirm("Evaluation marks cannot be change after submit.");
    if(c==true){
    f.method = "POST";
    f.target = "_self";
    f.action = add;
    f.submit();
    }
    else 
        return;

}
function editPhase2()
{
    var f = document.evaluatePSM2;
    document.getElementById("itemEditPhase2").className="hide";
    document.getElementById("itemSaveChangesPhase2").className="show";
    f.gantt2.disabled=false;
    f.kebolehan2.disabled=false;
    f.daya2.disabled=false;
    f.kekerapan2.disabled=false;
    f.peningkatan2.disabled=false;
    f.keberkesanan2.disabled=false;
    f.comment2.readOnly=false;
}   
function addFinal()
{
    var f = document.evaluatePSM2;
    var marks=0 ;
    var temp = new Number(0.00);
    if((f.panduan.value=="")){
       f.panduan_m.value=""; 
    }
    if(!(f.panduan.value=="")){
     temp = f.panduan.value/10*5;
     f.panduan_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.panduan_m.value);
    }
    if((f.skop.value=="")){
       f.skop_m.value=""; 
    }
    if(!(f.skop.value=="")){
     temp = f.skop.value/10*5;
     f.skop_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.skop_m.value);
    }
    if((f.teknologi.value=="")){
        f.teknologi_m.value="";
    }
    if(!(f.teknologi.value=="")){
     temp = f.teknologi.value/10*3;
     f.teknologi_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.teknologi_m.value);
    }
    if((f.komersial.value=="")){
        f.komersial_m.value="";
    }
    if(!(f.komersial.value=="")){
     temp = f.komersial.value/10*2;
     f.komersial_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.komersial_m.value);
    }
    if((f.persembahan.value=="")){
        f.persembahan_m.value="";
    }
    if(!(f.persembahan.value=="")){
     temp = f.persembahan.value/10*4;
     f.persembahan_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.persembahan_m.value);
    }
    if((f.ayat.value=="")){
        f.ayat_m.value="";
    }
    if(!(f.ayat.value=="")){
     temp = f.ayat.value/10*4;
     f.ayat_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.ayat_m.value);
    }
    if((f.gambarajah.value=="")){
        f.gambarajah_m.value="";
    }
    if(!(f.gambarajah.value=="")){
     temp = f.gambarajah.value/10*2;
     f.gambarajah_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.gambarajah_m.value);
    }
    if((f.kajian.value=="")){
        f.kajian_m.value="";
    }
    if(!(f.kajian.value=="")){
     temp = f.kajian.value/10*6;
     f.kajian_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.kajian_m.value);
    }
    if((f.teknik.value=="")){
        f.teknik_m.value="";
    }
    if(!(f.teknik.value=="")){
     temp = f.teknik.value/10*6;
     f.teknik_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.teknik_m.value);
    }
    if((f.fakta.value=="")){
       f.fakta_m.value=""; 
    }
    if(!(f.fakta.value=="")){
     temp = f.fakta.value/10*4;
     f.fakta_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.fakta_m.value);
    }
    if((f.keterperincian.value=="")){
        f.keterperincian_m.value="";
    }
    if(!(f.keterperincian.value=="")){
     temp = f.keterperincian.value/10*4;
     f.keterperincian_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.keterperincian_m.value);
    }
    temp = marks;
    f.total3.value= temp.toFixed(2);
}

function saveFinal(option)
{
    var f = document.evaluatePSM2;
   
    
    if((f.panduan.value=="")){
    alert("Medan markah Menurut panduan penulisan tesis untuk pelajar tidak boleh dikosongkan.");
    return;
    }
    if((f.skop.value=="")){
     alert("Medan markah Memenuhi Skop tidak boleh dikosongkan.");
    return;
    }
    if((f.teknologi.value=="")){
     alert("Medan markah Penggunaan Teknologi/Teknik terkini tidak boleh dikosongkan.");
    return;
    }
    if((f.komersial.value=="")){
     alert("Medan markah Berciri Komersial tidak boleh dikosongkan.");
    return;
    }
    if((f.persembahan.value=="")){
     alert("Medan markah Susunan persembahan laporan mengikut jujukan secara logik tidak boleh dikosongkan.");
    return;
    }
    if((f.ayat.value=="")){
     alert("Medan markah Susunan ayat yang mudah dan jelas difahami tidak boleh dikosongkan.");
    return;
    }
    if((f.gambarajah.value=="")){
     alert("Medan markah Gambarajah/lakaran yang dapat memudahkan pemahaman tidak boleh dikosongkan.");
    return;
    }
    if((f.kajian.value=="")){
     alert("Medan markah Kajian literatur / latarbelakang yang mencukupi tidak boleh dikosongkan.");
    return;
    }
    if((f.teknik.value=="")){
     alert("Medan markah Penggunaan kaedah/formula/teknik/pendekatan kajian yang betul  tidak boleh dikosongkan.");
    return;
    }
    if((f.fakta.value=="")){
     alert("Medan markah Fakta-fakta kajian yang betul tidak boleh dikosongkan.");
    return;
    }
    if((f.keterperincian.value=="")){
     alert("Medan markah Keterperincian kajian tidak boleh dikosongkan.");
    return;
    }
    var add = "";
    if(option=="save"){
       add= "./ServLecSvPSM?Option=final_psm2";
    }
    else if(option=="saveChanges"){
        add="./ServLecSvPSM?Option=final_psm2_Edit";
    }
    var c = confirm("Submit Evaluation Form.");
    if(c==true){
    f.method = "POST";
    f.target = "_self";
    f.action = add;
    f.submit();
    }
    else 
        return;
}
function editFinal()
{
    var f = document.evaluatePSM2;
    document.getElementById("itemEdit").className="hide";
    document.getElementById("itemSaveChanges").className="show";
    f.panduan.disabled=false;
    f.skop.disabled=false;
    f.teknologi.disabled=false;
    f.komersial.disabled=false;
    f.persembahan.disabled=false;
    f.ayat.disabled=false;
    f.gambarajah.disabled=false;
    f.kajian.disabled=false;
    f.teknik.disabled=false;
    f.fakta.disabled=false;
    f.keterperincian.disabled=false;
    f.comment3.readOnly=false;
}
function formType()
{
    var d = document;
    var f = d.evaluatePSM2;
    var msg;
    if(f.evForm.options[f.evForm.selectedIndex].disabled==true){
        if(f.evForm.selectedIndex==2)
          {msg= "Please compleate Phase 1 evaluation, in order to proceed phase 2 evaluation.";
           alert(msg);
          }
        else if(f.evForm.selectedIndex==3)
          {msg= "Please compleate Phase 2 evaluation, in order to proceed final evaluation.";
            alert(msg);
          }
      return;
    }
    if(f.evForm.value==""){
       d.getElementById("phase1Item").className="hide";
       d.getElementById("phase2Item").className="hide"; 
       d.getElementById("finalItem").className="hide"; 
    }
    
    else if(f.evForm.value=="phase1"){
        d.getElementById("phase1Item").className="show";
        d.getElementById("phase2Item").className="hide";
        d.getElementById("finalItem").className="hide"; 
    }
    else if(f.evForm.value=="phase2"){
        d.getElementById("phase1Item").className="hide";
        d.getElementById("phase2Item").className="show";
        d.getElementById("finalItem").className="hide"; 
    }
    
    else if(f.evForm.value=="final"){
        d.getElementById("phase1Item").className="hide";
        d.getElementById("phase2Item").className="hide";
        d.getElementById("finalItem").className="show"; 
        
    }
    
}