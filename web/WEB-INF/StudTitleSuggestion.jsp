<%-- 
    Document   : StudTitleSuggestion
    Created on : Jan 18, 2009, 10:07:14 PM
    Author     : rou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="FYPManagementSys_Bean.Common" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");
String edit=request.getParameter("textarea");
ArrayList fieldID = new ArrayList ();
ArrayList fieldName = new ArrayList(); 
String selectField = "select * from projectfield";
String selectSV ="select * from supervisor where metricNo='"+UserSession+"'";
String query = "select c.lectName as SV_Name, d.studName as Name, b.status as SV_Status, a.title_flag, "+
               "a.proTitle, a.bgProblem, a.objective, a.scope, a.proType, a.Profield, "+
               "a.softSpecification, a.hardware, a.technology, a.semester, a.status as Pro_Status, a.comment "+
               "from supervisor b "+
               "left outer join title a on b.metricNo=a.metricNo "+
               "left outer join lecturer c on b.staffNo=c.staffNo "+
               "left outer join student d on d.metricNo=b.metricNo "+
               "where b.metricNo='"+UserSession+"' ";

String queryprofile ="Select* from student where metricNo='"+UserSession+"'";
if(edit==null){
    edit="1";
}              

String svStatus ="";
String svName="";
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
String semester="";
String proposalcomment="";
String studName="";
String studuserID="";
String studicNo="";
String studemail="";
String studphoneNo="";
String scriptDisabledtextarea="";

int svRow = 0;
int titleRow = 0;
int fieldRow = 0;
     
 if ((!(UserSession==null))&&(UserType.equals("1"))) {
     DB objDB = new DB();
     objDB.connect();
     objDB.query(queryprofile);
    studName = objDB.getDataAt(0,"studName");
     studuserID = objDB.getDataAt(0,"metricNo");
     studicNo = objDB.getDataAt(0,"icNo");
     studemail = objDB.getDataAt(0,"emailAdd");
     studphoneNo = objDB.getDataAt(0,"phoneNo");
     objDB.query(selectSV);
     svRow = objDB.getNumberOfRows();
     svStatus = objDB.getDataAt(0, "status");
     
     if(!(svRow==0) && (svStatus.equals("Approved"))){
         objDB.query(query);
         svName = objDB.getDataAt(0, "SV_Name");
         svStatus = objDB.getDataAt(0,"SV_Status");
         proTitle = objDB.getDataAt(0, "proTitle");
         bgProblem = objDB.getDataAt(0, "bgProblem");
         objective = objDB.getDataAt(0, "objective");
         scope = objDB.getDataAt(0, "scope");
         proType = objDB.getDataAt(0,"proType");
         proField = objDB.getDataAt(0,"proField");
         softSpecification = objDB.getDataAt(0, "softSpecification");
         hardware = objDB.getDataAt(0,"hardware");
         technology = objDB.getDataAt(0,"technology");
         statusTitle=objDB.getDataAt(0,"Pro_Status");
         semester=objDB.getDataAt(0,"semester");
         proposalcomment=objDB.getDataAt(0,"comment");
         if(objDB.getDataAt(0,"comment")==null){
                proposalcomment="~No comment available~";
         }
         else{
            proposalcomment = Common.replaceSlashT(objDB.getDataAt(0,"comment"));
         } 
     }
     
     objDB.query(selectField);
     fieldRow = objDB.getNumberOfRows();
     for(int i=0;i<fieldRow;i++)
         {
            fieldID.add(objDB.getDataAt(i,"ID"));
            fieldName.add(objDB.getDataAt(i,"proField"));
         }
     objDB.close();
     if(!(proTitle==null))
         {
            readOnly = "readOnly";
            titleRow =1;
            scriptDisabledtextarea="tinyMCE.get('bgproblem').getBody().setAttribute('contenteditable', false);"+
                                    "tinyMCE.get('objective').getBody().setAttribute('contenteditable', false);"+
                                    "tinyMCE.get('scope').getBody().setAttribute('contenteditable', false);"+
                                    "tinyMCE.get('software').getBody().setAttribute('contenteditable', false);"+
                                    "tinyMCE.get('hardware').getBody().setAttribute('contenteditable', false);"+
                                    "tinyMCE.get('technique').getBody().setAttribute('contenteditable', false);";
         }
     else
         {
           proTitle = "";
           bgProblem = "";
           objective = "";
           scope = "";
           proType = "";
           proField = "";
           softSpecification = "";
           hardware = "";
           technology = "";
           readOnly = "";
           statusTitle ="";
           semester="";
         }     
%>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/button.css">
        <script type="text/javascript" src="js/StudTitleSuggestion.js"></script>
        <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
         <script src="js/profile-pass.js"></script>
         <script src="js/updateProfile.js"></script>
         <script type="text/javascript" src="tinymce/tinymce/js/tinymce/tinymce.min.js"></script>
        <script>tinymce.init({selector:'textarea',readonly:0});</script>
     <script>
 $(function() {
    document.getElementById("btnedittextarea").click();
});
 </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Year Project Management System</title>
    </head>
  
    
    
   
    </style>
  
    <body>
      
       
      
      <div id="Wrapper" style="padding-top:50px">
         <%@ include file="headerstudent.jsp" %>

			 <img src="Images/headerbg3.png" alt="" class="home-img">

    <div style="height:auto" id="WrapperBody">
        
   
       <% if(!(svRow==0) && (svStatus.equals("Approved")))
                       {%>
                       
                       <h2 class="text-center text-capitalize" style="color:#fcf5ca; font-weight:bold;">Project Proposal</h2>
                    
                       <form name="frm_titleSuggestion">
                           <ul style="padding-left: 100px; background:#fcf5ca;" class="nav nav-tabs">
                               <li class="active"><a style="color: #470f2d" href="#projectinfo" data-toggle="tab">Project Information</a></li>
                        <li><a style="color: #470f2d" href="#projectreq" data-toggle="tab">Project Requirement</a></li>
                        <li><a style="color: #470f2d" href="#comment" data-toggle="tab">Comment By Proposal Evaluator</a></li>
                        <li style="width:380px"><table style="float:right">
                                 <%if (titleRow==0)
                                        {%>
                                
                                <tr>
                                    <td>
                                        <div class="btn btn-success" onclick="submitTitle()">Submit&nbsp;<i style="font-size: 1.3em"  class="fa fa-save"></i></div>
                                    </td>
                                </tr>
                                <%} else if(statusTitle.equals("Pending")){%>
                                <tr>
                                    <td>
                                    <div id="btnedittitle" class="show" >
                                        <input type="button" id="edit" class="btn btn-info" onclick="javascript:editTitle();style.display = 'inline'; this.style.display = 'none'" value="&emsp;&emsp;&emsp;Edit&emsp;&emsp;&emsp;"></input>
                                                
                                    </div></td>
                                </tr>
                                <tr>
                                    <td>
                                    <div id="savediv" class="hide">
                                                <input type="button"  class="btn btn-success" onclick="javascript:svChgTitle()" value="&emsp;Save Changes&emsp;"></input>
                                    
                                                </div></td>
                                </tr>
                                 <%} else if (statusTitle.equals("Fail") || statusTitle.equals("Conditional Approval (Major)")) {%>
                                   <tr>
                                    <td>     
                                        
                                                <div class="btn btn-success" onclick="applyAgain()">Apply Again&emsp;<i class="glyphicon glyphicon-refresh"></i></div>                                       
                                 
                                        </td>
                                </tr>
                                 <%}%>
                                </table></li>
                    </ul>
                    <div  class="tab-content">
                        <div class="tab-pane active" id="projectinfo">
                            <br>
                             <table border="0" >
                                    <%if (statusTitle.equals("Pending")){%>
                                    
                                    <p class="text-center"><h4 class="text-center"> You must click the <b>Edit</b> button at the top of project proposal tab before you can update you proposal!</h4></p>
                                    
                                    <% } %>
                                    
                                    <div id="supervisor-group" class="form-group">
                                        <div class="col-xs-10 col-xs-offset-1 input-group">
                                         <div  class="input-group-addon">&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;Supervisor&emsp;&emsp;&emsp;</div>
                                          <input id="supervisorname" type="text" class="form-control" name="svName" value="<%=svName%>" readonly>
                                         
                                      </div>
                                    </div>
                                    <div id="prostatus-group" class="form-group">
                                        <div class="col-xs-10 col-xs-offset-1 input-group">
                                            <div  class="input-group-addon">&emsp;Proposal Status&emsp;&emsp;&nbsp;&nbsp;&nbsp;</div>
                                          <input id="prostatus" type="text" class="form-control" value="<%=statusTitle%>" readonly>
                                         
                                      </div>
                                    </div>
                                    <div id="sem-group" class="form-group">
                                        <div class="col-xs-10 col-xs-offset-1 input-group">
                                         <div  class="input-group-addon">&emsp;&emsp;&emsp;Semester&emsp;&emsp;&emsp;&nbsp;&nbsp;</div>
                                          <input id="sem" type="text" class="form-control" value="<%=semester%>" readonly>
                                         
                                      </div>
                                    </div>
                                    <div id="title-group" class="form-group">
                                        <div class="col-xs-10 col-xs-offset-1 input-group">
                                         <div  class="input-group-addon">&emsp;&emsp;Project Title&emsp;&emsp;&emsp;&nbsp;&nbsp;</div>
                                          <input id="title" type="text" class="form-control" name="proTitle" <%=readOnly%> value="<%=proTitle%>">
                                         
                                      </div>
                                    </div>
                                    <div id="bgprob-group" class="form-group">
                                        <div class="col-xs-10 col-xs-offset-1 input-group">
                                         <div  class="input-group-addon">Background Of Problem</div>
                                         <textarea class="form-control" rows="5" id="bgproblem"  name="bgProblem" <%=readOnly%>><%=bgProblem%></textarea>
                                         
                                      </div>
                                    </div>
                                    <div id="objective-group" class="form-group">
                                        <div class="col-xs-10 col-xs-offset-1 input-group">
                                         <div  class="input-group-addon">&emsp;&emsp;&emsp;Objective&emsp;&emsp;&emsp;&nbsp;&nbsp;</div>
                                         <textarea class="form-control" rows="5" id="objective"  name="objective" <%=readOnly%>><%=objective%></textarea>
                                         
                                      </div>
                                    </div>
                                    <div id="scope-group" class="form-group">
                                        <div class="col-xs-10 col-xs-offset-1 input-group">
                                         <div  class="input-group-addon">&emsp;&emsp;&emsp;&emsp;Scope&emsp;&emsp;&emsp;&emsp;</div>
                                         <textarea class="form-control" rows="5" id="scope"  name="scope" <%=readOnly%>><%=scope%></textarea>
                                         
                                      </div>
                                    </div>
                                    
                                    <%if(titleRow==0)
                                        {%>
                                        <div style="padding-left: 14%">
                                           <strong>Project Type&emsp; :</strong>
                                           <div style="padding-left: 0%;display:inline-table">
                                        <input type="radio" name="projectType" value="softDev" checked="checked"/>Software development<br>
                                            <input type="radio" name="projectType" value="research"/>Research
                                         </div>
                                    
                                       </div>
                                        
                                       
                                    
                                    
                                        <div style="padding-left: 14%">
                                           <strong>Project Field&emsp; :</strong>
                                           <div style="padding-left: 0%;display:inline-table">
                                                <select id="proField" name="proField">
                                                <option value="">Please Select</option>
                                                <%for(int i=0;i<fieldRow;i++)
                                                    {%>
                                                <option value="<%=fieldID.get(i)%>"><%=fieldName.get(i)%></option>
                                                <%}%>
                                                </select>
                                        </div>
                                    
                                       </div>
                                    <%}
                                        else
                                        {%>
                                       <div style="color:#fcf5ca;padding-left: 14%">
                                           <strong>Project Type&emsp; :</strong>
                                           <div style="padding-left: 0%;display:inline-table">
                                        <input type="radio"  disabled name="projectType" value="softDev" checked <%if(proType.equals("softDev")){%> checked<%}%>/>Software development<br>
                                        <input type="radio"  disabled name="projectType" value="research" <%if(proType.equals("research")){%> checked<%}%> />Research
                                           </div>
                                    
                                       </div>
                                      
                                    
                                        <div style="color:#fcf5ca;padding-left: 14%">
                                           <strong>Project Field&emsp; :</strong>
                                           <div style="padding-left: 0%;display:inline-table">
                                        
                                                <select name="proField" disabled style="background-color:#FFFFFF;color:#000000">
                                                <option value=""> Please Select</option>
                                                <%for(int i=0;i<fieldRow;i++)
                                                    {%>
                                                    <option value="<%=fieldID.get(i)%>" <%if(proField.equals(fieldID.get(i))){%> selected<%}%>><%=fieldName.get(i)%></option>
                                                <%}%>
                                                </select>
                                       </div>
                                    
                                       </div>
                                     
                                     
                                     <%}%>
                                </table>
                        </div>
                        <div class="tab-pane" id="projectreq">
                            <br><br>
                            <div id="software-group" class="form-group">
                                        <div class="col-xs-10 col-xs-offset-1 input-group">
                                         <div  class="input-group-addon">&nbsp;Software Specification&emsp;</div>
                                         <textarea class="form-control" rows="5" id="software"  name="software" <%=readOnly%>> <%=softSpecification%></textarea>
                                         
                                      </div>
                                    </div>
                                    <div id="hardware-group" class="form-group">
                                        <div class="col-xs-10 col-xs-offset-1 input-group">
                                         <div  class="input-group-addon">&emsp;&emsp;&emsp;Hardware&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;</div>
                                         <textarea  class="form-control" rows="5" id="hardware"  name="hardware" <%=readOnly%>> <%=hardware%></textarea>
                                         
                                      </div>
                                    </div>
                                    <div id="technique-group" class="form-group">
                                        <div class="col-xs-10 col-xs-offset-1 input-group">
                                            <div  class="input-group-addon">&emsp;&emsp;&emsp;Technology/&emsp;&emsp;&emsp;<br><br>Algorithm/<br><br>Technique</div>
                                         <textarea class="form-control" rows="5" id="technique"  name="technique" <%=readOnly%>> <%=technology%></textarea>
                                         
                                      </div>
                                    </div>
                        </div>
                        <div class="tab-pane" id="comment">
                            
                                        <!--td id="text" >Notes/Comments</td>
                                        <td id="colon">:</td-->
                                        <p class="text-center"><%=proposalcomment%></p>
                                    

                                
                                    <br><br><br><br><br><br><br><br>
                        </div>
                    </div>
                                        <span id="btnedittextarea" class="hide" onclick="disabledtinymce()">sdf</span>
                            </form>
                            
                           
                    <%}
                      else
                          {%>
                          <h3>
                      <p class="text-center">Sorry, you cannot submit project proposal until you get the approval from the supervisor that you have selected .</p>
                          </h3>  <br><br><br><br><br><br>
                      <%}%>
                    </center>
                    
                    
                
<div id="BodyContentStudent">
    <span>
      
        
                </span>
    
    
</div>
                               
                
        <div id="Left">
            <!-- Login As -->
       
         <br>
         <!--Main Menu-->
         <%=edit%>
         <br>
         </div>
                <br><br><br><br><br>
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
