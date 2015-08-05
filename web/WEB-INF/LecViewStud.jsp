<%-- 
    Document   : LecViewStud
    Created on : Feb 2, 2009, 6:45:51 PM
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


String metricNo = request.getParameter("metric");

String query = "Select* from student where metricNo='"+metricNo+"'";
String query2 = "Select * from supervisor where metricNo='"+metricNo+"'";
String queryProfile ="Select* from lecturer where staffNo='"+UserSession+"'";
String studName = "";
String userID = "";
String icNo = "";
String email = "";
String phoneNo = "";
String status ="";
 String lectNameProfile="";
    String userIDProfile="";
    String emailProfile="";
    String phoneNoProfile="";
    String roomNoProfile="";
int svRow = 0;

if ((!(UserSession==null))&&(UserType.equals("2"))) {
     DB objDB = new DB();
     objDB.connect();
     objDB.query(queryProfile);
     lectNameProfile = objDB.getDataAt(0,"lectName");
     userIDProfile = objDB.getDataAt(0,"staffNo");
     emailProfile = objDB.getDataAt(0,"emailAdd");
     phoneNoProfile = objDB.getDataAt(0,"phoneNo");
     roomNoProfile = objDB.getDataAt(0,"roomNo");
     objDB.query(query);
     studName = objDB.getDataAt(0,"studName");
     userID = objDB.getDataAt(0,"metricNo");
     icNo = objDB.getDataAt(0,"icNo");
     email = objDB.getDataAt(0,"emailAdd");
     phoneNo = objDB.getDataAt(0,"phoneNo");
     
     objDB.query(query2);
     svRow=objDB.getNumberOfRows();
     status = objDB.getDataAt(0,"status");
     objDB.close();
 %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" type="text/css" href="css/table.css">
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        
        <script src="js/jquery.min.js"></script>
        

         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
         <script src="js/profile-pass.js"></script>
         <script src="js/updateProfile.js"></script>
        <script type="text/javascript" src="js/LecStudAcceptance.js"></script>
        <title>Final Year Project Management System</title>
    </head>
     <body>
       
      
      <div id="Wrapper" style="padding-top:50px;">
         <%@ include file="headerlecture.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">
    
   
    <div style="height:auto" id="WrapperBody">
       <span style="position:absolute;top:180px;left:130px"  onclick="javascript:history.back()"><i style="font-size:2.5em;color:#f0ad4e" class="fa fa-arrow-circle-left"></i></span>
        <center>
            <form name="studentAcceptance">
                        <br>
                        
                            
                        <table class="table table-bordered alert-warning" style="width:60%" >
                            <tr>
                                <td bgcolor="whitesmoke" align="center"colspan="2"><b style="color:#000;font-family:sans-serif ;font-size:1.2em">Student Details</b></td>
                            </tr>
                            <tr>
                                <td width="200px" ><b>Name</b></td>
                                
                                <td><%=studName%></td>
                            </tr>

                            <tr>
                                <td><b>Metric Number</b></td>
                               
                                <td><%=userID%></td>
                            </tr>

                            <tr>
                                <td><b>IC Number</b></td>
                               
                                <td><%=icNo%></td>
                            </tr>

                            <tr>
                                <td><b>Phone Number</b></td>
                             
                                <td><%=phoneNo%></td>
                            </tr>

                            <tr>
                                <td><b>Email Address</b></td>
                               
                                <td><%=email%></td>
                            </tr>
                            
                            <tr>
                                <td><b>Status</b></td>
                               
                                <td><%=status%></td>
                            </tr>
                             <tr>
                                <td ><b>Action</td>
                              
                                <td ><select   class="form-control" onchange="studAccept('<%=userID%>')" name="status"  style="background-color:#FFFFFF;color:#000000">
                                                    <option value="" >Please Select</option>
                                                    <option value="Approved">Approve</option>
                                                    <option value="Rejected">Reject</option>
                                    </select>
                                </td>
                            </tr>
                            <input type="hidden" name="metric" value="">
                            
                        </table>
                    
                           
                   
                     
                        
                            
                    </form>
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