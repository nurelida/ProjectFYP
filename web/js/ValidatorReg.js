 function validateInline(id, input) {
          if(id == "studname")
              if(input.trim().length > 0) {
                  if (input.length>0) {
                      document.getElementById("namestat").hidden=true;
                      document.getElementById(id + "stat").classList.remove("glyphicon-remove");
                      document.getElementById(id + "-group").classList.remove("has-error");
                     document.getElementById(id + "-group").classList.remove("has-warning");
                     document.getElementById(id + "-group").classList.add("has-success");
                     document.getElementById(id + "stat").classList.add("glyphicon-ok");
                     
                 }
             } else {
                 document.getElementById(id + "stat").classList.remove("glyphicon-ok");
                 document.getElementById(id + "-group").classList.remove("has-success");
                 document.getElementById(id + "-group").classList.remove("has-warning");
                 document.getElementById(id + "-group").classList.add("has-error");
                 document.getElementById(id + "stat").classList.add("glyphicon-remove");
                 
                 
                
             }
         if(id == "department") {

             if(document.getElementById("department").value!="") {
                 document.getElementById("departmentstat2").hidden=true;
                 
                 document.getElementById("departmentstat").classList.remove("glyphicon-remove");
                 document.getElementById("department-group").classList.remove("has-error");
                 document.getElementById("department-group").classList.add("has-success");
                 document.getElementById("departmentstat").classList.add("glyphicon-ok");
             } else if (document.getElementById("department").value==""){
                 document.getElementById("departmenstat2").hidden=true;
                 
                 document.getElementById("departmentstat").classList.remove("glyphicon-ok");
                 document.getElementById("department-group").classList.remove("has-success");
                 document.getElementById("department-group").classList.add("has-error");
                 document.getElementById("departmentstat").classList.add("glyphicon-remove");
             }
         }
         if(id == "status") {

             if(document.getElementById("status").value!="") {
                 document.getElementById("statusstat2").hidden=true;
                 
                 document.getElementById("statusstat").classList.remove("glyphicon-remove");
                 document.getElementById("status-group").classList.remove("has-error");
                 document.getElementById("status-group").classList.add("has-success");
                 document.getElementById("statysstat").classList.add("glyphicon-ok");
             } else if (document.getElementById("status").value==""){
                 document.getElementById("statusstat2").hidden=true;
                 
                 document.getElementById("statusstat").classList.remove("glyphicon-ok");
                 document.getElementById("status-group").classList.remove("has-success");
                 document.getElementById("status-group").classList.add("has-error");
                 document.getElementById("statusstat").classList.add("glyphicon-remove");
             }
         }
         if(id == "email") {
             emailValidator = /^[\w._-]+[+]?[\w._-]+@[\w.-]+\.[a-zA-Z]{2,6}$/;
             if(input.length > 0 && input.match(emailValidator)) {
                 document.getElementById("emailstat2").hidden=true;
                 document.getElementById("emailstat3").hidden=true;
                 document.getElementById("emailstat").classList.remove("glyphicon-remove");
                 document.getElementById("email-group").classList.remove("has-error");
                 document.getElementById("email-group").classList.add("has-success");
                  document.getElementById("emailstat").classList.add("glyphicon-ok");
             } else {
                 document.getElementById("emailstat2").hidden=true;
                 document.getElementById("emailstat3").hidden=true;
                 document.getElementById("emailstat").classList.remove("glyphicon-ok");
                 document.getElementById("email-group").classList.remove("has-success");
                 document.getElementById("email-group").classList.add("has-error");
                 document.getElementById("emailstat").classList.add("glyphicon-remove");
             }
         }
         if(id == "contact") {
             contactValidator =/^[0-9]+$/;
             if(input.match(contactValidator)) {
                 document.getElementById("contactstat2").hidden=true;
                 document.getElementById("contactstat3").hidden=true;
                 document.getElementById("contactstat").classList.remove("glyphicon-remove");
                 document.getElementById("contactstat").classList.remove("glyphicon-warning-sign");
                 document.getElementById("contact-group").classList.remove("has-warning");
                 document.getElementById("contact-group").classList.remove("has-error");
                 document.getElementById("contact-group").classList.add("has-success");
                 document.getElementById("contactstat").classList.add("glyphicon-ok");
             }else {
                 document.getElementById("contactstat2").hidden=true;
                 document.getElementById("contactstat3").hidden=true;
                 document.getElementById("contactstat").classList.remove("glyphicon-warning-sign");
                 document.getElementById("contactstat").classList.remove("glyphicon-ok");
                 document.getElementById("contact-group").classList.remove("has-warning");
                 document.getElementById("contact-group").classList.remove("has-success");
                 document.getElementById("contact-group").classList.add("has-error");
                 document.getElementById("contactstat").classList.add("glyphicon-remove");
             }
         }
            if(id == "room") {
             roomValidator =/^[0-9a-zA-Z\- ]+$/;
             if(input.match(roomValidator)) {
                 document.getElementById("roomstat2").hidden=true;
                 document.getElementById("roomstat3").hidden=true;
                 document.getElementById("roomstat").classList.remove("glyphicon-remove");
                 document.getElementById("roomstat").classList.remove("glyphicon-warning-sign");
                 document.getElementById("room-group").classList.remove("has-warning");
                 document.getElementById("room-group").classList.remove("has-error");
                 document.getElementById("room-group").classList.add("has-success");
                 document.getElementById("roomstat").classList.add("glyphicon-ok");
             } else {
                 document.getElementById("roomstat2").hidden=true;
                 document.getElementById("roomstat3").hidden=true;
                 document.getElementById("roomstat").classList.remove("glyphicon-warning-sign");
                 document.getElementById("roomstat").classList.remove("glyphicon-ok");
                 document.getElementById("room-group").classList.remove("has-warning");
                 document.getElementById("room-group").classList.remove("has-success");
                 document.getElementById("room-group").classList.add("has-error");
                 document.getElementById("roomstat").classList.add("glyphicon-remove");
             }
         }
         if(id == "ic") {
             if(input.length== 0){
                 document.getElementById("icstat2").hidden=true;
                 document.getElementById("icstat3").hidden=true;
                 document.getElementById("icstat").classList.remove("glyphicon-warning-sign");
                 document.getElementById("icstat").classList.remove("glyphicon-ok");
                 document.getElementById("ic-group").classList.remove("has-warning");
                 document.getElementById("ic-group").classList.remove("has-success");
                 document.getElementById("ic-group").classList.add("has-error");
                 document.getElementById("icstat").classList.add("glyphicon-remove");
             }
             else{
                  document.getElementById("icstat2").hidden=true;
                 document.getElementById("icstat3").hidden=true;
                 document.getElementById("icstat").classList.remove("glyphicon-warning-sign");
                 document.getElementById("icstat").classList.remove("glyphicon-remove");
                 document.getElementById("ic-group").classList.remove("has-error");
                 document.getElementById("ic-group").classList.remove("has-warning");
                 document.getElementById("ic-group").classList.add("has-success");
                 document.getElementById("icstat").classList.add("glyphicon-ok");
             }
         }
         if(id == "matric") {
             matricValidator =/^[A-Za-z]{2}[0-9]{6}$/;
             if(input.match(matricValidator)) {
                 document.getElementById("matricstat2").hidden=true;
                 document.getElementById("matricstat3").hidden=true;
                 document.getElementById("matricstat").classList.remove("glyphicon-remove");
                 document.getElementById("matricstat").classList.remove("glyphicon-warning-sign");
                 document.getElementById("matric-group").classList.remove("has-warning");
                 document.getElementById("matric-group").classList.remove("has-error");
                 document.getElementById("matric-group").classList.add("has-success");
                 document.getElementById("matricstat").classList.add("glyphicon-ok");
             } else {
                 document.getElementById("matricstat2").hidden=true;
                 document.getElementById("matricstat3").hidden=true;
                 document.getElementById("matricstat").classList.remove("glyphicon-warning-sign");
                 document.getElementById("matricstat").classList.remove("glyphicon-ok");
                 document.getElementById("matric-group").classList.remove("has-warning");
                 document.getElementById("matric-group").classList.remove("has-success");
                 document.getElementById("matric-group").classList.add("has-error");
                 document.getElementById("matricstat").classList.add("glyphicon-remove");
             }
         }
         if(id == "matriclect") {
             
             if(input.length> 0) {
                 document.getElementById("matricstat2").hidden=true;
                 document.getElementById("matricstat3").hidden=true;
                 document.getElementById("matricstat").classList.remove("glyphicon-remove");
                 document.getElementById("matricstat").classList.remove("glyphicon-warning-sign");
                 document.getElementById("matric-group").classList.remove("has-warning");
                 document.getElementById("matric-group").classList.remove("has-error");
                 document.getElementById("matric-group").classList.add("has-success");
                 document.getElementById("matricstat").classList.add("glyphicon-ok");
             } else {
                 document.getElementById("matricstat2").hidden=true;
                 document.getElementById("matricstat3").hidden=true;
                 document.getElementById("matricstat").classList.remove("glyphicon-warning-sign");
                 document.getElementById("matricstat").classList.remove("glyphicon-ok");
                 document.getElementById("matric-group").classList.remove("has-warning");
                 document.getElementById("matric-group").classList.remove("has-success");
                 document.getElementById("matric-group").classList.add("has-error");
                 document.getElementById("matricstat").classList.add("glyphicon-remove");
             }
         }
         if(id == "pass") {
       
             if(input.length>0) {
                 document.getElementById("passstat2").hidden=true;
                 document.getElementById(id+"stat").classList.remove("glyphicon-remove");
                 document.getElementById(id+"stat").classList.remove("glyphicon-warning-sign");
                 document.getElementById(id+"-group").classList.remove("has-warning");
                 document.getElementById(id+"-group").classList.remove("has-error");
                 document.getElementById(id+"-group").classList.add("has-success");
                 document.getElementById(id+"stat").classList.add("glyphicon-ok");
             } else {
                 document.getElementById("passstat2").hidden=true;
                 document.getElementById(id+"stat").classList.remove("glyphicon-warning-sign");
                 document.getElementById(id+"stat").classList.remove("glyphicon-ok");
                 document.getElementById(id+"-group").classList.remove("has-warning");
                 document.getElementById(id+"-group").classList.remove("has-success");
                 document.getElementById(id+"-group").classList.add("has-error");
                 document.getElementById(id+"stat").classList.add("glyphicon-remove");
             }
         }
         if(id == "passcom") {
       
             if(input.length>0) {
                 document.getElementById("pswcom").hidden=true;
                 document.getElementById("passcomstat2").hidden=true;
                 document.getElementById(id+"stat").classList.remove("glyphicon-remove");
                 document.getElementById(id+"stat").classList.remove("glyphicon-warning-sign");
                 document.getElementById(id+"-group").classList.remove("has-warning");
                 document.getElementById(id+"-group").classList.remove("has-error");
                 document.getElementById(id+"-group").classList.add("has-success");
                 document.getElementById(id+"stat").classList.add("glyphicon-ok");
             } else {
                 document.getElementById("passcomstat2").hidden=true;
                 document.getElementById(id+"stat").classList.remove("glyphicon-warning-sign");
                 document.getElementById(id+"stat").classList.remove("glyphicon-ok");
                 document.getElementById(id+"-group").classList.remove("has-warning");
                 document.getElementById(id+"-group").classList.remove("has-success");
                 document.getElementById(id+"-group").classList.add("has-error");
                 document.getElementById(id+"stat").classList.add("glyphicon-remove");
             }
         }
//          if(id == "pass"||id=="passcom") {
//            if(id=="pass"){
//               var pass=input.toString();
//            }
//            else{
//                var passcom=input.toString();
//            }
//         }
         
         
         
     }
 
     function validateForm() {
         valid = true;
 
         var studname = document.getElementById("studname").value;
         var department = document.getElementById("department").value;
        
         var matric = document.getElementById("matric").value;
         var ic = document.getElementById("ic").value;
         var email = document.getElementById("email").value;
         var contact = document.getElementById("contact").value;
         var passw = document.getElementById("pass").value;
         var passcomf = document.getElementById("passcom").value;
      
 
         if(studname.trim().length == 0 ){
             valid = false;
             document.getElementById("namestat").hidden=false;
             document.getElementById("studname-group").classList.add("has-error");
                 document.getElementById("studnamestat").classList.add("glyphicon-remove");
         }
         if(passw.trim().length == 0 ){
             valid = false;
             document.getElementById("passstat2").hidden=false;
             document.getElementById("pass-group").classList.add("has-error");
                 document.getElementById("passstat").classList.add("glyphicon-remove");
         }
         if(department=="" ){
             valid = false;
             document.getElementById("departmentstat2").hidden=false;
             document.getElementById("department-group").classList.add("has-error");
             document.getElementById("departmentstat").classList.add("glyphicon-remove");
         }
         if(passcomf.trim().length == 0 ){
             valid = false;
             document.getElementById("passcomstat2").hidden=false;
             document.getElementById("passcom-group").classList.add("has-error");
                 document.getElementById("passcomstat").classList.add("glyphicon-remove");
         }
         if(passw.match(passcomf)){
             if(passw.length>0){
             valid = true;
             document.getElementById("passcomstat").classList.remove("glyphicon-remove");
                 document.getElementById("passcomstat").classList.remove("glyphicon-warning-sign");
                 document.getElementById("passcom-group").classList.remove("has-warning");
                 document.getElementById("passcom-group").classList.remove("has-error");
                 document.getElementById("passcom-group").classList.add("has-success");
                 document.getElementById("passcomstat").classList.add("glyphicon-ok");
                 document.getElementById("pswcom").hidden=true;
             }
         }
         if(passw!==(passcomf)){
             valid = false;
             document.getElementById("passcomstat").classList.remove("glyphicon-remove");
                 document.getElementById("passcomstat").classList.remove("glyphicon-ok");
                 document.getElementById("passcom-group").classList.remove("has-error");
                 document.getElementById("passcom-group").classList.remove("has-success");
             document.getElementById("passcom-group").classList.add("has-warning");
                 document.getElementById("passcomstat").classList.add("glyphicon-warning-sign");
                 document.getElementById("pswcom").hidden=false;
         }
         if(matric.length > 0) {
             matricValidator =/^[A-Za-z]{2}[0-9]{6}$/;
             if(!matric.match(matricValidator)){
                 valid = false;
                 document.getElementById("matricstat2").hidden=true;
                 document.getElementById("matricstat3").hidden=false;
                 document.getElementById("matricstat").classList.remove("glyphicon-remove");
                 document.getElementById("matricstat").classList.remove("glyphicon-ok");
                 document.getElementById("matric-group").classList.remove("has-error");
                 document.getElementById("matric-group").classList.remove("has-success");
                 document.getElementById("matric-group").classList.add("has-warning");
                 document.getElementById("matricstat").classList.add("glyphicon-warning-sign");
             }
         } else {
             valid = false;
             document.getElementById("matricstat3").hidden=true;
             document.getElementById("matricstat2").hidden=false;
             document.getElementById("matricstat").classList.remove("glyphicon-warning-sign");
             document.getElementById("matricstat").classList.remove("glyphicon-ok");
             document.getElementById("matric-group").classList.remove("has-warning");
             document.getElementById("matric-group").classList.remove("has-success");
             document.getElementById("matric-group").classList.add("has-error");
             document.getElementById("matricstat").classList.add("glyphicon-remove");
         }
         if(email.length > 0) {
             emailValidator = /^[\w._-]+[+]?[\w._-]+@[\w.-]+\.[a-zA-Z]{2,6}$/;
             if(!email.match(emailValidator)){
                 valid = false;
                 document.getElementById("emailstat2").hidden=true;
                 document.getElementById("emailstat3").hidden=false;
                 document.getElementById("emailstat").classList.remove("glyphicon-ok");
                 document.getElementById("email-group").classList.remove("has-success");
                 document.getElementById("email-group").classList.add("has-error");
                 document.getElementById("emailstat").classList.add("glyphicon-remove");
             }
         } else {
                 valid = false;
                 document.getElementById("emailstat2").hidden=false;
                 document.getElementById("emailstat3").hidden=true;
                 document.getElementById("emailstat").classList.remove("glyphicon-ok");
                 document.getElementById("email-group").classList.remove("has-success");
                 document.getElementById("email-group").classList.add("has-error");
                 document.getElementById("emailstat").classList.add("glyphicon-remove");
             
         }
         if(contact.length > 0) {
             contactValidator =/^[0-9]+$/;
             if(!contact.match(contactValidator)){
                 valid = false;
                 document.getElementById("contactstat2").hidden=true;
                 document.getElementById("contactstat3").hidden=false;
                 document.getElementById("contactstat").classList.remove("glyphicon-remove");
                 document.getElementById("contactstat").classList.remove("glyphicon-ok");
                 document.getElementById("contact-group").classList.remove("has-error");
                 document.getElementById("contact-group").classList.remove("has-success");
                 document.getElementById("contact-group").classList.add("has-warning");
                 document.getElementById("contactstat").classList.add("glyphicon-warning-sign");
                 
             }
         } else {
             valid = false;
             document.getElementById("contactstat2").hidden=false;
                 document.getElementById("contactstat3").hidden=true;
                 document.getElementById("contactstat").classList.remove("glyphicon-warning-sign");
                 document.getElementById("contactstat").classList.remove("glyphicon-ok");
                 document.getElementById("contact-group").classList.remove("has-error");
                 document.getElementById("contact-group").classList.remove("has-warning");
                 document.getElementById("contact-group").classList.add("has-error");
                 document.getElementById("contactstat").classList.add("glyphicon-remove");
         }
         if(ic.trim().length == 0) {
             
            
             valid = false;
             document.getElementById("icstat3").hidden=true;
             document.getElementById("icstat2").hidden=false;
             document.getElementById("icstat").classList.remove("glyphicon-warning-sign");
             document.getElementById("icstat").classList.remove("glyphicon-ok");
             document.getElementById("ic-group").classList.remove("has-warning");
             document.getElementById("ic-group").classList.remove("has-success");
             document.getElementById("ic-group").classList.add("has-error");
             document.getElementById("icstat").classList.add("glyphicon-remove");
             
             
         } 
         
       
         if(valid) {
             document.body.innerHTML += '<form id="frm_register"  action="./ServRegister" method="POST">' +
                                             '<input type="hidden" name="stud_name" value="'+studname+'">' +
                                             '<input type="hidden" name="matric_no" value="'+matric+'">' +
                                             '<input type="hidden" name="department" value="'+department+'">' +
                                             '<input type="hidden" name="ic_no" value="'+ic+'">' +
                                             '<input type="hidden" name="phone_no" value="'+contact+'">' +
                                             '<input type="hidden" name="email_add" value="'+email+'">' +
                                             '<input type="hidden" name="psw" value="'+passw+'">' +
                                         '</form>';
             document.getElementById("frm_register").submit();
         }
         
     }
     function validateFormLecture() {
         valid = true;
 
         var studname = document.getElementById("studname").value;
         var room = document.getElementById("room").value;
         var dept = document.getElementById("department").value;
         var matric = document.getElementById("matriclect").value;
         var status = document.getElementById("status").value;
         var email = document.getElementById("email").value;
         var contact = document.getElementById("contact").value;
         var passw = document.getElementById("pass").value;
         var passcomf = document.getElementById("passcom").value;
      
     
         if(studname.trim().length == 0 ){
             valid = false;
             document.getElementById("namestat").hidden=false;
             document.getElementById("studname-group").classList.add("has-error");
                 document.getElementById("studnamestat").classList.add("glyphicon-remove");
         }
         if(passw.trim().length == 0 ){
             valid = false;
             document.getElementById("passstat2").hidden=false;
             document.getElementById("pass-group").classList.add("has-error");
                 document.getElementById("passstat").classList.add("glyphicon-remove");
         }
         if(room=="" ){
             valid = false;
             document.getElementById("roomstat2").hidden=false;
             document.getElementById("room-group").classList.add("has-error");
             document.getElementById("roomstat").classList.add("glyphicon-remove");
         }
         if(passcomf.trim().length == 0 ){
             valid = false;
             document.getElementById("passcomstat2").hidden=false;
             document.getElementById("passcom-group").classList.add("has-error");
                 document.getElementById("passcomstat").classList.add("glyphicon-remove");
         }
         if(passw.match(passcomf)){
             if(passw.length>0){
             valid = true;
             document.getElementById("passcomstat").classList.remove("glyphicon-remove");
                 document.getElementById("passcomstat").classList.remove("glyphicon-warning-sign");
                 document.getElementById("passcom-group").classList.remove("has-warning");
                 document.getElementById("passcom-group").classList.remove("has-error");
                 document.getElementById("passcom-group").classList.add("has-success");
                 document.getElementById("passcomstat").classList.add("glyphicon-ok");
                 document.getElementById("pswcom").hidden=true;
             }
         }
         if(passw!==(passcomf)){
             valid = false;
             document.getElementById("passcomstat").classList.remove("glyphicon-remove");
                 document.getElementById("passcomstat").classList.remove("glyphicon-ok");
                 document.getElementById("passcom-group").classList.remove("has-error");
                 document.getElementById("passcom-group").classList.remove("has-success");
             document.getElementById("passcom-group").classList.add("has-warning");
                 document.getElementById("passcomstat").classList.add("glyphicon-warning-sign");
                 document.getElementById("pswcom").hidden=false;
         }
         if(matric.length==0) {
             
   
             valid = false;
             document.getElementById("matricstat3").hidden=true;
             document.getElementById("matricstat2").hidden=false;
             document.getElementById("matricstat").classList.remove("glyphicon-warning-sign");
             document.getElementById("matricstat").classList.remove("glyphicon-ok");
             document.getElementById("matric-group").classList.remove("has-warning");
             document.getElementById("matric-group").classList.remove("has-success");
             document.getElementById("matric-group").classList.add("has-error");
             document.getElementById("matricstat").classList.add("glyphicon-remove");
         }
         if(email.length > 0) {
             emailValidator = /^[\w._-]+[+]?[\w._-]+@[\w.-]+\.[a-zA-Z]{2,6}$/;
             if(!email.match(emailValidator)){
                 valid = false;
                 document.getElementById("emailstat2").hidden=true;
                 document.getElementById("emailstat3").hidden=false;
                 document.getElementById("emailstat").classList.remove("glyphicon-ok");
                 document.getElementById("email-group").classList.remove("has-success");
                 document.getElementById("email-group").classList.add("has-error");
                 document.getElementById("emailstat").classList.add("glyphicon-remove");
             }
         } else {
                 valid = false;
                 document.getElementById("emailstat2").hidden=false;
                 document.getElementById("emailstat3").hidden=true;
                 document.getElementById("emailstat").classList.remove("glyphicon-ok");
                 document.getElementById("email-group").classList.remove("has-success");
                 document.getElementById("email-group").classList.add("has-error");
                 document.getElementById("emailstat").classList.add("glyphicon-remove");
             
         }
         if(contact.length > 0) {
             contactValidator =/^[0-9]+$/;
             if(!contact.match(contactValidator)){
                 valid = false;
                 document.getElementById("contactstat2").hidden=true;
                 document.getElementById("contactstat3").hidden=false;
                 document.getElementById("contactstat").classList.remove("glyphicon-remove");
                 document.getElementById("contactstat").classList.remove("glyphicon-ok");
                 document.getElementById("contact-group").classList.remove("has-error");
                 document.getElementById("contact-group").classList.remove("has-success");
                 document.getElementById("contact-group").classList.add("has-warning");
                 document.getElementById("contactstat").classList.add("glyphicon-warning-sign");
                 
             }
         } else {
             valid = false;
             document.getElementById("contactstat2").hidden=false;
                 document.getElementById("contactstat3").hidden=true;
                 document.getElementById("contactstat").classList.remove("glyphicon-warning-sign");
                 document.getElementById("contactstat").classList.remove("glyphicon-ok");
                 document.getElementById("contact-group").classList.remove("has-error");
                 document.getElementById("contact-group").classList.remove("has-warning");
                 document.getElementById("contact-group").classList.add("has-error");
                 document.getElementById("contactstat").classList.add("glyphicon-remove");
         }
         if(status=="") {
             
            
             valid = false;
             //document.getElementById("statusstat3").hidden=true;
             document.getElementById("statusstat2").hidden=false;
             document.getElementById("statusstat").classList.remove("glyphicon-warning-sign");
             document.getElementById("statusstat").classList.remove("glyphicon-ok");
             document.getElementById("status-group").classList.remove("has-warning");
             document.getElementById("status-group").classList.remove("has-success");
             document.getElementById("status-group").classList.add("has-error");
             document.getElementById("status").classList.add("glyphicon-remove");
             
             
         }
          if(dept=="") {
             
            
             valid = false;
             //document.getElementById("statusstat3").hidden=true;
             document.getElementById("departmentstat2").hidden=false;
             document.getElementById("departmentstat").classList.remove("glyphicon-warning-sign");
             document.getElementById("departmentstat").classList.remove("glyphicon-ok");
             document.getElementById("department-group").classList.remove("has-warning");
             document.getElementById("department-group").classList.remove("has-success");
             document.getElementById("department-group").classList.add("has-error");
             document.getElementById("department").classList.add("glyphicon-remove");
             
             
         } 
        
       
         if(valid) {
             document.body.innerHTML += '<form id="frm_registerLec"  action="./ServAdRegisterLec" method="POST">' +
                                             '<input type="hidden" name="stud_name" value="'+studname+'">' +
                                             '<input type="hidden" name="matric_no" value="'+matric+'">' +
                                             '<input type="hidden" name="department" value="'+dept+'">' +
                                             '<input type="hidden" name="roomNo" value="'+room+'">' +
                                             '<input type="hidden" name="lec_status" value="'+status+'">' +
                                             '<input type="hidden" name="phone_no" value="'+contact+'">' +
                                             '<input type="hidden" name="email_add" value="'+email+'">' +
                                             '<input type="hidden" name="psw" value="'+passw+'">' +
                                         '</form>';
             document.getElementById("frm_registerLec").submit();
         }
         
     }
