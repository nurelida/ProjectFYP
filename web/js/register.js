function isValidName(v)
{
   var rePattern =/^[a-zA-Z .@]+$/;
   var re = new RegExp(rePattern);
   
   if (v.match(re))
   {
       return true;
   }
   else 
   {
       return false;
   }
}

function validateName()
{
    var name = document.getElementById("nameValid").value;
    
    if(isValidName(name))
        {
            document.getElementById("nameValidation").innerHTML='<div><img src="Images/correct.gif"></div>'
            onfocus();
        }
     else if(name=="") 
       {

                 document.getElementById("nameValidation").innerHTML='<div><img src="Images/error.gif"></div><div>Name cannot be blanked.</div>'
       }
     else 
       {

                 document.getElementById("nameValidation").innerHTML='<div><img src="Images/error.gif"></div><div>Contain invalid character(s)<br>in name.</div>'
       }
}
//Matric Number Validator
function isValidMatric(v)
{
   var rePattern =/^[A-Za-z]{2}[0-9]{6}$/;
   var re = new RegExp(rePattern);
   
   if (v.match(re))
   {
       return true;
   }
   else 
   {
       return false;
   }
}

function validateMatric()
{
    var matric = document.getElementById("matricValid").value;
    
    if(isValidMatric(matric))
        {
            document.getElementById("matricValidation").innerHTML='<div><img src="Images/correct.gif"></div>'
            onfocus();
        }
     else if(matric=="")
       {

                 document.getElementById("matricValidation").innerHTML='<div><img src="Images/error.gif"></div><div>Metric Number cannot be <br>blanked.</div>'
       }
     else
       {

                 document.getElementById("matricValidation").innerHTML='<div><img src="Images/error.gif"></div><div>Invalid Metric Number Format</div>'
       }
}

//Staff Number validator
function validateStaff()
{
    var matric = document.getElementById("matricValid").value;
    
    
    if(isValidIC(matric))
        {
            document.getElementById("matricValidation").innerHTML='<div><img src="Images/correct.gif"></div>'
            onfocus();
        }
    else if(matric=="")
       {
             document.getElementById("matricValidation").innerHTML='<div><img src="Images/error.gif"></div><div>Staff Number cannot be <br>blanked.</div>'
       }
       
    else
        {
            document.getElementById("matricValidation").innerHTML='<div><img src="Images/error.gif"></div>'
            onfocus();
        }
     
}
// Room Numbeer Validator
function isValidRoomNo(v)
{
    
   var rePattern =/^[0-9a-zA-Z\- ]+$/;
   var re = new RegExp(rePattern);
   
   if (v.match(re))
   {
       return true;
   }
   else 
   {
       return false;
   }
}

function validateRoomNo()
{
    var roomNo = document.getElementById("roomNoValid").value;
    
    
    if(isValidRoomNo(roomNo))
        {
            document.getElementById("roomNoValidation").innerHTML='<div><img src="Images/correct.gif"></div>'
            onfocus();
        }
    else if(roomNo=="")
       {
             document.getElementById("roomNoValidation").innerHTML='<div><img src="Images/error.gif"></div><div>Room number cannot be blanked.</div>'
       }
       
    else
        {
            document.getElementById("roomNoValidation").innerHTML='<div><img src="Images/error.gif"></div>'
            onfocus();
        }
}

// IC Validator
function isValidIC(v)
{
    
   var rePattern =/^[0-9a-zA-Z]+$/;
   var re = new RegExp(rePattern);
   
   if (v.match(re))
   {
       return true;
   }
   else 
   {
       return false;
   }
}
function validateIC()
{
    var ic = document.getElementById("icValid").value;
    
    if(isValidIC(ic))
        {
            document.getElementById("icNumValidation").innerHTML='<div><img src="Images/correct.gif"></div>'
            onfocus();
        }
     else if(ic=="")
       {
                 
                 document.getElementById("icNumValidation").innerHTML='<div><img src="Images/error.gif"></div><div>IC number cannot be blanked.</div>'
       }
     else
       {
                 
                 document.getElementById("icNumValidation").innerHTML='<div><img src="Images/error.gif"></div><div>Invalid IC Number Format.</div>'
       }
}
// Phone Number Validator
function isValidPhoneNum(v)
{
   
   var rePattern =/^[0-9]+$/;
   var re = new RegExp(rePattern);
   
   if (v.match(re))
   {
       return true;
   }
   else 
   {
       return false;
   }
}
function validatePhoneNum()
{
    var phone_num = document.getElementById("PhoneNumValid").value;
      if(isValidPhoneNum(phone_num))
        {
            document.getElementById("PhoneNumValidation").innerHTML='<div><img src="Images/correct.gif"></div>'
            onfocus();
        }
     else if(phone_num=="")
       {

                 document.getElementById("PhoneNumValidation").innerHTML='<div><img src="Images/error.gif"></div><div>Contact number cannot be <br>blanked.</div>'
       }
     else
       {

                 document.getElementById("PhoneNumValidation").innerHTML='<div><img src="Images/error.gif"></div><div>Invalid Phone Number Format.</div>'
       }
}
// Email Validator
function validateEmail()
{   

    var email = document.getElementById("emailValid").value;

    if(isValidEmail(email))
        {
            document.getElementById("emailValidation").innerHTML='<div ><img src="Images/correct.gif"></div>'
            onfocus();
        }
     else if(email=="")
       {

               document.getElementById("emailValidation").innerHTML='<div><img src="Images/error.gif"></div><div>Email address cannot be blanked.</div>'
       }
     
    else
       {

               document.getElementById("emailValidation").innerHTML='<div><img src="Images/error.gif"></div><div>Invalid Email Address Format.</div>'
       }

}

function isValidEmail(v)
{
        var rePattern = /^[A-Za-z0-9_\.\-]+@((([A-Za-z0-9_\-]+\.)+[A-Za-z]{2,})|((((1?[0-9]{1,2})|(2[0-4]?[0-9]?)|(25[0-5]?))\.){3}((1?[0-9]{1,2})|(2[0-4]?[0-9]?)|(25[0-5]?)){1}))$/;
        var re = new RegExp(rePattern);

        if(v.match(re))
           {    return true;}
        else
           {    return false;}
}
// Password Validation
 function validatePassword()
{   
    var psw = document.getElementById("pswValid").value;

   if(psw=="")
       {

             document.getElementById("pswValidation").innerHTML='<div><img src="Images/error.gif"></div><div>Password cannot be blanked.</div>'
       }
     else
       {

             document.getElementById("pswValidation").innerHTML='<div><img src="Images/correct.gif"></div>'
       }

}

// Confirm Password
function isValidConfirmPassword(v)
{
    var psw = document.getElementById("pswValid").value;
    if(v.match(psw))
        {
            return true;
        }
    else
        {
            return false;
        }
}
function passwordConfirmation()
{
     var psw = document.getElementById("pswValid").value;
     var pswConfirm = document.getElementById("pswConfirm").value;
    
     
         if(pswConfirm=="")
         {

                 document.getElementById("pswConfirmation").innerHTML='<div><img src="Images/error.gif"></div><div>Confirm password cannot<br> be blanked.</div>'
         }
        else {
           if(isValidConfirmPassword(pswConfirm))
            {
                document.getElementById("pswConfirmation").innerHTML='<div ><img src="Images/correct.gif"></div>'
                onfocus();
            }
            else
           {
                document.getElementById("pswConfirmation").innerHTML='<div><img src="Images/error.gif"></div><div>Confirm Password and Password<br> does not match.</div>'
           }
         }
    
}

// Validate all function 
function validation()
{ 
    var f = document.forms[0];
    var name = f.stud_name.value;
    var matric = f.matric_no.value;
    var ic_no = f.matric_no.value;
    var phone_num = f.phone_no.value;
    var email = f.email_add.value;
    var psw = f.psw.value;
    var pswConfirm = f.psw_confirm.value;
    
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

    
    if(matric=="")
        {
            alert("Metric number cannot be blanked.");
            matric.focus();
            return;
        }
    if(!(isValidMatric(matric)))
        {
            alert("Invalid metric number format.");
            matric.focus();
            return;
        }
    if(ic_no=="")
        {
            alert("IC number cannot be blanked.");
            ic_no.focus();
            return;
        }
    if(!(isValidIC(ic_no)))
        {
            alert("Invalid IC number format.");
            ic_no.focus();
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
             pswConfirm.focus()
             return;
         }
      f.method = "POST";
      f.target = "_self";
      f.action = "./ServRegister";
      f.submit();
}

function adRegister()
{    
    var f = document.forms[0];
    var name = f.stud_name.value;
    var matric = f.matric_no.value;
    var ic_no = f.matric_no.value;
    var phone_num = f.phone_no.value;
    var email = f.email_add.value;
    var psw = f.psw.value;
    var pswConfirm = f.psw_confirm.value;
    var roomNo = f.roomNo.value;
    
    if(name=="")
        {
            alert("Name cannot be blanked.");
            name.focus();
            return;
        }
       
    if(!(isValidName(name)))
        {   
            alert("Name contains invalid character(s).");
            name.focus();
            return;
        }

    
    
    if(matric=="")
        {
            alert("Staff number cannot be blanked.");
            matric.focus();
            return;
        }
    
   // The format of staff number are same with ic number.
    if(!(isValidIC(matric)))
        {
            alert("Staff number contains invalid character(s).");
            matric.focus();
            return;
        }
    if(roomNo=="")
        {
            alert("Room number cannot be blanked.");
            roomNo.focus();
            return;
        }
        
     if(!(isValidRoomNo(roomNo)))
        {
            alert("Room number contains invalid character(s).");
            roomNo.focus();
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
             pswConfirm.focus()
             return;
         }
      f.method = "POST";
      f.target = "_self";
      f.action = "./ServAdRegisterLec";
      f.submit();
}


function Reset()
{
    var f = document.forms[0];
    f.stud_name.value = "";
    f.matric_no.value = "";
    f.ic_no.value = "";
    f.phone_no.value = "";
    f.email_add.value = "";
    f.psw.value = "";
    f.psw_confirm.value = "";
    
    document.getElementById("nameValidation").innerHTML=''
    document.getElementById("matricValidation").innerHTML=''
    document.getElementById("icNumValidation").innerHTML=''
    document.getElementById("PhoneNumValidation").innerHTML=''
    document.getElementById("emailValidation").innerHTML=''
    document.getElementById("pswValidation").innerHTML=''
    document.getElementById("pswConfirmation").innerHTML=''
}

/* ************************
 This js used in
 Register
 StudentEditProfile
 LecEditProfile
 AdRegister
 ************************** */