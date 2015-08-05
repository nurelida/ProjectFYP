  <div id="BGTop">
        <div id="Top">
            <div id="TopContent">
 
            </div>
        </div>
        
          
      
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
				<li><a  href="./ServMenu?Page=LecHome">Home&nbsp;<i class="glyphicon glyphicon-home"></i></a></li>
                                <li><a href="#myprofile" data-toggle="modal">My Profile&nbsp;<i class="glyphicon glyphicon-user"></i></a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">Work Field&nbsp;<i class="glyphicon glyphicon-briefcase"></i><b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="./ServMenu?Page=LecExpertise">Expertise Field</a></li>
						<li><a href="./ServMenu?Page=LecStudAcceptance">Supervision</a></li>
						<li><a href="./ServMenu?Page=LecEvaluation">Evaluation</a></li>
                                                <li><a href="./ServMenu?Page=LecTimeTable">Evaluation Schedule</a></li>
                                         
						
					</ul>
				</li>
                      	
                                 
			</ul>
                    <ul style="float:right;padding-top: 9px" class="nav navbar-nav">
                        <li style="padding-top: 7px; color: white;">Welcome Staff, <%=Name%>&nbsp;</li>  
                      <li class="dropdown">
					<button class="btn btn-default btn-signout" onclick="location.href='./ServMenu?Page=Home'">Logout&emsp;<i class="glyphicon glyphicon-log-out"></i></button>
				</li>
                    </ul>
		</div>
	</div>
</nav>
 
          
          </div>
                      
 

         <div  class="modal fade login" id="myprofile">
		      <div id="modalheight" style="width:500px" class="modal-dialog login animated" >
    		      <div class="modal-content" style="border-radius: 5px; overflow:hidden;">
                      <div  class="modal-header" style="background: #FCF5CA;">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                          <h4  class="modal-title" style="color:#740F2D; font-weight:bold; text-align:center ">My Profile</h4>
                    </div>
                    <div class="modal-body">  
                        <div class="box">
                             <div class="content">
                                
                                <div class="division">
                                    <div class="line l"></div>
                                      <span></span>
                                    <div class="line r"></div>
                                </div>
                                <div class="error"></div>
                                <div class="form loginBox">
                                     <form  action="validateUpdateProfileLecture()"  class="form-horizontal" >
       
  <div id="studname-group" class="form-group">
    <div class="col-xs-10 col-xs-offset-1 input-group">
        <div  class="input-group-addon"> Name&emsp;&nbsp;&nbsp;&nbsp;</div>
      <input id="studname" type="text" class="form-control" name="stud_name" onblur="javascript:validateInline(this.id, this.value)" value="<%=lectNameProfile%>" >
      <span id="studnamestat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
      
    
      
        </div>
    <h5 hidden class="col-xs-10 col-xs-offset-4"  id="namestat" style="color:red;padding-bottom: 0px">This field is required</h5>
  </div>
 <div id="matric-group" class="form-group">
    <div class="col-xs-10 col-xs-offset-1 input-group">
        <div  class="input-group-addon">Staff  No.&nbsp;&nbsp;</div>
      <input id="matric" type="text" class="form-control"  name="matric_no" value="<%=userIDProfile%>" readonly >
      <span id="matricstat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
      
    
      
        </div>
    
  </div>
 <div id="room-group" class="form-group">
    <div class="col-xs-10 col-xs-offset-1 input-group">
        <div  class="input-group-addon">Room No.</div>
      <input id="room" type="text" class="form-control"  name="roomNo" value="<%=roomNoProfile%>" onblur="javascript:validateInline(this.id, this.value)" >
      <span id="roomstat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
    
      
        </div>
    
  </div>
  <div id="contact-group" class="form-group">
    <div class="col-xs-10 col-xs-offset-1 input-group">
            <div  class="input-group-addon">Contact&emsp;</div>
      <input id="contact" type="text" class="form-control"  name="phone_no" onblur="javascript:validateInline(this.id, this.value)" value="<%=phoneNoProfile%>"  >
      <span id="contactstat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
    
      
        </div>
      <h5 hidden class="col-xs-10 col-xs-offset-4"  id="contactstat2" style="color:red;padding-bottom: 0px">This field is required</h5>
      <h5 hidden class="col-xs-10 col-xs-offset-4"  id="contactstat3" style="color:red;padding-bottom: 0px">Phone Number Invalid Format</h5>
  </div>
 <div id="email-group" class="form-group">
    <div class="col-xs-10 col-xs-offset-1 input-group">
        <div  class="input-group-addon">Email&emsp;&emsp;</div>
      <input id="email" type="email" class="form-control"  name="email_add" onblur="javascript:validateInline(this.id, this.value)" value="<%=emailProfile%>" >
      <span id="emailstat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
  
    
      
        </div>
     <h5 hidden class="col-xs-10 col-xs-offset-4"  id="emailstat2" style="color:red;padding-bottom: 0px">This field is required</h5>
     <h5 hidden class="col-xs-10 col-xs-offset-4"  id="emailstat3" style="color:red;padding-bottom: 0px">Invalid email address format</h5>
  </div>
 
 
            
             <table style="margin:auto"><tr>
                     <td> <button type="submit" class="btn btn-success" >Save Changes&nbsp;<i class="glyphicon glyphicon-floppy-save"></i></button></td>
                     
                     
                 </tr>    </table>
                                
         
</form>
                                   
                               
                                </div>
                             </div>
                        </div>
                        <div class="box">
                            <div  class="content registerBox" style="padding-left: 0px;display:none;">
                             <div  class="form">
                                  <form  action="javascript:changePswForm()" method="POST" class="form-horizontal" >
 <div id="oldpass-group" class="form-group">
    <div class="col-xs-10 col-xs-offset-1 input-group">
        <div  class="input-group-addon">Old Password&emsp;&emsp;&emsp;&emsp;&nbsp;</div>
      <input id="oldpass" type="password" class="form-control" placeholder="Enter Old Password" name="oldpsw" onblur="javascript:validateInline(this.id, this.value)" >
      <span id="oldpassstat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
    
      
        </div>
     <h5 hidden class="col-xs-10 col-xs-offset-4"  id="oldpassstat2" style="color:red;padding-bottom: 0px">This field is required</h5>
  </div>      
 <div id="pass-group" class="form-group">
    <div class="col-xs-10 col-xs-offset-1 input-group">
        <div  class="input-group-addon">New Password&emsp;&emsp;&emsp;&emsp;</div>
      <input id="pass" type="password" class="form-control" placeholder="Enter New Password" name="psw" onblur="javascript:validateInline(this.id, this.value)" >
      <span id="passstat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
    
      
        </div>
     <h5 hidden class="col-xs-10 col-xs-offset-4"  id="passstat2" style="color:red;padding-bottom: 0px">This field is required</h5>
  </div>
  <div id="passcom-group" class="form-group">
    <div class="col-xs-10 col-xs-offset-1 input-group">
            <div  class="input-group-addon">Comfirm New Password</div>
      <input id="passcom" type="password" class="form-control" placeholder="Enter Comfirm Password" name="psw_comfirm" onblur="javascript:validateInline(this.id, this.value)" >
      <span id="passcomstat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
     
      
        </div>
      <h5 hidden class="col-xs-10 col-xs-offset-4"  id="passcomstat2" style="color:red;padding-bottom: 0px">This field is required</h5>
      <h5 hidden class="col-xs-10 col-xs-offset-4"  id="pswcom" style="color:red;padding-bottom: 0px">New password and comfirm password does not match</h5>
  </div>
            
             <table style="margin:auto"><tr>
                     <td> <button type="submit" class="btn btn-success" >Change Password&nbsp;<i class="glyphicon glyphicon-floppy-save"></i></button></td>
                     
                     
                 </tr>    </table>
                                
         
</form>
                                 

                                
                                </div>
                            </div>
                        </div>
                    </div>
                      <div class="modal-footer" style="background:#FCF5CA;">
                        <div class="forgot login-footer">
                            <span>
                                 <button style="margin: auto;width:40%" class="btn btn-block btn-info" onclick="showPasswordForm()">Change password&nbsp;<i class="fa fa-unlock"></i></button>
                            </span>
                        </div>
                        <div class="forgot register-footer" style="display:none">
                             <span>
                             <button style="margin: auto;width:40%" class="btn btn-block btn-info" onclick="showProfileForm()">Edit Profile&nbsp;<i class="fa fa-edit"></i></button></span>
                        </div>
                    </div>        
    		      </div>
		      </div>
		  </div>
      