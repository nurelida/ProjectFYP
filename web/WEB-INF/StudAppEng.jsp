<%-- 
    Document   : StudAppEng
    Created on : Feb 12, 2009, 2:53:36 PM
    Author     : rou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="FYPManagementSys_Bean.DB" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");

String query = "select a.proTitle, a.proID, b.studName, a.status, d.lectName "+
                "from title a "+
                "inner join student b on b.metricNo=a.metricNo "+
                "inner join supervisor c on c.metricNo=a.metricNo "+
                "inner join lecturer d on d.staffNo=c.staffNo "+
                "where a.metricNo='"+ UserSession +"'";

String query2 ="select e.status ,e.reason "+
                "from title a "+
                "inner join student b on b.metricNo=a.metricNo "+
                "inner join supervisor c on c.metricNo=a.metricNo "+
                "inner join lecturer d on d.staffNo=c.staffNo "+
                "inner join engapply e on e.metricNo=a.metricNo "+
                "where a.metricNo='"+UserSession+"'";
String queryprofile ="Select* from student where metricNo='"+UserSession+"'";

String proTitle = "";
String studNameApp = "";
String proStatus = "";
String lectName = "";
String proID="";
int row = 0;
int rowApp = 0;

String studName = "";
String studuserID="";
String studicNo="";
String studemail="";
String studphoneNo="";

String appStatus =" - ";
String reason = "";
String readOnly = "";

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
     row = objDB.getNumberOfRows();
     proTitle = objDB.getDataAt(0, "proTitle");
     studNameApp = objDB.getDataAt(0,"studName");
     proStatus = objDB.getDataAt(0,"status");
     lectName = objDB.getDataAt(0,"lectName");
     proID = objDB.getDataAt(0,"proID");
     
     objDB.query(query2);
     rowApp = objDB.getNumberOfRows();
     if(!(rowApp==0))
         {
            appStatus = objDB.getDataAt(0,"status");
            reason = objDB.getDataAt(0,"reason");
            readOnly = "readonly";
         }
     objDB.close();
  
%>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <script type="text/javascript" src="js/StudAppEng.js"></script>
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
        
   <center>
                
               <%if(!(row==0)&&!(proStatus.equals("Pending")))
                            {%>
                        <h3>Application to write BSc project report in English</h3>
                        
                            <div style="width:600px" class="panel panel-default">
  <div class="panel-heading" style="background-color: #5BC0DE">
      <h3 style="color:#fff" class="panel-title"><b>Application Information</b></h3>
  </div>
  <div class="panel-body alert-warning">
                                    <form name="applyEng">
                                    <table border="0" style="text-align:left">

                                        <tr>
                                            <td id="text2" >Supervisor</td>
                                            <td id="colon">:</td>
                                            <td id="text"><%=lectName%></td>
                                        </tr>
                                        
                                        <tr>
                                            <td id="text2" >Application Status</td>
                                            <td id="colon">:</td>
                                            <td id="text"><%=appStatus%></td>
                                        </tr>
                                        
                                        <tr>
                                            <td id="text2" >Project Status</td>
                                            <td id="colon">:</td>
                                            <td id="text"><%=proStatus%></td>
                                        </tr>

                                        <tr>
                                            <td id="text2" >Project Title</td>
                                            <td id="colon">:</td>
                                            <td id="text"><%=proTitle%></td>
                                        </tr>

                                        <tr>
                                            <td><b style="color: #000">Reason for application</b></td>
                                            <td id="colon">:</td>
                                            <td id="text"><textarea class="form-control" cols="40" rows="5" name="reason" <%=readOnly%> ><%=reason%></textarea></td>
                                        </tr>
                                        <input type="hidden" value="<%=proID%>" name="proID">
                                        <%if(rowApp==0) {%>
                                        <tr>
                                            <td colspan="3" align="center">
                                                <input type="button" class="btn btn-primary" onclick="javascript:applyEngForm()" value="&emsp;&emsp;&emsp;Submit&emsp;&emsp;&emsp;"></input>
                                            </td>
                                        </tr> 
                                        <%}
                                        else{%>
                                        <tr><td><br></td></tr>
                                        <tr>
                                            <td colspan="3" align="center">
                                                <div><input type="button" id="edit" class="btn btn-info" onclick="javascript:showChg();style.display = 'inline'; this.style.display = 'none'" value="&emsp;&emsp;&emsp;Edit&emsp;&emsp;&emsp;"></input></div>
                                                <div id="savediv" hidden>
                                                    <input type="button" class="btn btn-success" onclick="javascript:saveChanges()" value="&emsp;Save Changes&emsp;"></input>
                                    
                                                </div>
                                            </td>
                                        </tr> 
                                     
                                        
                                        <%}%>
                              </table>
                              </div>
</div>
                             
                         </form>
                         <%}
                         else{
                         %>
                         <h3>
                      <p class="text-center">You cannot submit this application form before submit your project title</p>
                         </h3>  <br><br><br><br><br><br><br><br><br><br>
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