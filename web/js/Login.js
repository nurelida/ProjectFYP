function Login(){
      var f = document.LoginForm;
      if(f.userID.value == ""){
      alert("User ID cannot be blanked.");
      f.uid.focus();
      return;
      }

      if(f.psw.value == ""){
      alert("Password cannot be blanked.");
      f.psw.focus();
      return;
      }

      f.method = "POST";
      f.target = "_self";
      f.action = "./ServLogin";
      f.submit();

}

function CheckNumericKeyInfo($char, $mozChar) {
if($mozChar != null) {// Look for a Mozilla-compatible browser
  if($mozChar == 13) 
      Login();
}
else {// Must be an IE-compatible Browser
  if($char == 13) 
      Login();
}
}


    function checkKey()
    {
      var keycode;
      if (window.event) keycode = window.event.keyCode;
      else if (e) keycode = e.which;
      else return true;
      if (keycode == 13)
      {	
              Login();
      }
    }


/* ************************
 This js used in
 Home
 */
