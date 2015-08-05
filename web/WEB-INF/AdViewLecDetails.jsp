<%-- 
    Document   : AdViewLecDetails
    Created on : Feb 4, 2009, 11:36:23 PM
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

String staffNo = request.getParameter("staffNo");
String query2 = "select lectName from lecturer where staffNo='"+staffNo+"'";


String query="select a.lectName, c.studName, b.status, b.metricNo "+
             "from lecturer a "+
             "left outer join supervisor b on b.staffNo=a.staffNo "+
             "left outer join student c on c.metricNo=b.metricNo "+
             "where a.staffNo='"+staffNo+"'";

ArrayList studName = new ArrayList();
ArrayList metricNo = new ArrayList();
ArrayList lectName = new ArrayList();
ArrayList status = new ArrayList();

int row = 0;
String color ="#fff0f5";
//String query="Select * from supervisor where staffNo='"+staffNo+"'";

 if ((!(UserSession==null))&&(UserType.equals("3"))) {
     DB objDB = new DB();
     objDB.connect();
     objDB.query(query);
     row = objDB.getNumberOfRows();
     for(int i=0;i<row;i++)
         {
         lectName.add(objDB.getDataAt(i, "lectName"));
         studName.add(objDB.getDataAt(i,"studName"));
         status.add(objDB.getDataAt(i,"status"));
         metricNo.add(objDB.getDataAt(i,"metricNo"));
         }
     
         
     /*objDB.query(query);
     row = objDB.getNumberOfRows();
     for(int i=0;i<row;i++)
         {
            metricNo.add(objDB.getDataAt(i,"metricNo"));
            String metric = objDB.getDataAt(i,"metricNo");
            
            String str = "select studName from student where metricNo='"+ metric +"'";
            objDB.query(str);
            studName.add(objDB.getDataAt(0,"studName"));
         }*/
     objDB.close();
     %>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/table.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
        
        <script type="text/javascript" src="js/AdView.js"></script>
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
            <span>
                 <h2>Student Under Supervision</h2>
                <span>
                    <table id="expertise" class="table table-hover table-bordered" style="width:80%">
                    <form>
                       
                        <tr style="border-color: #fff"><td  colspan="4"><b>Lecturer Name&nbsp;:&nbsp;<%=lectName.get(0)%></b></td></tr>
                                 
                         
                        
                        <tr style="font-weight:bold" align="center">
                             <td width="20px">No.</td>   
                             <td width="250px">Student</td>
                             <td width="250px">Metric No</td>
                             <td width="250px">Supervision status</td>
                        </tr>
                       
                         <% 
                            if(!(studName.get(0)==null))
                                {   for(int i=0;i<row;i++)
                                   {
             
                           %>
                       <tr>
                           <td align="center"><%=i+1%></td>
                           <td><%=studName.get(i)%></td>
                           <td><%=metricNo.get(i)%></td>
                           <td><%=status.get(i)%></td>
                          
                        </tr>
                            <%      }
                              }
                            else
                                {%>
                        <tr>
                            <td colspan="3">There is no student under supervision</td>
                        </tr>
                        <%      }%>
                          
                     
                </form>     
                </table>
                
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
