<%-- 
    Document   : LecEvTitle
    Created on : Mar 11, 2009, 2:03:58 PM
    Author     : rou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="FYPManagementSys_Bean.Semester" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");
String lectNameProfile="";
    String userIDProfile="";
    String emailProfile="";
    String phoneNoProfile="";
    String roomNoProfile="";

 if ((!(UserSession==null))&&((UserType.equals("2") || (UserType.equals("3"))))) {
  
     String query= new String();

     if (UserType.equals("2"))         
          query =    "SELECT proTitle, b.studName, a.metricNo, a.status, proID "+
                    "from title a "+
                    "inner join student b on b.metricNo=a.metricNo "+
                    "inner join lecturer c on c.staffNo=a.evaluator "+
                    "inner join psm_1 d on a.metricNo=d.metricNo "+
                    "where a.evaluator='"+UserSession+"' and d.semester='"+Semester.getSemester()+"'";
     else if (UserType.equals("3"))         
          query =    "SELECT proTitle, b.studName, a.metricNo, a.status, proID "+
                    "from title a "+
                    "inner join student b on b.metricNo=a.metricNo "+
                    "inner join lecturer c on c.staffNo=a.evaluator "+
                    "inner join psm_1 d on a.metricNo=d.metricNo "+
                    "where d.semester='"+Semester.getSemester()+"'";
     
     int row = 0;
     
     String colProPro="";
     String proURL="Images/project1.jpg";
     String detailURL="Images/User1.jpg";
     String appURL="Images/Clipboard2.jpg";
     
     ArrayList proTitle = new ArrayList();
     ArrayList studName = new ArrayList();
     ArrayList proStatus = new ArrayList();
     ArrayList proID = new ArrayList();
     ArrayList metricNo = new ArrayList();
     
     DB objDB = new DB();
     objDB.connect();
     objDB.query(query);
     row = objDB.getNumberOfRows();
     for(int i=0;i<row;i++)
         {
            proTitle.add(objDB.getDataAt(i,"proTitle"));
            studName.add(objDB.getDataAt(i,"studName"));
            proStatus.add(objDB.getDataAt(i,"status"));
            proID.add(objDB.getDataAt(i,"proID"));
            metricNo.add(objDB.getDataAt(i, "metricNo"));
         }
     
     
     String proClass="proShow";
     String appClass="appShow";
     String color ="#fff0f5";
     
     
     %>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/table.css">
        <link rel="stylesheet" type="text/css" href="css/button.css"> 
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
         <script>
            $(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
        </script>
        <script type="text/javascript" src="js/LecStudAcceptance.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Year Project Management System</title>
    </head>
    <style type="text/css">
        
        .proShow,
        .appShow{
                display: ;
        }
       .proHide,
       .appHide{
                display:none;
        }
        </style>
  
    <body>
           
        <div id="Wrapper" style="padding-top:50px">
            <% if (UserType.equals("2")) {%>
         <%@ include file="headerlecture.jsp" %>
         <%} else if (UserType.equals("3")){%> 
         <%@ include file="headeradmin.jsp" %>
         <% } %>  
			 <img src="Images/headerbg3.png" alt="" class="home-img">
    <div style="height:auto" id="WrapperBody">
        <br>

        <br><center>
            
                <span>
                     <div style="width:70%" class="panel panel-default">
						 <div class="panel-heading" style="background-color: #FCF5CA">
							 <h3 style="font-weight:bold; color:#740F2D" class="panel-title"><b>Project Proposal Evaluation</b></h3>
  </div>
  <div class="panel-body alert-warning" style="background:white;">
                    <table class="table table-bordered">
                    <form name="studentAcceptance">
						<tr bgcolor="#fff" style="font-weight:bold;color:#740F2D" align="center">
                             <td width="20px">No.</td>   
                             <td  width="200px">Student's Name</td>
                             <td  width="250px">Project Title</td>
                             <td colspan="2" >Status</td>
                             
                             
                            
                        </tr>
                       
                         <% 
                            if(!(row == 0))
                                {   for(int i=0;i<studName.size();i++)
                                   {
                                        
                                        if(proStatus.get(i)==null)
                                           {
                                           proClass="proHide";
                                           }
                                       else if(proStatus.get(i).equals("Pending"))
                                           {
                                            proURL="Images/Pproject";
                                            proClass="proShow";
                                            colProPro="#FF0000";
                                           }
                                       else if(!(proStatus.get(i).equals("Pending")))
                                           {
                                            proURL="Images/project";
                                            proClass="proShow";
                                            colProPro="#000";
                                           }
                                       
                                                                               
                                       if(color.equals("#ffe4e1"))
                                            {
                                                color = "#ffb6c1";
                                                detailURL="Images/User2.jpg";
                                                proURL=proURL+"2.jpg";
                                                appURL=appURL+"2.jpg";
                                            }
                                         else
                                            {  
                                                 color = "#ffe4e1";
                                                 detailURL="Images/User1.jpg";
                                                 proURL=proURL+"1.jpg";
                                                 appURL=appURL+"1.jpg";
                                                
                                            }
                                        
                           %>
                           <tr bgcolor="#fff" align="center">
                           <td><%=i+1%></td>
                           <td><%=studName.get(i)%></td>
                           <td><%=proTitle.get(i)%></td>
                           <td><%=proStatus.get(i)%></td>
                           <td width="30px"><span onclick="viewTitle('<%=metricNo.get(i)%>')"data-toggle="tooltip" title="Click To View <%=proTitle.get(i)%> Details" data-placement="right"><i style="color:<%=colProPro%>;font-size:1.5em" class="fa fa-file-text"></i></span>
                                                                 
                           </td>
                           
                        </tr>
                            <%      }
                              }
                            else
                                {%>
                        <tr>
                            <td colspan="3">There is no data selected from database</td>
                        </tr>
                        <%      }%>
                        <input type="hidden" name="metric" value="">
                        <input type="hidden" name="ev" value="evaluation">
                        </form>     
                </table>
                        
                                <table cellpadding="0px" cellspacing="0px">
                                    
                                    <tr>
                                        <td><i style="color:#000;font-size:1.5em" class="fa fa-file-text"></i></td>
                                        <td style="line-height:24px;">Project Status (Done)&emsp;</td>
                                        <td><i style="color:#FF0000;font-size:1.5em" class="fa fa-file-text"></i></td>
                                        <td style="line-height:24px;">Project Status (Pending)</td>
                                    </tr>
                                </table>
                            
                     
                
  </div>
                     </div>
            
           
          
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
