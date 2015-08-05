  <div id="BGTop">
         
      
 <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="./ServMenu?Page=Home" color="white" >Home</a></li>
				<li><a href="#" >Contact Us</a></li>
                <li><a href="#" >About PSM</a></li>
				
				
				
                                 
			</ul>
                    <ul style="float:right;padding-top: 9px" class="nav navbar-nav">
                      <li class="dropdown">
					<button class="btn btn-default btn-signin" data-toggle="modal" onclick="openLoginModal();" >&emsp;Sign In&emsp;<i class="glyphicon glyphicon-user"></i></button>
                                        
				</li>
                    </ul>
		</div>
	</div>
</nav>
          <div class="container" style="padding-top: 50px;">
<!--
                  <div id="Top">
            <div id="TopContent">
 
            </div>
        </div>
-->

 <div  class="modal fade login" tabindex="-1" id="loginModal" >
		      <div id="modalheight" class="modal-dialog login animated">
                  <div class="modal-content"style="border-radius:5px; overflow:hidden;">
                      <div  class="modal-header" style="background:#FCF5CA ;">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                          <h4  class="modal-title" style="color:#740F2D;font-weight: bold;">Login Details</h4>
                    </div>
                    <div class="modal-body" style="background:#fff">  
                        <div class="box">
                             <div class="content">
                                
                                <div class="division">
                                    <div class="line l"></div>
                                      <span></span>
                                    <div class="line r"></div>
                                </div>
                                <div class="error"></div>
                                <div class="form loginBox">
                                    <form name="LoginForm">
        <div style="padding-right: 10px;padding-left: 5px;width:300px" class="input-group">
             <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
       <input  type="text" class="form-control" name="userID"  placeholder="Staff ID/Matric No.">  
        </div>
        <div style="padding-top: 5px;padding-left: 5px;padding-right: 10px;width:300px;padding-bottom: 5px" class="input-group">
             <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
       <input id="login-password" type="password" class="form-control" name="psw" placeholder="Password">  
    </div>   
        
        </form>
                                    <span style="float:right;padding-right: 25px"> <button id="btn-login" onclick="Login()" class="btn btn-success"><b>&nbsp;Login</b><span class="glyphicon glyphicon-log-in" style="color:white;width:30px"></span>  </button></span>
                                    <br><br>
                                </div>
                             </div>
                        </div>
                        <div class="box">
                            <div  class="content registerBox" style="padding-left: 0px;display:none;">
                             <div  class="form">
                                 

                                
                                </div>
                            </div>
                        </div>
                    </div>
                      <div class="modal-footer" style="background:#FCF5CA ; margin: 0;">
                        <div class="forgot login-footer">
                            <span>Not yet registered?
                                <a style="color:#0033ff" target="_blank" href="./ServMenu?Page=Register">Register Now</a>
                            </span

                        </div>
                        <div class="forgot register-footer" style="display:none">
                             <span>Already registered?</span>
                             <a href="javascript: showLoginForm();">Login Here</a>
                        </div>
                    </div>        
    		      </div>
		      </div>
		  </div>
 
              </div>
          </div>
