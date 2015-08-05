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

 if ((!(UserSession==null))&&(UserType.equals("2"))) {
     
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
            proType = objDB.getDataAt(0,"proType");
            
            softSpecification = Common.replaceSlashT(objDB.getDataAt(0, "softSpecification"));
            hardware = Common.replaceSlashT(objDB.getDataAt(0,"hardware"));
            technology = Common.replaceSlashT(objDB.getDataAt(0,"technology"));
            statusTitle=Common.replaceSlashT(objDB.getDataAt(0,"status"));
            proField = Common.replaceSlashT(objDB.getDataAt(0,"field"));
            studName = Common.replaceSlashT(objDB.getDataAt(0,"studName"));
            lecName = Common.replaceSlashT(objDB.getDataAt(0,"lectName"));
            if(objDB.getDataAt(0,"comment")==null){
                comment="";
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
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="css/table.css">
        <link rel="stylesheet" type="text/css" href="css/button.css"> 
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <script type="text/javascript" src="js/LecEvaluation.js"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="pragma" content="no-cache"/>
        <meta http-equiv="expires" content="-1"/>
        <title>Final Year Project Management System</title>
    </head>
    
  
    <body>
       
      
      <div id="Wrapper">
          <div id="Top">
            <div id="TopContent">
                
            </div>
        </div> 
         <div id="BodyContent">
                <span>
                   <h2>Project Proposal</h2>
                   <center>
                    <%if(!(titleRow==0)){%>
                    
                    <form name="frm_titleSuggestion">
                        <fieldset id="titleSuggestion">
                            <legend>Project Information </legend>
                        <table border="0">

                            <tr>
                                <td id="text" >Supervisor</td>
                                <td id="colon">:</td>
                                <td id="inputText"><%=lecName%></td>
                            </tr>
                            
                            <tr>
                                <td id="text" >Student Name</td>
                                <td id="colon">:</td>
                                <td id="inputText"><%=studName%></td>
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
                                <td id="text" >Background of problem</td>
                                <td id="colon">:</td>
                                <td id="inputText"><%=bgProblem%></td>
                            </tr>

                            <tr>
                                <td id="text" >Objective</td>
                                <td id="colon">:</td>
                                <td id="inputText"><%=objective%></td>
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
                        </fieldset>
                        <br>
                        <br>
                        <fieldset id="titleSuggestion">
                            <legend>Project Requirement</legend>
                        <table border="0">

                            <tr>
                                <td id="text" >Software Specification</td>
                                <td id="colon">:</td>
                                <td id="inputText"><%=softSpecification%></td>
                            </tr>

                            <tr>
                                <td id="text" >Hardware</td>
                                <td id="colon">:</td>
                                <td id="inputText"><%=hardware%></td>
                            </tr>

                            <tr>
                                <td id="text" >Technology / Algorithm / Technique</td>
                                <td id="colon">:</td>
                                <td id="inputText"><%=technology%></td>

                            </tr>
                        </table>
                        </fieldset>
                        <%if(evaluation.equals("evaluation")){%>
                        <br>
                        <br>
                        <fieldset id="titleSuggestion">
                            <legend>Evaluation</legend>
                        <table border="0">

                            
                            
                             <tr>
                                <td id="text" >Action</td>
                                <td id="colon">:</td>
                                <td ><select id="inputText" name="proStatus">
                                        <option value="">Please Select</option>
                                        <option value="Full Approval" <%if(statusTitle.equals("Full Approval")){%> selected <%}%> >Full Approval</option>
                                        <option value="Conditional Approval (Major)" <%if(statusTitle.equals("Conditional Approval (Major)")){%> selected <%}%>>Conditional Approval(Major)</option>
                                        <option value="Conditional Approval (Minor)" <%if(statusTitle.equals("Conditional Approval (Minor)")){%> selected <%}%>>Conditional Approval(Minor)</option>
                                        <option value="Fail" <%if(statusTitle.equals("Fail")){%> selected <%}%>>Fail</option>
                                            
                                    </select>
                                </td>
                            </tr>
                            
                            <tr>
                                <td id="text" >Notes <i>(Please state reasons for conditional or failed approval)</i></td>
                                <td id="colon">:</td>
                                <td id="inputText"><textarea cols="40" rows="5"name="comment"><%=comment%></textarea></td>
                            </tr>
                            
                            <tr>
                                <td colspan="3" align="center">
                                   <div class="button" onmouseover="this.className='buttonHover'" onmouseout="this.className='button'" onclick="evaluation()">Submit</div>
                                   <input type="hidden" name="evMetricNo" value="<%=metricNo%>">
                                </td>
                            </tr>
                        </table>
                        </fieldset>
                        <%}%>
                    </form>
                    <%}
                      else
                          {%>
                      <h2>There is not project title submited.</h2>
                      <%}%>
                      <table style="float:right;">
                                <tr>

                                    <td align="right">
                                        <img  onclick="javascript:history.back(); "src="Images/Back.jpg" alt="Back" title="Back"  border="0"></img>
                                    </td>

                                </tr>
                        </table>
                    </center>
                </span>
        </div>
                
        <div id="Right">
         <!--Main Menu-->
         <%@ include file="LecMainMenu.jsp"%>
         <br>
         <!--Annoucement-->
         <%@ include file="Annoucement.jsp"%>
         <br>
         </div>
         <!-- Footer-->
         <%@ include file="Footer.jsp"%>	
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