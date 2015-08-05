function getAll()
{
    var f = document.forms[0];
    var marks=0 ;
    var temp = new Number(0.00);
    if((f.matlamat.value=="")){
        f.matlamat_m.value="";
    }
    
    if(!(f.matlamat.value=="")){
        temp = f.matlamat.value/10*2;
        f.matlamat_m.value = temp.toFixed(2);
        marks = parseFloat(marks)+parseFloat(f.matlamat_m.value);
        
    }
    if((f.kajian.value=="")){
        f.kajian_m.value="";
    }
     if(!(f.kajian.value=="")){
       temp = f.kajian.value/10*3;
       f.kajian_m.value = temp.toFixed(2);
       marks=parseFloat(marks)+parseFloat(f.kajian_m.value);
    }
    if((f.perancangan.value=="")){
        f.perancangan_m.value="";
    }
    if(!(f.perancangan.value=="")){
       temp = f.perancangan.value/10*1;
       f.perancangan_m.value = temp.toFixed(2);
       marks=parseFloat(marks)+ parseFloat(f.perancangan_m.value);
    }
    if((f.pengumpulan.value=="")){
       f.pengumpulan_m.value="";     
    }
    if(!(f.pengumpulan.value=="")){
       temp = f.pengumpulan.value/10*2;
       f.pengumpulan_m.value = temp.toFixed(2);
       marks=parseFloat(marks)+ parseFloat(f.pengumpulan_m.value);
    }
    if((f.teknik.value=="")){
       f.teknik_m.value=""; 
    }
    if(!(f.teknik.value=="")){
     temp = f.teknik.value/10*3;
     f.teknik_m.value = temp.toFixed(2); 
     marks=parseFloat(marks)+ parseFloat(f.teknik_m.value);
    }
    if((f.rekabentuk.value=="")){
      f.rekabentuk_m.value="";  
    }
    if(!(f.rekabentuk.value=="")){
      temp=f.rekabentuk.value/10*5;
      f.rekabentuk_m.value = temp.toFixed(2); 
      marks=parseFloat(marks)+ parseFloat(f.rekabentuk_m.value);
    }
    if((f.perkakasan.value=="")){
      f.perkakasan_m.value="";  
    }
    if(!(f.perkakasan.value=="")){
      temp=f.perkakasan.value/10*2;
      f.perkakasan_m.value = temp.toFixed(2);
      marks=parseFloat(marks)+ parseFloat(f.perkakasan_m.value);
    }
    if((f.hasil.value=="")){
       f.hasil_m.value=""; 
    }
    if(!(f.hasil.value=="")){
      temp=f.hasil.value/10*3;
      f.hasil_m.value=temp.toFixed(2);
      marks=parseFloat(marks)+ parseFloat(f.hasil_m.value);
    }
    if((f.rujukan.value=="")){
      f.rujukan_m.value="";  
    }
    if(!(f.rujukan.value=="")){
      temp=f.rujukan.value/10*1;
      f.rujukan_m.value=temp.toFixed(2);
      marks=parseFloat(marks)+ parseFloat(f.rujukan_m.value);
    }
    if((f.lampiran.value=="")){
      f.lampiran_m.value="";  
    }
    if(!(f.lampiran.value=="")){
      temp=f.lampiran.value/10*1;
      f.lampiran_m.value = temp.toFixed(2);
      marks=parseFloat(marks)+ parseFloat(f.lampiran_m.value);
    }
    if((f.laporan.value=="")){
       f.laporan_m.value=""; 
    }
    if(!(f.laporan.value=="")){
    temp=f.laporan.value/10*2;
    f.laporan_m.value=temp.toFixed(2);
    marks=parseFloat(marks)+ parseFloat(f.laporan_m.value);
    }
    temp = marks;
    f.total.value=temp.toFixed(2);
}

function save(option)
{
     var f = document.forms[0];
    if(f.comment.value=="")
        {
            alert("Comments cannot be blanked.");
            return;
        }
    if((f.matlamat.value=="")){
        alert("Medah markah  matlamat dan objektif projek yang bersesuaian tidak boleh dikosongkan.");
        return;
    }
     if((f.kajian.value=="")){
      alert("Medan markah kajian latarbelakang dan kajian literatur yang mencukupi tidak boleh dikosongkan.");
        return;
    }
    if((f.perancangan.value=="")){
      alert("Medan markah Perancangan projek yang betul tidak boleh dikosongkan.");
        return;
    }
    if((f.pengumpulan.value=="")){
      alert("Medan markah Pengumpulan data/maklumat yang mencukupi tidak boleh dikosongkan.");
        return;
    }
    if((f.teknik.value=="")){
       alert("Medan markah Penggunaan teknik/metodologi/formula/kaedah yang tepat tidak boleh dikosongkan.");
        return;
    }
    if((f.rekabentuk.value=="")){
       alert("Medah markah Rekabentuk input/output,  tidak boleh dikosongkan.");
        return;
    }
    if((f.perkakasan.value=="")){
       alert("Medan markah Pemilihan perkakasan dan perisian yang tepat tidak boleh dikosongkan.");
        return;
    }
    if((f.hasil.value=="")){
       alert("Medan markah Hasil projek (kajian, analisa dan rekabentuk) yang mencukupi dan lengkap");
        return;
    }
    if((f.rujukan.value=="")){
       alert("Medan markah Rujukan yang mencukupi tidak boleh dikosongkan.");
        return;
    }
    if((f.lampiran.value=="")){
       alert("Medan markah Lampiran (rajah, cartalir dan sebagainya) yang lengkap tidak boleh dikosongkan.");
        return;
    }
    if((f.laporan.value=="")){
       alert("Medan markah Hasil penulisan laporan yang teratur, jelas dan mudah difahami tidak boleh dikosongkan");
        return;
    }
    var add = "";
    if(option=="save"){
       add="./ServLecEvaluation_Chairman?Option=Panel"; 
    }
    else if(option=="saveChanges"){
       add="./ServLecEvaluation_Chairman?Option=PanelEdit"; 
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
function editPSM1()
{
    var f = document.forms[0];
    document.getElementById("itemEdit").className="editHide";
    document.getElementById("itemSaveChanges").className="saveChangesShow";
    f.matlamat.disabled=false;
    f.kajian.disabled=false;
    f.perancangan.disabled=false;
    f.pengumpulan.disabled=false;
    f.teknik.disabled=false;
    f.rekabentuk.disabled=false;
    f.perkakasan.disabled=false;
    f.hasil.disabled=false;
    f.rujukan.disabled=false;
    f.lampiran.disabled=false;
    f.laporan.disabled=false;
    f.comment.readOnly=false;   
}
function add_psm2_All(){
    var f = document.forms[0];
    var marks=0 ;
    var temp = new Number(0.00);
     if((f.skop.value=="")){
         f.skop_m.value="";
     }
    if(!(f.skop.value=="")){
        temp = f.skop.value/10*6;
        f.skop_m.value = temp.toFixed(2);
        marks = parseFloat(marks)+ parseFloat(f.skop_m.value);
    }
    if((f.metodologi.value=="")){
        f.metodologi_m.value="";
    }
    if(!(f.metodologi.value=="")){
        temp = f.metodologi.value/10*3;
        f.metodologi_m.value = temp.toFixed(2);
        marks=parseFloat(marks)+ parseFloat(f.metodologi_m.value);
    }
    if((f.hasil.value=="")){
        f.hasil_m.value="";
    }
    if(!(f.hasil.value=="")){
        temp = f.hasil.value/10*8;
        f.hasil_m.value = temp.toFixed(2);
        marks=parseFloat(marks)+ parseFloat(f.hasil_m.value);
    }
    if((f.teknologi.value=="")){
        f.teknologi_m.value="";
    }
    if(!(f.teknologi.value=="")){
        temp = f.teknologi.value/10*4;
        f.teknologi_m.value = temp.toFixed(2);
        marks=parseFloat(marks)+ parseFloat(f.teknologi_m.value);
    }
    if((f.komersial.value=="")){
        f.komersial_m.value="";
    }
    if(!(f.komersial.value=="")){
        temp = f.komersial.value/10*4;
        f.komersial_m.value = temp.toFixed(2);
        marks=parseFloat(marks)+ parseFloat(f.komersial_m.value);
    }
    temp = marks;
    f.total.value=temp.toFixed(2);
}

function savePSM2(option){
    var f = document.forms[0];
    
    if((f.skop.value=="")){
        alert("Medan markah Memenuhi Skop tidak boleh dikosongkan.");
        return;
    }
    if((f.metodologi.value=="")){
        alert("Medan markah Penggunaan teknik/ metodologi/ formula/ kaedah/ pendekatan yang sesuai tidak boleh dikosongkan.");
        return;
    }
    if((f.hasil.value=="")){
        alert("Medan markah Hasil projek lengkap dan sempurna tidak boleh dikosongkan.");
        return;
    }
    if((f.teknologi.value=="")){
        alert("Medan markah Penggunaan teknologi/ teknik terkini tidak boleh dikosongkan.");
        return;
    }
    if((f.komersial.value=="")){
        alert("Medan markah Berciri komersial tidak boleh dikosongkan.");
        return;      
    }
    if(f.comment.value=="")
        {
            alert("Comment cannot be blanked.");
            return;
        }
    var add ="";
    if(option=="save"){
       add="./ServLecEvaluation_Chairman?Option=Panel_psm2"; 
    }
    else if(option == "saveChanges"){
       add="./ServLecEvaluation_Chairman?Option=Panel_psm2_Edit";  
    }
    var c = confirm("Submit Evalution Form");
    if(c==true){
    f.method = "POST";
    f.target = "_self";
    f.action = add;
    f.submit();
    }
    else 
        return;
}
function editPSM2()
{
    var f = document.forms[0];
    document.getElementById("itemEdit").className="editHide";
    document.getElementById("itemSaveChanges").className="saveChangesShow";
    f.skop.disabled=false;
    f.metodologi.disabled=false;
    f.hasil.disabled=false;
    f.teknologi.disabled=false;
    f.komersial.disabled=false;
    f.comment.readOnly=false;
      
}