<%-- 
    Document   : StudApp
    Created on : Feb 12, 2009, 2:44:55 PM
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
 if ((!(UserSession==null))&&(UserType.equals("1"))) {
  
%>
<html>

    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                    <table width="640"style="font-family: Arial, Helvetica, sans-serif; font-size: 13px;">
                        <tr style="font-weight:bold" align="center">
                            <td><a href="./ServMenu?Page=StudAppEng">Application to write BSc project report in English</a></td>
                        </tr>
                        
                       
                    </table>
                </span>
        </div>
                
        <div id="Right">
         <!-- Login As -->
         <%@ include file="User.jsp" %>
         <br>
         <!--Main Menu-->
         <%@ include file="StudentMainMenu.jsp" %>
         <br>
         <!--Annoucement-->
         <%@ include file="Annoucement.jsp" %>
         <br>
         </div>
         <!-- Footer-->
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