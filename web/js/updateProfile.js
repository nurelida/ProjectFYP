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
         if(id=="room"){
             if(input.length>0){
                 document.getElementById("room-group").classList.remove("has-error");
                 document.getElementById("roomstat").classList.remove("glyphicon-remove");
                  document.getElementById("room-group").classList.add("has-success");
                 document.getElementById("roomstat").classList.add("glyphicon-ok");
                 
             }else{
                 document.getElementById("roomstat").hidden=false;
                 document.getElementById("room-group").classList.remove("has-success");
                 document.getElementById("roomstat").classList.remove("glyphicon-ok");
             document.getElementById("room-group").classList.add("has-error");
                 document.getElementById("roomstat").classList.add("glyphicon-remove");
                 
             }
         }
         if(id == "ic") {
           
             if(input.length>0) {
                 document.getElementById("icstat2").hidden=true;
                 document.getElementById("icstat").classList.remove("glyphicon-remove");
                 document.getElementById("icstat").classList.remove("glyphicon-warning-sign");
                 document.getElementById("ic-group").classList.remove("has-warning");
                 document.getElementById("ic-group").classList.remove("has-error");
                 document.getElementById("ic-group").classList.add("has-success");
                 document.getElementById("icstat").classList.add("glyphicon-ok");
             }else {
                 document.getElementById("icstat2").hidden=true;
                 document.getElementById("icstat").classList.remove("glyphicon-warning-sign");
                 document.getElementById("icstat").classList.remove("glyphicon-ok");
                 document.getElementById("ic-group").classList.remove("has-warning");
                 document.getElementById("ic-group").classList.remove("has-success");
                 document.getElementById("ic-group").classList.add("has-error");
                 document.getElementById("icstat").classList.add("glyphicon-remove");
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
         if(id == "oldpass") {
       
             if(input.length>0) {
                 document.getElementById("oldpassstat2").hidden=true;
                 document.getElementById(id+"stat").classList.remove("glyphicon-remove");
                 document.getElementById(id+"stat").classList.remove("glyphicon-warning-sign");
                 document.getElementById(id+"-group").classList.remove("has-warning");
                 document.getElementById(id+"-group").classList.remove("has-error");
                 document.getElementById(id+"-group").classList.add("has-success");
                 document.getElementById(id+"stat").classList.add("glyphicon-ok");
             } else {
                 document.getElementById("oldpassstat2").hidden=true;
                 document.getElementById(id+"stat").classList.remove("glyphicon-warning-sign");
                 document.getElementById(id+"stat").classList.remove("glyphicon-ok");
                 document.getElementById(id+"-group").classList.remove("has-warning");
                 document.getElementById(id+"-group").classList.remove("has-success");
                 document.getElementById(id+"-group").classList.add("has-error");
                 document.getElementById(id+"stat").classList.add("glyphicon-remove");
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
 
     function validateUpdateProfile() {
         valid = true;
         var name = document.getElementById("studname").value;
         var emails = document.getElementById("email").value;
         var contacts = document.getElementById("contact").value;
         var ic = document.getElementById("ic").value;
         

         
         
    
 
         if(name.trim().length == 0 ){
             valid = false;
             document.getElementById("namestat").hidden=false;
             document.getElementById("studname-group").classList.add("has-error");
                 document.getElementById("studnamestat").classList.add("glyphicon-remove");
         }
         if(ic.trim().length == 0 ){
             valid = false;
             document.getElementById("icstat2").hidden=false;
             document.getElementById("ic-group").classList.add("has-error");
                 document.getElementById("icstat").classList.add("glyphicon-remove");
         }
         if(emails.length > 0) {
             emailValidator = /^[\w._-]+[+]?[\w._-]+@[\w.-]+\.[a-zA-Z]{2,6}$/;
             if(!emails.match(emailValidator)){
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
         if(contacts.length > 0) {
             contactValidator =/^[0-9]+$/;
             if(!contacts.match(contactValidator)){
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
        
        if(valid) {
      
            document.body.innerHTML += '<form id="frm_changeProfile"  action="./ServStudEditProfile?Option=UpdateProfile" method="POST">' +
                                             '<input type="hidden" name="stud_name" value="'+name+'">' +
                                             '<input type="hidden" name="ic_no" value="'+ic+'">' +
                                             '<input type="hidden" name="email_add" value="'+emails+'">' +
                                             '<input type="hidden" name="phone_no" value="'+contacts+'">' +
                                         '</form>';
             document.getElementById("frm_changeProfile").submit();
         }
         
     }
     function validateUpdateProfileLecture() {
         
         valid = true;
         var name = document.getElementById("studname").value;
         var emails = document.getElementById("email").value;
         var contacts = document.getElementById("contact").value;
         var room= document.getElementById("room").value;
         

         
         
    
 
         if(name.trim().length == 0 ){
             valid = false;
             document.getElementById("namestat").hidden=false;
             document.getElementById("studname-group").classList.add("has-error");
                 document.getElementById("studnamestat").classList.add("glyphicon-remove");
         }
         if(room.trim().length == 0 ){
             valid = false;
             document.getElementById("roomstat").hidden=false;
             document.getElementById("room-group").classList.add("has-error");
                 document.getElementById("roomstat").classList.add("glyphicon-remove");
         }
         if(emails.length > 0) {
             emailValidator = /^[\w._-]+[+]?[\w._-]+@[\w.-]+\.[a-zA-Z]{2,6}$/;
             if(!emails.match(emailValidator)){
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
         if(contacts.length > 0) {
             contactValidator =/^[0-9]+$/;
             if(!contacts.match(contactValidator)){
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
         }
        
        if(valid) {
      
            document.body.innerHTML += '<form id="frm_changeProfile"  action="./ServLecEditProfile?Option=UpdateProfile" method="POST">' +
                                             '<input type="hidden" name="stud_name" value="'+name+'">' +
                                             '<input type="hidden" name="roomNo" value="'+room+'">' +
                                             '<input type="hidden" name="email_add" value="'+emails+'">' +
                                             '<input type="hidden" name="phone_no" value="'+contacts+'">' +
                                         '</form>';
             document.getElementById("frm_changeProfile").submit();
         }
         
     }
     function changePswForm() {
         valid = true;
 
         var old = document.getElementById("oldpass").value;
         var psw = document.getElementById("pass").value;
         var pswcom = document.getElementById("passcom").value;
      
 
         if(old.trim().length == 0 ){
             valid = false;
             document.getElementById("oldpassstat2").hidden=false;
             document.getElementById("oldpass-group").classList.add("has-error");
             document.getElementById("oldpassstat").classList.add("glyphicon-remove");
         }
         if(psw.trim().length == 0 ){
             valid = false;
             document.getElementById("namestat").hidden=false;
             document.getElementById("studname-group").classList.add("has-error");
                 document.getElementById("studnamestat").classList.add("glyphicon-remove");
         }
         if(pswcom.trim().length == 0 ){
             valid = false;
             document.getElementById("namestat").hidden=false;
             document.getElementById("studname-group").classList.add("has-error");
                 document.getElementById("studnamestat").classList.add("glyphicon-remove");
         }
         if(psw.match(pswcom)){
             if(psw.length>0){
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
         if(psw!==(pswcom)){
             valid = false;
             document.getElementById("passcomstat").classList.remove("glyphicon-remove");
                 document.getElementById("passcomstat").classList.remove("glyphicon-ok");
                 document.getElementById("passcom-group").classList.remove("has-error");
                 document.getElementById("passcom-group").classList.remove("has-success");
             document.getElementById("passcom-group").classList.add("has-warning");
                 document.getElementById("passcomstat").classList.add("glyphicon-warning-sign");
                 document.getElementById("pswcom").hidden=false;
         }
         
        
            if(valid) {
             document.body.innerHTML += '<form id="frm_changePsw"  action="./ServStudEditProfile?Option=ChgPsw" method="POST">' +
                                             '<input type="hidden" name="oldpsw" value="'+old+'">' +
                                             '<input type="hidden" name="psw" value="'+psw+'">' +
                                             '<input type="hidden" name="pswConfirm" value="'+pswcom+'">' +
                                         '</form>';
             document.getElementById("frm_changePsw").submit();
         }
         
     }
     function changePswForm() {
         valid = true;
 
         var old = document.getElementById("oldpass").value;
         var psw = document.getElementById("pass").value;
         var pswcom = document.getElementById("passcom").value;
      
 
         if(old.trim().length == 0 ){
             valid = false;
             document.getElementById("oldpassstat2").hidden=false;
             document.getElementById("oldpass-group").classList.add("has-error");
             document.getElementById("oldpassstat").classList.add("glyphicon-remove");
         }
         if(psw.trim().length == 0 ){
             valid = false;
             document.getElementById("namestat").hidden=false;
             document.getElementById("studname-group").classList.add("has-error");
                 document.getElementById("studnamestat").classList.add("glyphicon-remove");
         }
         if(pswcom.trim().length == 0 ){
             valid = false;
             document.getElementById("namestat").hidden=false;
             document.getElementById("studname-group").classList.add("has-error");
                 document.getElementById("studnamestat").classList.add("glyphicon-remove");
         }
         if(psw.match(pswcom)){
             if(psw.length>0){
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
         if(psw!==(pswcom)){
             valid = false;
             document.getElementById("passcomstat").classList.remove("glyphicon-remove");
                 document.getElementById("passcomstat").classList.remove("glyphicon-ok");
                 document.getElementById("passcom-group").classList.remove("has-error");
                 document.getElementById("passcom-group").classList.remove("has-success");
             document.getElementById("passcom-group").classList.add("has-warning");
                 document.getElementById("passcomstat").classList.add("glyphicon-warning-sign");
                 document.getElementById("pswcom").hidden=false;
         }
         
        
            if(valid) {
             document.body.innerHTML += '<form id="frm_changePsw"  action="./ServLecEditProfile?Option=ChgPsw" method="POST">' +
                                             '<input type="hidden" name="oldpsw" value="'+old+'">' +
                                             '<input type="hidden" name="psw" value="'+psw+'">' +
                                             '<input type="hidden" name="pswConfirm" value="'+pswcom+'">' +
                                         '</form>';
             document.getElementById("frm_changePsw").submit();
         }
         
     }
