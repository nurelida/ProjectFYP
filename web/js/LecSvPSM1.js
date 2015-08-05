function addAll()
{
    var f = document.evaluatePSM1;
    var marks=0 ;
    var temp = new Number(0.00);
    if((f.gantt.value=="")){
        f.gantt_m.value="";
    }
    if(!(f.gantt.value=="")){
     temp = f.gantt.value/10*3;
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
     temp = f.kekerapan.value/10*1;
     f.kekerapan_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.kekerapan_m.value);
    }
    if((f.peningkatan.value=="")){
        f.peningkatan_m.value="";
    }
    if(!(f.peningkatan.value=="")){
     temp = f.peningkatan.value/10*1;
     f.peningkatan_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.peningkatan_m.value);
    }
    if((f.keberkesanan.value=="")){
       f.keberkesanan_m.value=""; 
    }
    if(!(f.keberkesanan.value=="")){
     temp = f.keberkesanan.value/10*1;
     f.keberkesanan_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.keberkesanan_m.value);
    }
    if((f.peranan.value=="")){
      f.peranan_m.value="";  
    }
    if(!(f.peranan.value=="")){
     temp = f.peranan.value/10*5;
     f.peranan_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.peranan_m.value);
    }
    if((f.format.value=="")){
      f.format_m.value="";  
    }
    if(!(f.format.value=="")){
    temp = f.format.value/10*5;
     f.format_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.format_m.value);
    }
    if((f.abstrak.value=="")){
      f.abstrak_m.value="";  
    }
    if(!(f.abstrak.value=="")){
     temp = f.abstrak.value/10*3;
     f.abstrak_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.abstrak_m.value);
    }
    if((f.objektif.value=="")){
       f.objektif_m.value=""; 
    }
    if(!(f.objektif.value=="")){
     temp = f.objektif.value/10*5;
     f.objektif_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.objektif_m.value);
    }
    if((f.analisis.value=="")){
      f.analisis_m.value="";  
    }
    if(!(f.analisis.value=="")){
     temp = f.analisis.value/10*5;
     f.analisis_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.analisis_m.value);
    }
    if((f.kajian.value=="")){
        f.kajian_m.value="";
    }
    if(!(f.kajian.value=="")){
     temp = f.kajian.value/10*5;
     f.kajian_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.kajian_m.value);
    }
    if((f.metodologi.value=="")){
       f.metodologi_m.value=""; 
    }
    if(!(f.metodologi.value=="")){
     temp = f.metodologi.value/10*6;
     f.metodologi_m.value=temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.metodologi_m.value);
    }
    if((f.kesimpulan.value=="")){
      f.kesimpulan_m.value="";  
    }
    if(!(f.kesimpulan.value=="")){
     temp = f.kesimpulan.value/10*2;
     f.kesimpulan_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.kesimpulan_m.value);
    }
    if((f.rujukan.value=="")){
        f.rujukan_m.value="";
    }
    if(!(f.rujukan.value=="")){
     temp = f.rujukan.value/10*1;
     f.rujukan_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.rujukan_m.value);
    }
    if((f.lampiran.value=="")){
     f.lampiran_m.value="";   
    }
    if(!(f.lampiran.value=="")){
     temp = f.lampiran.value/10*3;
     f.lampiran_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.lampiran_m.value);
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
    temp=marks;
    f.total.value= temp.toFixed(2);
}

function save(option)
{
    var f = document.evaluatePSM1;
    var marks=0 ;
    
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
    if((f.peranan.value=="")){
     alert("Medan markah Peranan pelajar dalam mendapatkan tajuk Projek tidak boleh dikosongkan.");
     return;
    }
    if((f.format.value=="")){
      alert("Medan markah Memenuhi spesifikasi format dalam penulisan laporan tidak boleh dikosongkan.");
      return;
    }
    if((f.abstrak.value=="")){
     alert("Medan markah Abstrak tidak boleh dikosongkan.");
     return;
    }
    if((f.objektif.value=="")){
     alert("Medan markah Objektif, skop dan pernyataan masalah tidak boleh dikosongkan.");
     return;
    }
    if((f.analisis.value=="")){
     alert("Medan markah Analisis Masalah tidak boleh dikosongkan.");
     return;
    }
    if((f.kajian.value=="")){
     alert("Medan markah Kajian literatur / latarbelakang  tidak boleh dikosongkan.");
     return;
    }
    if((f.metodologi.value=="")){
     alert("Medan markah Metodologi Kajian tidak boleh dikosongkan.");
     return;
    }
    if((f.kesimpulan.value=="")){
     alert("Medan markah Kesimpulan tidak boleh dikosongkan.");
     return;
    }
    if((f.rujukan.value=="")){
     alert("Medan markah Rujukan / Bibliografi tidak boleh dikosongkan.");
     return;
    }
    if((f.lampiran.value=="")){
     alert("Medan markah Lampiran / Carta Gantt( tidak boleh dikosongkan.");
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
    var add = "";
    if(option=="save"){
        add="./ServLecSvPSM?Option=PSM1";
    }
    else if(option=="saveChanges"){
        add="./ServLecSvPSM?Option=PSM1_Edit";
    }
    if((f.comment.value=="")){
        alert("Comment Cannot be blanked");
        return;
    }
    var c = confirm("Submit Evaluation Form.")
    if(c==true){
    f.method = "POST";
    f.target = "_self";
    f.action = add;
    f.submit();
    }
    else 
        return;
}
function edit()
{
    var f= document.evaluatePSM1;
    document.getElementById("itemEdit").className="hide";
    document.getElementById("itemSaveChanges").className="saveChangesShow";
    f.gantt.disabled=false;
    f.kebolehan.disabled=false;
    f.daya.disabled=false;
    f.kekerapan.disabled=false;
    f.peningkatan.disabled=false;
    f.keberkesanan.disabled=false;
    f.peranan.disabled=false;
    f.format.disabled=false;
    f.abstrak.disabled=false;
    f.objektif.disabled=false;
    f.analisis.disabled=false;
    f.kajian.disabled=false;
    f.metodologi.disabled=false;
    f.kesimpulan.disabled=false;
    f.rujukan.disabled=false;
    f.lampiran.disabled=false;
    f.persembahan.disabled=false;
    f.ayat.disabled=false;
    f.gambarajah.disabled=false;
    f.comment.readOnly=false;
}