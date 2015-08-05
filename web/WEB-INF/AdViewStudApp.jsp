<%-- 
    Document   : AdViewStudApp
    Created on : Feb 17, 2009, 5:33:49 PM
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
if(metricNo==null)
    {
        metricNo=request.getParameter("metricNo");
    }

String query = "select a.proTitle, a.proID, b.studName, d.lectName, e.status, e.reason, e.svSuppReason "+
                "from title a "+
                "inner join student b on b.metricNo=a.metricNo "+
                "inner join supervisor c on c.metricNo=a.metricNo "+
                "inner join lecturer d on d.staffNo=c.staffNo "+
                "inner join engapply e on e.proID = a.proID "+
                "where a.metricNo='"+ metricNo +"'";

String proTitle = "";
String studName = "";
String lectName = "";
String proID="";
String appStatus ="";
String reason = "";
String svReason = "";
int row = 0;





 if ((!(UserSession==null))&&(UserType.equals("3"))) {
     DB objDB = new DB();
     objDB.connect();
     objDB.query(query);
     row = objDB.getNumberOfRows();
     proTitle = objDB.getDataAt(0, "proTitle");
     studName = objDB.getDataAt(0,"studName");
     lectName = objDB.getDataAt(0,"lectName");
     proID = objDB.getDataAt(0,"proID");
     appStatus = objDB.getDataAt(0,"status");
     reason = Common.replaceSlashT(objDB.getDataAt(0,"reason"));
     svReason = Common.replaceSlashT(objDB.getDataAt(0,"svSuppReason"));
        if(svReason==null)
            {
                svReason="-";
            }
     
     objDB.close();
        
        
%>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css"> <link rel="stylesheet" type="text/css" href="style.css"> 
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
        <script type="text/javascript" src="js/AdViewStudApp.js"></script>
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
            <% if(!(row==0))
                            { %>
                        
                        <form name="applyEng">
                                    <h2>Application to write BSc project report in English</h2>
                                    <table class="table table-responsive" style="background-color:#fcf8e3;width:70%">
                                        <tr>
                                            <td bgcolor="#fff" align="center" colspan="2"><b style="color: #000;font-family:sans-serif ;font-size:1.5em">Application Information</b></td>
                            
                                        </tr>
                                        <tr>
                                            <td width="150px"><b>Supervisor</td>
                                            
                                            <td><%=lectName%></td>
                                        </tr>
                                        
                                        <tr>
                                            <td><b>Student</td>
                                            
                                            <td><%=studName%></td>
                                        </tr>
                                        
                                        
                                        
                                        

                                        <tr>
                                            <td><b>Project Title</td>
                                            
                                            <td><%=proTitle%></td>
                                        </tr>

                                        <tr>
                                            <td><b>Reason for apply</td>
                                            
                                            <td><%=reason%></td>
                                        </tr>
                                        
                                        <tr>
                                            <td><b>Supervisor's support reason</td>
                                            
                                            <td id="inputText"><%=svReason%></td>
                                            
                                        </tr>
                                        
                                        <tr>
                                            <td><b>Application Status</td>
                                            
                                            <td><%=appStatus%></td>
                                        </tr>
                                        
                                        <tr>
                                            <td><b>Action</td>
                                            
                                            <td id="inputText"><select onchange="studApprove()" name="status"  style="background-color:#FFFFFF;color:#000000">
                                                                <option value="" >Please Select</option>
                                                                <option value="Approved">Approve</option>
                                                                <option value="Rejected">Reject</option>
                                                </select>
                                            </td>
                                        </tr>
                                        
                                        <input type="hidden" value="<%=proID%>" name="proID">
                                        <input type="hidden" value="<%=metricNo%>" name="metricNo">
                                       
                                       <tr>
                            
                        </tr>
                              </table>
                            
                             
                         </form>
                         <% }else{
                           %>
                           <h2>There is no application form submited.</h2>
                           <% }%>
                           
                         
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
