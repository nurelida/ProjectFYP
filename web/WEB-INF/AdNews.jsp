<%-- 
    Document   : AdNews
    Created on : Dec 16, 2014, 7:59:11 PM
    Author     : Asus
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
 if ((!(UserSession==null))&&(UserType.equals("3"))) {
  
     String query="Select * from news ";
     
     ArrayList newsTitle = new ArrayList();
     ArrayList newsContent = new ArrayList();
     ArrayList newsID = new ArrayList();
     String temp = "";
     
     String color = "#fff0f5";
     
     String aTitle = "";
     String aDesc = "";
     String aShow = "";
     
     DB objDB = new DB();
     objDB.connect();
    
    
    objDB.query(query);
     int row = objDB.getNumberOfRows();
    int count=0;
     for(int i=0;i<objDB.getNumberOfRows();i++)
         {
            newsTitle.add(objDB.getDataAt(i, "newsTitle"));
            newsContent.add(objDB.getDataAt(i,"newsContent"));
            newsID.add(objDB.getDataAt(i,"newsID"));
            count++;
           
         }
    
     objDB.close();
    
%>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/table.css">
        <link rel="stylesheet" type="text/css" href="css/button.css"> 
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css"> <link rel="stylesheet" type="text/css" href="style.css"> 
        <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
        <script type="text/javascript" src="js/AdNews.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Year Project Management System</title>
    </head>
    
  
    <body>
        <div id="Wrapper" style="padding-top:50px;">
         
         <%@ include file="headeradmin.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">

   
    <div style="height:auto" id="WrapperBody">
        

        <center>
            <h2 style="font-weight: bold; color:#fcf5ca;">News</h2>
          
        <table  style="width: 70%; background:white;" class="table table-bordered">
            <tr bgcolor="#fcf5ca">
                <td>Id</td>
                <td>Title</td>
                <td>Content</td>
                <td>Image</td>
            </tr>
            <tr>
        <%
            if(row > 0)
               {   for(int i=0;i<newsID.size();i++)
               {
               %>
               <td><%=(i+1)%></td>
               <td><%=newsTitle.get(i)%></td>
               <td><%=newsContent.get(i)%></td>
               <td align="center"><a  href="news/<%=newsTitle.get(i)%>.jpg"><img height="100" width="200" src="news/<%=newsTitle.get(i)%>.jpg"></a></td>
            </tr>
            <% }
               }%>
        </table>
         
     
        <br><br>
              <form>
        <table id="tableadd" class="table table-bordered hide"  style="width:40%">
            <tr bgcolor="#fcf5ca">
                <td colspan="2" align="center"><b>Add News</td>
            </tr>
            <tr>
                <td>Title Name</td>
                <td><input  class="form-control" type="text" name="addTitle" /></td>
            </tr>
             <tr>
                <td>Title Content</td>
                <td><input class="form-control" type="text" name="addContent" /></td>
            </tr>
              <tr>
                <td>Image File (900x500)</td>
                <td><input type="file" name="file" accept="image/jpeg" width="100"/></td>
            </tr>
        </table>
                  <table>
            <tr>
                <td id="btnaddnews" class="show"><span class="btn btn-success" onclick="btnAddNews()">&emsp;Add News&emsp;</span></td>
                <td id="checkaddnews" class="hide"><span class="btn btn-success" onclick="checkAddNews()">&emsp;Add News&emsp;</span></td>
            </tr>
 
        </table>
        </form>


                
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