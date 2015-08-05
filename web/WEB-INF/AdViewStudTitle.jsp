<%-- 
    Document   : AdViewStudTitle
    Created on : Feb 4, 2009, 10:51:47 PM
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
String status = "";
String lecName = "";
String staffNo = "";
String studName = "";

String selectStud = "select studName from student where metricNo='"+metricNo+"'";
String query = "select * from title where metricNo='"+metricNo+"'";
String str ="select staffNo from supervisor where metricNo='"+metricNo+"'";

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

 if ((!(UserSession==null))&&(UserType.equals("3"))) {
     
     DB objDB = new DB();
     objDB.connect();
             
     objDB.query(query);
     titleRow = objDB.getNumberOfRows();
     if(!(titleRow==0))
         {
            proTitle = Common.replaceSlashT(objDB.getDataAt(0, "proTitle"));
            bgProblem = Common.replaceSlashT(objDB.getDataAt(0, "bgProblem"));
            objective = Common.replaceSlashT(objDB.getDataAt(0, "objective"));
            scope = Common.replaceSlashT(objDB.getDataAt(0, "scope"));
            proType = Common.replaceSlashT(objDB.getDataAt(0,"proType"));
            proField = Common.replaceSlashT(objDB.getDataAt(0,"proField"));
            softSpecification = Common.replaceSlashT(objDB.getDataAt(0, "softSpecification"));
            hardware = Common.replaceSlashT(objDB.getDataAt(0,"hardware"));
            technology = Common.replaceSlashT(objDB.getDataAt(0,"technology"));
            statusTitle = Common.replaceSlashT(objDB.getDataAt(0,"status"));
            
            if(proField.equals("SED01"))
                {
                    proField="Software Engineering";
                }
            else if(proField.equals("SED02"))
                {
                    proField="Computational Intelligent";
                }
            else if(proField.equals("SED03"))
                {
                    proField="Expert System";
                }
            else if(proField.equals("SED04"))
                {
                    proField="Agent Based Project";
                }
            else if(proField.equals("SED05"))
                {
                    proField="Mobile Application";
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

     
     objDB.query(selectStud);
     studName = objDB.getDataAt(0,"studName");
     objDB.query(str);
     lecName = objDB.getDataAt(0, "staffNo");
     String str2 ="select lectName from lecturer where staffNo='"+lecName+"'";
     objDB.query(str2);
     lecName = objDB.getDataAt(0, "lectName");
     
     objDB.close();
     
 %>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/table.css">
        <link rel="stylesheet" type="text/css" href="css/button.css"> 
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css"> <link rel="stylesheet" type="text/css" href="style.css"> 
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
        
        
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
                                <td><b>Name</td>
                                
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
                        </fieldset>
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
                        </fieldset>

                    </form>
                    <%}
                      else
                          {%>
                      <h2>There is not project title submited.</h2>
                      <%}%>
                      
                     
                    </center>
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