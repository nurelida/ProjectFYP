<!-- Login -->
    <script type="text/javascript" src="js/toUpper.js"></script>
    <script type="text/javascript" src="js/Login.js"></script>
    <div id="aTop">Login</div>
    <div id="aContent">
        <form name="LoginForm">
        <div style="padding-right: 10px;width:200px" class="input-group">
             <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
       <input  type="text" class="form-control" name="userID"  placeholder="Emp./Matric No">  
        </div>
        <div style="padding-top: 5px;padding-right: 10px;width:200px;padding-bottom: 5px" class="input-group">
             <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
       <input id="login-password" type="password" class="form-control" name="psw" placeholder="Password">  
    </div>
       
      
            <button id="btn-login" onclick="Login()" class="btn btn-success"><b>&nbsp;Login</b><span class="glyphicon glyphicon-log-in" style="color:white;width:30px"></span>  </button>
                           
        
        </form>
    </div>
