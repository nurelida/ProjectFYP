
function getAll()
{
    var f = document.forms[0];
    var marks=0 ;
    var temp = new Number(0.00);
    if(!(f.peradaban.value=="")){
     temp = f.peradaban.value/10*1;
     f.peradaban_m.value=temp.toFixed(2);
     marks = parseFloat(marks)+parseFloat(f.peradaban_m.value);
    }
     if(!(f.persiapan.value=="")){
     temp = f.persiapan.value/10*2;
     f.persiapan_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+parseFloat(f.persiapan_m.value);
    }
    if(!(f.ketepatan.value=="")){
     temp = f.ketepatan.value/10*3;
     f.ketepatan_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+ parseFloat(f.ketepatan_m.value);
    }
    if(!(f.kefahaman.value=="")){
     temp = f.kefahaman.value/10*5;
     f.kefahaman_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+ parseFloat(f.kefahaman_m.value);
    }
    if(!(f.keyakinan.value=="")){
     temp = f.keyakinan.value/10*2;
     f.keyakinan_m.value = temp.toFixed(2);
     marks=parseFloat(marks)+ parseFloat(f.keyakinan_m.value);
    }
    if(!(f.soalJawab.value=="")){
    temp = f.soalJawab.value/10*2;
    f.soalJawab_m.value = temp.toFixed(2);
    marks=parseFloat(marks)+ parseFloat(f.soalJawab_m.value);
    }
    temp = marks;
    f.total.value=temp.toFixed(2);
}

function save(option)
{
    var f = document.forms[0];
    if(f.comment.value=="")
        {
            alert("Comment cannot be blanked.");
            return;
        }
    if((f.peradaban.value=="")){
        alert("Peradaban persembahan cannot be blanked.");
        return;
    }
     if((f.persiapan.value=="")){
         alert("Persiapan dan susunan pembentangan cannot be blanked");
         return;
     }
     
    
    if((f.ketepatan.value=="")){
        alert("Ketepatan dan kejelasan penyampaian cannot be blanked");
        return;
     
    }
    if((f.kefahaman.value=="")){
     alert("Kefahaman mengenai projek");
        return;
    }
    if((f.keyakinan.value=="")){
     alert("Keyakinan semasa penyampaian cannot be blanked");
        return;
    }
    if((f.soalJawab.value=="")){
    alert("Pengendalian soal jawab cannot be blanked");
        return;
    }
    var add;
    var c = confirm("Submit Evaluation Form.")
    if(c==true){
    
    if(option=="psm1")
       add = "./ServLecEvaluation_Chairman?Option=Chairman";
    else if(option=="psm2")
       add = "./ServLecEvaluation_Chairman?Option=Chairman_psm2";
    else if(option=="psm1_Edit")
       add = "./ServLecEvaluation_Chairman?Option=Chairman_Edit";
    else if(option=="psm2_Edit")
       add = "./ServLecEvaluation_Chairman?Option=Chairman_psm2_Edit";
   
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
   var f = document.forms[0]; 
   document.getElementById("itemEdit").className="editHide";
   document.getElementById("itemSaveChanges").className="saveChangesShow";
   f.comment.readOnly=false;
   f.peradaban.disabled=false;
   f.persiapan.disabled=false;
   f.ketepatan.disabled=false;
   f.kefahaman.disabled=false;
   f.keyakinan.disabled=false;
   f.soalJawab.disabled=false;
}