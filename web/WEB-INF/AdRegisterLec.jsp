<%-- 
    Document   : AdRegisterLec
    Created on : Feb 3, 2009, 10:18:04 PM
    Author     : rou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");
ArrayList deptCode=new ArrayList();
ArrayList deptName=new ArrayList();

if ((!(UserSession==null))&&(UserType.equals("3"))) {
    
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
<html>
    <head>
        
        <link rel="stylesheet" type="text/css" href="css/registerFrm.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css"> <link rel="stylesheet" type="text/css" href="style.css"> 
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css"> 
        <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
        <script type="text/javascript" src="js/register.js"></script>
        <script type="text/javascript" src="js/ValidatorReg.js"></script>
        <script type="text/javascript" src="js/trim.js"></script>
        <script type="text/javascript" src="js/toUpper.js"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Year Project Management System</title>
    </head>
    <body>
          <div id="Wrapper" style="padding-top:50px;">
         
         <%@ include file="headeradmin.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">

    
    <div style="height:auto" id="WrapperBody">
        <span style="position:absolute;top:180px;left:130px"  onclick="javascript:history.back()"><i style="font-size:2.5em;color:#f0ad4e" class="fa fa-arrow-circle-left"></i></span>

        <center>
            <br><br>
                
                <table width="640px"border="0">
                   <form  action="javascript:validateFormLecture()" method="POST" class="form-horizontal" >
   <div style="width:70%" class="panel panel-default">
  <div class="panel-heading">
      <h2 style="color:#000" class="panel-title"><b>Register Lecturer</b></h2>
  </div>
  <div class="panel-body alert-warning">    
  <div id="studname-group" class="form-group">
    <div class="col-xs-8 col-xs-offset-1 input-group">
        <div  class="input-group-addon">Name&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;</div>
      <input id="studname" type="text" class="form-control" placeholder="Enter Name" name="stud_name" onblur="javascript:validateInline(this.id, this.value)" >
      <span id="studnamestat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
      
    
      
        </div>
    <h5 hidden class="col-xs-8 col-xs-offset-4"  id="namestat" style="color:red;padding-bottom: 0px">This field is required</h5>
  </div>
 <div id="matric-group" class="form-group">
    <div class="col-xs-8 col-xs-offset-1 input-group">
        <div  class="input-group-addon">Staff No.&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;</div>
      <input id="matriclect" type="text" class="form-control" placeholder="Enter Matric No" name="matric_no" onblur="javascript:validateInline(this.id, this.value)" >
     
      <span id="matricstat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
      
    
      
        </div>
     <h5 hidden class="col-xs-8 col-xs-offset-4"  id="matricstat2" style="color:red;padding-bottom: 0px">This field is required</h5>
     <h5 hidden class="col-xs-8 col-xs-offset-4"  id="matricstat3" style="color:red;padding-bottom: 0px">Matric No. not valid</h5>
  </div>

 <div id="room-group" class="form-group">
    <div class="col-xs-8 col-xs-offset-1 input-group">
        <div  class="input-group-addon">Room Number&emsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
      <input id="room" type="text" class="form-control" placeholder="Enter Room No" name="roomNo" onblur="javascript:validateInline(this.id, this.value)" >
      <span id="roomstat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
    
      
        </div>
     <h5 hidden class="col-xs-8 col-xs-offset-4"  id="roomstat2" style="color:red;padding-bottom: 0px">This field is required</h5>
     <h5 hidden class="col-xs-8 col-xs-offset-4"  id="roomstat3" style="color:red;padding-bottom: 0px">IC No. not valid</h5>
  </div>
   <div id="department-group" class="form-group">
    <div class="col-xs-8 col-xs-offset-1 input-group">
        <div  class="input-group-addon">Department&emsp;&emsp;&emsp;&nbsp;</div>
      <select id="department" type="text" class="form-control"  name="department" onblur="javascript:validateInline(this.id, this.value)" >
          <option value="">Please Select</option>
            <%
      for(int i=0;i<rowD;i++){
        %><option value="<%=deptCode.get(i)%>"><%=deptName.get(i)%></option><%
      }
      %>
       
      </select>
     
      <span id="departmentstat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
      
    
      
        </div>
     <h5 hidden class="col-xs-8 col-xs-offset-4"  id="departmentstat2" style="color:red;padding-bottom: 0px">This field is required</h5>
     
  </div>
  <div id="contact-group" class="form-group">
    <div class="col-xs-8 col-xs-offset-1 input-group">
            <div  class="input-group-addon">Contact&emsp;&emsp;&emsp;&emsp;&emsp;</div>
      <input id="contact" type="text" class="form-control" placeholder="Enter Contact No" name="phone_no" onblur="javascript:validateInline(this.id, this.value)" >
      <span id="contactstat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
    
      
        </div>
      <h5 hidden class="col-xs-8 col-xs-offset-4"  id="contactstat2" style="color:red;padding-bottom: 0px">This field is required</h5>
      <h5 hidden class="col-xs-8 col-xs-offset-4"  id="contactstat3" style="color:red;padding-bottom: 0px">Phone Number Invalid Format</h5>
  </div>
 <div id="email-group" class="form-group">
    <div class="col-xs-8 col-xs-offset-1 input-group">
        <div  class="input-group-addon">Email Address&emsp;&nbsp;&nbsp;&nbsp;</div>
      <input id="email" type="email" class="form-control" placeholder="Enter Email" name="email_add" onblur="javascript:validateInline(this.id, this.value)" >
      <span id="emailstat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
  
    
      
        </div>
     <h5 hidden class="col-xs-8 col-xs-offset-4"  id="emailstat2" style="color:red;padding-bottom: 0px">This field is required</h5>
     <h5 hidden class="col-xs-8 col-xs-offset-4"  id="emailstat3" style="color:red;padding-bottom: 0px">Invalid email address format</h5>
  </div>
 <div id="pass-group" class="form-group">
    <div class="col-xs-8 col-xs-offset-1 input-group">
        <div  class="input-group-addon">Password&emsp;&emsp;&emsp;&emsp;</div>
      <input id="pass" type="password" class="form-control" placeholder="Enter Password" name="psw" onblur="javascript:validateInline(this.id, this.value)" >
      <span id="passstat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
    
      
        </div>
     <h5 hidden class="col-xs-8 col-xs-offset-4"  id="passstat2" style="color:red;padding-bottom: 0px">This field is required</h5>
  </div>
  <div id="passcom-group" class="form-group">
    <div class="col-xs-8 col-xs-offset-1 input-group">
            <div  class="input-group-addon">Comfirm Password</div>
      <input id="passcom" type="password" class="form-control" placeholder="Enter Comfirm Password" name="psw_comfirm" onblur="javascript:validateInline(this.id, this.value)" >
      <span id="passcomstat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
     
      
        </div>
      <h5 hidden class="col-xs-8 col-xs-offset-4"  id="passcomstat2" style="color:red;padding-bottom: 0px">This field is required</h5>
      <h5 hidden class="col-xs-8 col-xs-offset-4"  id="pswcom" style="color:red;padding-bottom: 0px">Password does not match</h5>
  </div>
   <div id="status-group" class="form-group">
    <div class="col-xs-8 col-xs-offset-1 input-group">
        <div  class="input-group-addon">Status&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;</div>
      <select id="status" type="text" class="form-control" placeholder="Select Lecturer Status" name="lec_status" onblur="javascript:validateInline(this.id, this.value)" >
          <option value="">Please Select</option>
        <option value="Active">Active</option>
        <option value="Inactive">Inactive</option>
       
      </select>
     
      <span id="statusstat" class="glyphicon form-control-feedback" aria-hidden="true"></span>
      
    
      
        </div>
     <h5 hidden class="col-xs-8 col-xs-offset-4"  id="statusstat2" style="color:red;padding-bottom: 0px">This field is required</h5>
     
  </div>                     
  </div>
   </div>
             <table style="margin:auto"><tr>
                     <td> <button type="submit" class="btn btn-success" >Register&nbsp;<i class="glyphicon glyphicon-floppy-save"></i></button></td>
                     
                     
                 </tr>    </table>
 
         
</form>
                </table>
        

               
             
        <br><br>
        


                
        <div id="Left">
        
         <br>
         <!--Main Menu-->
    
         <br>
         </div>
</div>

         <br><br><br>
         <%@ include file="Footer.jsp" %>
        
</div>
     
    </body>
</html>
<% 
}
else 
    {
      String  address="/WEB-INF/Message.jsp?Message=Sorry. Your are not allowed to access this page without login.";
      RequestDispatcher dispatcher = request.getRequestDispatcher(address);
      dispatcher.forward(request, response);
    }

%>
