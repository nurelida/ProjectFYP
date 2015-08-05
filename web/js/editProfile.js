function EditProfile()
{   
    var d = document;
    var f = document.forms[0];
   
    f.stud_name.onblur = function(event){javascript:this.value=trim(this.value); validateName();};
    f.phone_no.onblur = function(event) {javascript:validatePhoneNum();};
    f.email_add.onblur = function(event) {javascript:validateEmail();};
    f.stud_name.readOnly = false;
    f.phone_no.readOnly = false;
    f.email_add.readOnly = false;
    d.getElementById("buttonItem").className = "buttonHide";
    d.getElementById("UpdateItem").className = "btnUpdateShow";
    d.getElementById("ChgItem").className = "btnChgHide";
   
   
}

function lecEditProfile()
{   
    var d = document;
    var f = document.forms[0];
   
    f.stud_name.onblur = function(event){javascript:this.value=trim(this.value); validateName();};
    f.phone_no.onblur = function(event) {javascript:validatePhoneNum();};
    f.email_add.onblur = function(event) {javascript:validateEmail();};
    f.stud_name.readOnly = false;
    f.phone_no.readOnly = false;
    f.email_add.readOnly = false;
    f.roomNo.readOnly = false;
    d.getElementById("buttonItem").className = "buttonHide";
    d.getElementById("UpdateItem").className = "btnUpdateShow";
    d.getElementById("ChgItem").className = "btnChgHide";
   
   
}


function BackToDefault()
{
    
    var d = document;
    var f = document.forms[0];
    f.psw.value = "";
    f.psw_confirm.value = "";
    f.oldpsw.value="";
    document.getElementById("pswValidation").innerHTML=''
    document.getElementById("pswConfirmation").innerHTML=''
    
    f.stud_name.readOnly = true;
    f.phone_no.readOnly = true;
    f.email_add.readOnly = true;
    d.getElementById("profileItem").className = "profileShow";
    d.getElementById("pswItem").className = "pswHide";
    d.getElementById("buttonItem").className = "buttonShow";
    d.getElementById("UpdateItem").className = "btnUpdateHide";
    d.getElementById("ChgItem").className = "btnChgHide";
}
function ShowProfile()
{
    var d = document;
    d.getElementById("profileItem").className = "profileShow";
    d.getElementById("pswItem").className = "pswSHide";
}

function ShowPsw()
{
    var d = document;
    d.getElementById("profileItem").className = "profileHide";
    d.getElementById("pswItem").className = "pswShow";
    d.getElementById("buttonItem").className = "buttonHide";
    d.getElementById("UpdateItem").className = "btnUpdateHide";
    d.getElementById("ChgItem").className = "btnChgShow";
}
function updateProfile()
{
    var f = document.forms[0];
    var name = f.stud_name.value;
    var phone_num = f.phone_no.value;
    var email = f.email_add.value;
    
    
    if(name=="")
        {
            alert("Name cannot be blanked.");
            name.focus();
            return;
        }
       
    if(!(isValidName(name)))
        {   
            alert("Name contains invalid charater(s).");
            name.focus();
            return;
        }

    
    if(phone_num=="")
        {
            alert("Contact number cannot be blanked.");
            phone_num.focus();
            return;
        }
    if(!(isValidPhoneNum(phone_num)))
        {
            alert("Invalid phone number format.");
            phone_num.focus();
            return;
        }
    if(email=="")
        {
            alert("Email address cannot be blanked.");
            email.focus();
            return;
        }
     if(!(isValidEmail(email)))
        {
            alert("Invalid Email address format.");
            email.focus();
            return;
        }
    
      
       
}
function chgPsw()
{
    var f = document.forms[0];
    var psw = f.psw.value;
    var oldpsw = f.oldpsw.value;    
    var pswConfirm = f.psw_confirm.value;
    if(oldpsw=="")
        {
            alert("Old Password cannot be blanked.");
            psw.focus();
            return;
        }
     
    if(psw=="")
        {
            alert("Password cannot be blanked.");
            psw.focus();
            return;
        }
     
    if(pswConfirm=="")
         {
             alert("Confirm password cannot be blanked.");
             pswConfirm.focus();
             return;
         }
     if(!(isValidConfirmPassword(pswConfirm)))
         {
             alert("Password and confirm password does not match.");
             pswConfirm.focus();
             return;
         }
      
}
function StudChgPsw()
{
    chgPsw();
    var f = document.forms[0];
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServStudEditProfile?Option=ChgPsw";
    f.submit();
}
function StudUpdateProfile()
{
    updateProfile();
    var f = document.forms[0];
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServStudEditProfile?Option=UpdateProfile";
    f.submit();
}
function LecChgPsw()
{
    chgPsw();
    var f = document.forms[0];
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServLecEditProfile?Option=ChgPsw";
    f.submit();
}
function LecUpdateProfile()
{
    updateProfile();
    var f = document.forms[0];
    var roomNo = f.roomNo.value;
    
    if(roomNo=="")
         {
             alert("Room number cannot be blanked.");
             return;
         }
    else if(!(isValidRoomNo(roomNo)))
        {
            alert("Room number contains invalid character(s).");
            return;
        }
     
    f.method = "POST";
    f.target = "_self";
    f.action = "./ServLecEditProfile?Option=UpdateProfile";
    f.submit();
}
/*This Js used in
 *lecEditProfile
 *studEditProfile
 **/