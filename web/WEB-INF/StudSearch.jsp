<%-- 
    Document   : StudSearch
    Created on : Feb 6, 2009, 11:21:05 PM
    Author     : rou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");
 if ((!(UserSession==null))&&(UserType.equals("1"))) {
String query="Select* from announcement order by annID desc";
String queryprofile ="Select* from student where metricNo='"+UserSession+"'";
String studName="";
String studuserID="";
String studicNo="";
String studemail="";
String studphoneNo="";
     ArrayList annTitle = new ArrayList();
     ArrayList annDesc = new ArrayList();
     
     String color = "#fff0f5";
     
     DB objDB = new DB();
     objDB.connect();
     objDB.query(queryprofile);
    studName = objDB.getDataAt(0,"studName");
     studuserID = objDB.getDataAt(0,"metricNo");
    studicNo = objDB.getDataAt(0,"icNo");
    studemail = objDB.getDataAt(0,"emailAdd");
    studphoneNo = objDB.getDataAt(0,"phoneNo");
     objDB.query(query);
     int row = objDB.getNumberOfRows();
    
     for(int i=0;i<objDB.getNumberOfRows();i++)
         {
            annTitle.add(objDB.getDataAt(i, "annTitle"));
            annDesc.add(objDB.getDataAt(i,"annDesc"));
         }
     
     objDB.close();
     
     
%>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
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
    
                 
                     </center>
<div id="BodyContentStudent">
    <span>
         <table width="640"style="font-family: Arial, Helvetica, sans-serif; font-size: 13px;">
                        <tr style="font-weight:bold" align="center">
                            <td bgcolor="#fa8072" width="700px">Announcement</td>
                        </tr>
                        <%
                        if(row > 0)
                         {   for(int i=0;i<annTitle.size();i++)
                             {
                                 if(color.equals("#ffe4e1"))
                                            {
                                                color = "#ffb6c1";
                                                
                                            }
                                         else
                                            {  
                                                color = "#ffe4e1";
                                                
                                            }
                        %>
                        <tr>
                           <td bgcolor="<%=color%>"><div style="font-weight:bold"><%=annTitle.get(i)%></div><br style="line-height:1px">
                            <%=annDesc.get(i)%>
                            
                           </td>
                           
                        </tr>
                        <%  }
                         }%>
                    </table>
   
  
        
        
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