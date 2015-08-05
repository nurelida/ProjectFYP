<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%-- 
    Document   : StudViewSearchTitle
    Created on : Feb 22, 2009, 6:15:54 PM
    Author     : rou
--%>
<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="FYPManagementSys_Bean.Common" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");
String metricNo = request.getParameter("metric");
String status ="";
String lecName="";
String staffNo="";

String query = "select proTitle, bgProblem, objective, scope, proType, softSpecification, hardware, technology, a.status, b.studName,c.proField as field ,e.lectName "+
                "from title a "+
                "inner join student b on b.metricNo=a.metricNo "+
                "inner join projectfield c on a.proField=c.ID "+
                "inner join supervisor d on d.metricNo = a.metricNo "+
                "inner join lecturer e on d.staffNo=e.staffNo "+
                "where a.metricNo='"+metricNo+"'";
String queryprofile ="Select* from student where metricNo='"+UserSession+"'";
int titleRow=0;
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
String studNameSearch = "";
String studName="";
String studuserID="";
String studicNo="";
String studemail="";
String studphoneNo="";
 if ((!(UserSession==null))&&(UserType.equals("1"))) {
     DB objDB = new DB();
     objDB.connect();
     objDB.query(queryprofile);
    studName = objDB.getDataAt(0,"studName");
     studuserID = objDB.getDataAt(0,"metricNo");
    studicNo = objDB.getDataAt(0,"icNo");
    studemail = objDB.getDataAt(0,"emailAdd");
    studphoneNo = objDB.getDataAt(0,"phoneNo");
     objDB.query(query);
     titleRow = objDB.getNumberOfRows();
     if(!(titleRow==0))
         {
            proTitle = Common.replaceSlashT(objDB.getDataAt(0, "proTitle"));
            bgProblem = Common.replaceSlashT(objDB.getDataAt(0, "bgProblem"));
            objective = Common.replaceSlashT(objDB.getDataAt(0, "objective"));
            scope = Common.replaceSlashT(objDB.getDataAt(0, "scope"));
            proType = Common.replaceSlashT(objDB.getDataAt(0,"proType"));
            softSpecification = Common.replaceSlashT(objDB.getDataAt(0, "softSpecification"));
            hardware = Common.replaceSlashT(objDB.getDataAt(0,"hardware"));
            technology = Common.replaceSlashT(objDB.getDataAt(0,"technology"));
            statusTitle= Common.replaceSlashT(objDB.getDataAt(0,"status"));
            proField = Common.replaceSlashT(objDB.getDataAt(0,"field"));
            studNameSearch = Common.replaceSlashT(objDB.getDataAt(0,"studName"));
            lecName = Common.replaceSlashT(objDB.getDataAt(0,"lectName"));
           
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
%>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/table.css">
        <link rel="stylesheet" type="text/css" href="css/button.css"> 
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
         <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <script type="text/javascript" src="js/Search.js"></script>
        <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
         <script src="js/profile-pass.js"></script>
         <script src="js/updateProfile.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Year Project Management System</title>
    </head>
    
  
    <body>
     
      
      <div id="Wrapper">
         <%@ include file="headerstudent.jsp" %>

    <div class="container">
    <div style="height:auto" id="WrapperBody">
        <span style="position:absolute;top:180px;left:130px"  onclick="javascript:history.back()"><i style="font-size:2.5em;color:#f0ad4e" class="fa fa-arrow-circle-left"></i></span>
        <center><br>
    <%if(!(titleRow==0)){%>
    <span style="width:80%"><h3  class="text-capitalize text-center"><%=proTitle%></h3></span>
                    <br>
                    <form name="frm_titleSuggestion">
                        <div style="width:1000px;" class="panel panel-default">
  <div  class="panel-heading" style="background-color: whitesmoke">
      <h3  class="panel-title"><b>Project Information</b></h3>
  </div>
  <div  class="panel-body alert-warning">
                        <table  border="0" class="table table-hover">

                            <tr>
                                <td  width="100px" id="textSearch" >Supervisor</td>
                                <td width="50px" id="colon">:</td>
                                <td width="750px" ><%=lecName%></td>
                            </tr>
                            
                            <tr>
                                <td id="textSearch" >Student Name</td>
                                <td id="colon">:</td>
                                <td id="inputText"><%=studNameSearch%></td>
                            </tr>

                            <tr>
                                <td id="text" >Project Status</td>
                                <td id="colon">:</td>
                                <td id="inputText"><%=statusTitle%></td>
                            </tr>

                            <tr>
                                <td id="text" >Project Title</td>
                                <td id="colon">:</td>
                                <td id="inputText"><%=proTitle%></td>
                            </tr>
                            
                            <tr>
                                <td  id="text" >Background of problem</td>
                                <td   id="colon">:</td>
                                <td ><%=bgProblem%></td>
                            </tr>

                            <tr >
                                <td id="text" >Objective</td>
                                <td id="colon">:</td>
                                <td id="inputText" ><%=objective%></td>
                            </tr>

                            <tr>
                                <td id="text" >Scope</td>
                                <td id="colon">:</td>
                                <td id="inputText"><%=scope%></td>
                            </tr>

                            <tr>
                                <td id="text">Project Type</td>
                                <td id="colon">:</td>
                                <td id="inputText"><%=proType%></td>
                            </tr>

                            <tr>
                                <td id="text">Project Field</td>
                                <td id="colon">:</td>
                                <td id="inputText"><%=proField%></td>
                             </tr>

                        </table>
  </div>
                        </div>
                        
                        <div style="width:1000px" class="panel panel-default">
                        <div class="panel-heading" style="background-color: whitesmoke">
      <h3  class="panel-title"><b>Project Requirement</b></h3>
  </div>
                              <div class="panel-body alert-warning">
                        <table border="0" class="table table-hover">

                            <tr>
                                <td width="100px" id="textSearch">Software Specification</td>
                                <td width="50px" id="colon">:</td>
                                <td width="750px"><%=softSpecification%></td>
                            </tr>

                            <tr>
                                <td id="text" >Hardware</td>
                                <td id="colon">:</td>
                                <td id="inputText"><%=hardware%></td>
                            </tr>

                            <tr>
                                <td width="100px" id="textSearch">Technology/Algorithm/Technique</td>
                                <td id="colon">:</td>
                                <td width="750px"><%=technology%></td>

                            </tr>
                        </table>
  </div>
                        </div>
                        
                    </form>
                    <%}
                      else
                          {%>
                          <br><br>
                       <h3>
                      <p class="text-center">There is not project title submited.</p>
                      </h3>  <br><br><br><br><br><br><br>
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
         
         <br>
         </div>
                <br><br><br>
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


