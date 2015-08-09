<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%
     
     ArrayList deptCode = new ArrayList();
     ArrayList deptName= new ArrayList();
     
         
     DB objDB = new DB();
     objDB.connect();
     
     
     String query="select * from department";
     objDB.query(query);
     int rowD=objDB.getNumberOfRows();
     for(int i=0;i<rowD;i++)
         {
            deptCode.add(objDB.getDataAt(i, "deptCode"));
            deptName.add(objDB.getDataAt(i,"deptName"));
            
           
         }
     
    
     objDB.close();
    
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
       
        

        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css">
        
        
        <script src="js/jquery.min.js"></script>
         <script type="text/javascript" src="js/toUpper.js"></script>
    <script type="text/javascript" src="js/Login.js"></script>
    <script type="text/javascript" src="js/register.js"></script>
        <script type="text/javascript" src="js/trim.js"></script>
        <script type="text/javascript" src="js/toUpper.js"></script>
        <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
        
        
       
       

         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
         <script src="js/login-register.js" type="text/javascript"></script>
         <script src="js/ValidatorReg.js" type="text/javascript"></script>
        
       
         <meta name="viewport" content="width=device-width, initial-scale=1">
         
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Year Project Management System</title>
        <script type="text/javascript" src="js/Login.js"></script>
    </head>
    
  
    <body onkeypress="CheckNumericKeyInfo(event.keyCode, event.which);">
       
      
      <div id="Wrapper">
          <%@ include file="headerguest.jsp" %>

    
    <div class="container">
        <img src="Images/headerbg3.png" alt="" class="home-img">
    <div style="height: auto" id="WrapperBodyRegister">
        <br><br>
       
        <form  action="javascript:validateForm()" method="POST" class="form-horizontal" >
     <fieldset>
         <legend class="text-uppercase" style="text-align: center;font-size: 2.5em; color:#740F2D; font-weight:bold;">&emsp;Sign Up</legend> 
  <div id="studname-group" class="form-group">
    <div class="col-xs-6 col-xs-offset-3 input-group">
        <div  class="input-group-addon">Name&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;</div>
      <input id="studname" type="text" class="form-control" placeholder="Enter Name" name="stud_name" onblur="javascript:validateInline(this.id, this.value)" >
      <span id="studnamestat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
      
    
      
        </div>
    <h5 hidden class="col-xs-6 col-xs-offset-4"  id="namestat" style="color:red;padding-bottom: 0px">This field is required</h5>
  </div>
 <div id="matric-group" class="form-group">
    <div class="col-xs-6 col-xs-offset-3 input-group">
        <div  class="input-group-addon">Matric No.&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;</div>
      <input id="matric" type="text" class="form-control" placeholder="Enter Matric No" name="matric_no" onblur="javascript:validateInline(this.id, this.value)" >
     
      <span id="matricstat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
      
    
      
        </div>
     <h5 hidden class="col-xs-6 col-xs-offset-4"  id="matricstat2" style="color:red;padding-bottom: 0px">This field is required</h5>
     <h5 hidden class="col-xs-6 col-xs-offset-4"  id="matricstat3" style="color:red;padding-bottom: 0px">Matric No. not valid</h5>
  </div>
 <div id="department-group" class="form-group">
    <div class="col-xs-6 col-xs-offset-3 input-group">
        <div  class="input-group-addon">Department&emsp;&emsp;&emsp;&nbsp;</div>
      <select id="department" type="text" class="form-control" placeholder="Select Department" name=department onblur="javascript:validateInline(this.id, this.value)" >
          <option value="">Please Select</option>
            <%
      for(int i=0;i<rowD;i++){
        %><option value="<%=deptCode.get(i)%>"><%=deptName.get(i)%></option><%
      }
      %>
       
      </select>
     
      <span id="departmentstat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
      
    
      
        </div>
     <h5 hidden class="col-xs-6 col-xs-offset-4"  id="departmentstat2" style="color:red;padding-bottom: 0px">This field is required</h5>
     
  </div>
 <div id="ic-group" class="form-group">
    <div class="col-xs-6 col-xs-offset-3 input-group">
        <div  class="input-group-addon">IC&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;</div>
      <input id="ic" type="number" class="form-control" placeholder="Enter IC No Without Dash" name="ic_no" onblur="javascript:validateInline(this.id, this.value)" >
      <span id="icstat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
    
      
        </div>
     <h5 hidden class="col-xs-6 col-xs-offset-4"  id="icstat2" style="color:red;padding-bottom: 0px">This field is required</h5>
     <h5 hidden class="col-xs-6 col-xs-offset-4"  id="icstat3" style="color:red;padding-bottom: 0px">IC No. not valid</h5>
  </div>
  <div id="contact-group" class="form-group">
    <div class="col-xs-6 col-xs-offset-3 input-group">
            <div  class="input-group-addon">Contact&emsp;&emsp;&emsp;&emsp;&emsp;</div>
      <input id="contact" type="number" class="form-control" placeholder="Enter Contact No Without Dash" name="phone_no" onblur="javascript:validateInline(this.id, this.value)" >
      <span id="contactstat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
    
      
        </div>
      <h5 hidden class="col-xs-6 col-xs-offset-4"  id="contactstat2" style="color:red;padding-bottom: 0px">This field is required</h5>
      <h5 hidden class="col-xs-6 col-xs-offset-4"  id="contactstat3" style="color:red;padding-bottom: 0px">Phone Number Invalid Format</h5>
  </div>
 <div id="email-group" class="form-group">
    <div class="col-xs-6 col-xs-offset-3 input-group">
        <div  class="input-group-addon">Email Address&emsp;&nbsp;&nbsp;&nbsp;</div>
      <input id="email" type="email" class="form-control" placeholder="Enter Email" name="email_add" onblur="javascript:validateInline(this.id, this.value)" >
      <span id="emailstat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
  
    
      
        </div>
     <h5 hidden class="col-xs-6 col-xs-offset-4"  id="emailstat2" style="color:red;padding-bottom: 0px">This field is required</h5>
     <h5 hidden class="col-xs-6 col-xs-offset-4"  id="emailstat3" style="color:red;padding-bottom: 0px">Invalid email address format</h5>
  </div>
 <div id="pass-group" class="form-group">
    <div class="col-xs-6 col-xs-offset-3 input-group">
        <div  class="input-group-addon">Password&emsp;&emsp;&emsp;&emsp;</div>
      <input id="pass" type="password" class="form-control" placeholder="Enter Password" name="psw" onblur="javascript:validateInline(this.id, this.value)" >
      <span id="passstat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
    
      
        </div>
     <h5 hidden class="col-xs-6 col-xs-offset-4"  id="passstat2" style="color:red;padding-bottom: 0px">This field is required</h5>
  </div>
  <div id="passcom-group" class="form-group">
    <div class="col-xs-6 col-xs-offset-3 input-group">
            <div  class="input-group-addon">Confirm Password</div>
      <input id="passcom" type="password" class="form-control" placeholder="Enter Comfirm Password" name="psw_comfirm" onblur="javascript:validateInline(this.id, this.value)" >
      <span id="passcomstat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
     
      
        </div>
      <h5 hidden class="col-xs-6 col-xs-offset-4"  id="passcomstat2" style="color:red;padding-bottom: 0px">This field is required</h5>
      <h5 hidden class="col-xs-6 col-xs-offset-4"  id="pswcom" style="color:red;padding-bottom: 0px">Password does not match</h5>
  </div>
            
             <table style="margin:auto"><tr>
                     <td> <button type="submit" class="btn btn-success" >Register&nbsp;<i class="glyphicon glyphicon-floppy-save"></i></button></td>
                     
                     
                 </tr>    </table>
                                
     </fieldset>
        </form><br><br><br>
<div id="BodyContent">
    <span>



         <!--Main Menu-->
        
         <br>
         <!--Login-->
         
        
        
         <br>
         </div>
</div>
</div>

         
         
         <%@ include file="Footer.jsp" %>
        
     	

    
      </div>
         
     
    </body>
    	
		
</html>
