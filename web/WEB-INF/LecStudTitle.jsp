<%-- 
    Document   : LecStudTitle
    Created on : Feb 1, 2009, 11:40:18 PM
    Author     : rou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="FYPManagementSys_Bean.Common" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");

String metricNo = request.getParameter("metric");
String evaluation = (String)request.getAttribute("evaluate");
String status ="";
String lecName="";
String staffNo="";

String query = "select proTitle, bgProblem, objective, scope, proType, softSpecification, hardware, technology, comment, a.status, b.studName,c.proField as field ,e.lectName "+
                "from title a "+
                "inner join student b on b.metricNo=a.metricNo "+
                "inner join projectfield c on a.proField=c.ID "+
                "inner join supervisor d on d.metricNo = a.metricNo "+
                "inner join lecturer e on d.staffNo=e.staffNo "+
                "where a.metricNo='"+metricNo+"' and a.title_flag='Y'";
String queryProfile ="Select* from lecturer where staffNo='"+UserSession+"'";
int titleRow=1;
String proTitle = "";
String bgProblem = "";
String objective = "";
String scope = "";
String proType = "";
String proField = "";
String softSpecification = "";
String hardware = "";
String technology = "";
String readOnly = "";
String statusTitle ="";
String studName = "";
String comment = "";
String lectNameProfile="";
String userIDProfile="";
String emailProfile="";
String phoneNoProfile="";
String roomNoProfile="";

 if ((!(UserSession==null))&& ((UserType.equals("2")) || (UserType.equals("3")))) {
     
     DB objDB = new DB();
     objDB.connect();
     objDB.query(queryProfile);
     lectNameProfile = objDB.getDataAt(0,"lectName");
     userIDProfile = objDB.getDataAt(0,"staffNo");
     emailProfile = objDB.getDataAt(0,"emailAdd");
     phoneNoProfile = objDB.getDataAt(0,"phoneNo");
     roomNoProfile = objDB.getDataAt(0,"roomNo");
     objDB.query(query);
     titleRow = objDB.getNumberOfRows();
     if(!(titleRow==0))
         {
            proTitle = Common.replaceSlashT(objDB.getDataAt(0, "proTitle"));
            bgProblem = Common.replaceSlashT(objDB.getDataAt(0, "bgProblem"));
            objective = Common.replaceSlashT(objDB.getDataAt(0, "objective"));
            scope = Common.replaceSlashT(objDB.getDataAt(0, "scope"));
            proType = objDB.getDataAt(0,"proType");
            
            softSpecification = Common.replaceSlashT(objDB.getDataAt(0, "softSpecification"));
            hardware = Common.replaceSlashT(objDB.getDataAt(0,"hardware"));
            technology = Common.replaceSlashT(objDB.getDataAt(0,"technology"));
            statusTitle=Common.replaceSlashT(objDB.getDataAt(0,"status"));
            proField = Common.replaceSlashT(objDB.getDataAt(0,"field"));
            studName = Common.replaceSlashT(objDB.getDataAt(0,"studName"));
            lecName = Common.replaceSlashT(objDB.getDataAt(0,"lectName"));
            if(objDB.getDataAt(0,"comment")==null){
                comment="~No comment available~";
            }
            else{
            comment = Common.replaceSlashT(objDB.getDataAt(0,"comment"));
            }
            if(proType.equals("softDev"))
                {
                    proType="Software Development";
                }
            else if(proType.equals("research"))
                {
                    proType="Research";
                }
            
        }
  objDB.close();
  if(evaluation==null)
    {
      evaluation="";
    }
 %>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/table.css">
        <link rel="stylesheet" type="text/css" href="css/button.css"> 
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <script type="text/javascript" src="js/LecEvaluation.js"></script>
        <script src="js/jquery.min.js"></script>
        

         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
         <script src="js/profile-pass.js"></script>
         <script src="js/updateProfile.js"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="pragma" content="no-cache"/>
        <meta http-equiv="expires" content="-1"/>
        <title>Final Year Project Management System</title>
    </head>
    
  
    <body>
      
      
      <div id="Wrapper">
        <% if (UserType.equals("2")) {%>
         <%@ include file="headerlecture2.jsp" %>
         <%} else if (UserType.equals("3")){%> 
         <%@ include file="headeradmin.jsp" %>
         <% } %> 
        
         
    
    <div class="container">
    <div style="height:auto" id="WrapperBody">
       
     <span style="position:absolute;top:180px;left:130px"  onclick="javascript:history.back()"><i style="font-size:2.5em;color:#f0ad4e" class="fa fa-arrow-circle-left"></i></span> 
     <br>        
                   <center>
                    <%if(!(titleRow==0)){%>
                    
                    <form name="frm_titleSuggestion">
                        <table class="table table-hover table-bordered" style="width:75%;background-color: #fcf8e3">
                             <tr>
                                 <td bgcolor="#fff" align="center" colspan="2"><b style="color: #000;font-family:sans-serif ;font-size:1.5em">Project Proposal</b></td>
                            </tr>
                            <tr>
                                <td width="200px" ><b>Supervisor</td>
                                
                                <td><%=lecName%></td>
                            </tr>
                            
                            <tr>
                                <td><b>Student Name</td>
                                
                                <td><%=studName%></td>
                            </tr>

                            <tr>
                                <td><b>Project Status</td>
                                
                                <td><%=statusTitle%></td>
                            </tr>

                            <tr>
                                <td><b>Project Title</td>
                                
                                <td><%=proTitle%></td>
                            </tr>

                            <tr>
                                <td><b>Background of problem</td>
                                
                                <td><%=bgProblem%></td>
                            </tr>

                            <tr>
                                <td><b>Objective</td>
                                
                                <td><%=objective%></td>
                            </tr>

                            <tr>
                                <td><b>Scope</td>
                                
                                <td><%=scope%></td>
                            </tr>

                            <tr>
                                <td><b>Project Type</td>
                                
                                <td><%=proType%></td>
                            </tr>

                            <tr>
                                <td><b>Project Field</td>
                                
                                <td><%=proField%></td>
                             </tr>

                        </table>
                      
                        <br>
                        <br>
                       <table class="table table-hover table-bordered" style="width:75%;background-color: #fcf8e3">
                             <tr>
                                 <td bgcolor="#fff" align="center" colspan="2"><b style="color: #000;font-family:sans-serif ;font-size:1.5em">Project Requirement</b></td>
                            </tr>

                            <tr>
                                <td width="200px"><b>Software Specification</td>
                                
                                <td><%=softSpecification%></td>
                            </tr>

                            <tr>
                                <td><b>Hardware</td>
                                
                                <td><%=hardware%></td>
                            </tr>

                            <tr>
                                <td><b>Technology / Algorithm / Technique</td>
                                
                                <td><%=technology%></td>

                            </tr>
                        </table>
                        
                        
                        <%if(!evaluation.equals("evaluation")){%>
                        <table class="table table-hover table-bordered" style="width:75%;background-color: #fcf8e3">
                             <tr>
                                 <td bgcolor="#fff" align="center" colspan="2"><b style="color: #000;font-family:sans-serif ;font-size:1.5em">Comments On Proposal</b></td>
                            </tr>
                            <tr>
                                <!--td>Notes / Comments</td>
                                <td>:</td-->
                                <td><%=comment%></td>

                            </tr>
                        </table>
                        
                        
                        <%} else {%> 
                        <br>
                        <br>
                        <table class="table table-hover table-bordered" style="width:75%;background-color: #fcf8e3">
                             <tr>
                                 <td bgcolor="#fff" align="center" colspan="2"><b style="color: #000;font-family:sans-serif ;font-size:1.5em">Evaluation</b></td>
                            </tr>
                             <tr>
                                 <td width="200px"><b>Action</td>
                                
                                <td ><select class="form-control" name="proStatus">
                                        <option value="">Please Select</option>
                                        <option value="Full Approval" <%if(statusTitle.equals("Full Approval")){%> selected <%}%> >Full Approval</option>
                                        <option value="Conditional Approval (Major)" <%if(statusTitle.equals("Conditional Approval (Major)")){%> selected <%}%>>Conditional Approval(Major)</option>
                                        <option value="Conditional Approval (Minor)" <%if(statusTitle.equals("Conditional Approval (Minor)")){%> selected <%}%>>Conditional Approval(Minor)</option>
                                        <option value="Fail" <%if(statusTitle.equals("Fail")){%> selected <%}%>>Fail</option>
                                            
                                    </select>
                                </td>
                            </tr>
                            
                            <tr>
                                <td><b>Notes <i>(Please state reasons for conditional or failed approval)</i></td>
                                
                                <td><textarea class="form-control" cols="40" rows="5"name="comment"><%=comment%></textarea></td>
                            </tr>
                            
                            <tr>
                                <td colspan="3" align="center">
                                   <span class="btn btn-primary" onclick="evaluation()">Submit</span>
                                   <input type="hidden" name="evMetricNo" value="<%=metricNo%>">
                                </td>
                            </tr>
                        </table>
                        
                        <%}%>
                    </form>
                    <%}
                      else
                          {%>
                      <h2>There is not project title submited.</h2>
                      <%}%>
                     
                    
                    </center>
        
  
        <br><br>
<div id="BodyContentStudent">
    <span>
    
                   
                </span>
    
    
</div>

                
        <div id="Left">
        
         <br>
         <!--Main Menu-->
    
         <br>
         </div>
</div>
</div>
                      
                      <% if (UserType.equals("2")) {%>
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
      
         <%}%> 

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