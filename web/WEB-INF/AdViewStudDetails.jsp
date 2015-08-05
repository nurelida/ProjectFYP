<%-- 
    Document   : AdViewStudDetails
    Created on : Feb 4, 2009, 11:01:53 PM
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
String query =  "select b.studName, b.metricNo, b.emailAdd, b.phoneNo, c.lectName, b.icNo, a.status "+
                "from student b "+
                "left outer join supervisor a on b.metricNo=a.metricNo "+
                "left outer join lecturer c on c.staffNo=a.staffNo "+
                "where b.metricNo='"+metricNo+"'";

//String query2 = "Select staffNo from supervisor where metricNo='"+metricNo+"'";
String studName = "";
String userID = "";
String icNo = "";
String email = "";
String phoneNo = "";
String svName = ""; 
String status = "";
//int svRow = 0;

if ((!(UserSession==null))&&(UserType.equals("3"))) {
     DB objDB = new DB();
     objDB.connect();
     objDB.query(query);
     studName = objDB.getDataAt(0,"studName");
     userID = objDB.getDataAt(0,"metricNo");
     icNo = objDB.getDataAt(0,"icNo");
     email = objDB.getDataAt(0,"emailAdd");
     phoneNo = objDB.getDataAt(0,"phoneNo");
     svName = objDB.getDataAt(0, "lectName");
     status = objDB.getDataAt(0,"status");
     objDB.close();
     
     if(svName==null)
         {
            svName=" - ";
            status=" - ";
         }
    
     else{ 
             if(!status.equals("Approved"))
             {
                svName=svName+" ("+status+")";
             }
         }
     /*objDB.query(query2);
     svRow=objDB.getNumberOfRows();
     svName = objDB.getDataAt(0,"staffNo");
     String str2 = "select lectName from lecturer where staffNo='"+svName+"'";
     objDB.query(str2);*/
     
     
 %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" type="text/css" href="css/table.css">
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css"> <link rel="stylesheet" type="text/css" href="style.css"> 
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
        <script type="text/javascript" src="js/LecStudAcceptance.js"></script>
        <title>Final Year Project Management System</title>
    </head>
    <body>
    <div id="Wrapper" style="padding-top:50px;">
         
         <%@ include file="headeradmin.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">

   
    <div style="height:auto" id="WrapperBody">
       <span style="position:absolute;top:180px;left:130px"  onclick="javascript:history.back()"><i style="font-size:2.5em;color:#f0ad4e" class="fa fa-arrow-circle-left"></i></span>
        <center>
            <form name="viewStud">
                        <br>
                        
                            
                        <table class="table" style="width:60%;background-color: #fcf8e3">
                            <tr>
                                <td bgcolor="grey" align="center"colspan="2"><b style="color: #fff;font-family:sans-serif ;font-size:1.5em">Student Details</b></td>
                            </tr>
                            <tr>
                                <td ><b>Name</b></td>
                                
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
                                <td><b>Supervisor</b></td>
                               
                                <td><%=svName%></td>
                            </tr>
                            
                            
                        </table>
                    
                           
                    </form>
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
