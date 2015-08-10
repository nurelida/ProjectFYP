<%-- 
    Document   : LecViewEvStud
    Created on : Mar 20, 2009, 5:20:44 PM
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
DB objDB = new DB();
int row =0;
String lectNameProfile="";
String userIDProfile="";
String emailProfile="";
String phoneNoProfile="";
String roomNoProfile="";
ArrayList metricNo = new ArrayList();
ArrayList studName = new ArrayList();
ArrayList proTitle = new ArrayList();
ArrayList marks_ev1 = new ArrayList();
ArrayList marks_ev1_psm2 = new ArrayList();
String color ="#fff0f5";
String queryProfile ="Select* from lecturer where staffNo='"+UserSession+"'";

System.out.println("test");
 if ((!(UserSession==null))&&(UserType.equals("2"))|| (UserType.equals("3"))) {
     String proURL="Images/project1.jpg";
     String psm2URL="";
     objDB.connect();
     objDB.query(queryProfile);
     lectNameProfile = objDB.getDataAt(0,"lectName");
     userIDProfile = objDB.getDataAt(0,"staffNo");
     emailProfile = objDB.getDataAt(0,"emailAdd");
     phoneNoProfile = objDB.getDataAt(0,"phoneNo");
     roomNoProfile = objDB.getDataAt(0,"roomNo");
     objDB.query("SELECT a.proTitle, a.metricNo, b.proField, c.staffNo as supervisor,e.studName,f.flag_examiner1 "+
                    "from title a "+
                    "inner join projectField b on a.proField=b.id "+
                    "inner join supervisor c on c.metricNo=a.metricNo "+
                    "inner join psm_1 d on d.metricNo=a.metricNo "+
                    "inner join student e on e.metricNo=a.metricNo "+
                    "inner join evaluator f on f.metricNo=a.metricNo "+
                    "where a.status!='Fail' and f.examiner1No='"+UserSession+"' and d.semester='"+Semester.getSemester()+"'");
     row = objDB.getNumberOfRows();
     for(int i=0;i<row;i++)
         {
          metricNo.add(objDB.getDataAt(i, "metricNo"));
          studName.add(objDB.getDataAt(i,"studName"));
          proTitle.add(objDB.getDataAt(i, "proTitle"));
          marks_ev1.add(objDB.getDataAt(i, "flag_examiner1"));
        }
  objDB.close();
%>
<html>

    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css">
         <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
         <script src="js/profile-pass.js"></script>
         <script src="js/updateProfile.js"></script>
        <script type="text/javascript" src="js/LecEvaluation.js"></script>
        <title>Final Year Project Management System</title>
    </head>
    
  
    <body>

       
      
      <div id="Wrapper" style="padding-top:50px;">
         <%@ include file="headerlecture.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">

   

    <div style="height:auto" id="WrapperBody">

        <form>
			<center><h2 style="font-weight:bold; color:#FCF5CA">Main Assessor (Panel) PSM1</h2></center>
                    <table class="table" style="width:60%;margin: auto ;background: white;">
						<tr style="font-weight:bold; color:#740F2D;" align="center">
                             <td bgcolor="white" width="20px">No.</td>   
                             <td bgcolor="white" width="200px">Student Name</td>
                             <td bgcolor="white" width="100px">Metric No</td>
                             <td bgcolor="white" width="250px">Project Title</td>
                             <td bgcolor="white">Evaluation Form</td>
                        </tr>
                        <% if(!(row==0)){
                            for(int i=0;i<row;i++){
                                if(marks_ev1.get(i).equals("N"))
                               {
                               proURL="#FF0000";
                               }
                                else
                                   {
                                    proURL="#000000";
                                   }
                                
                                %>
                                <tr>
                                    <td><%=i+1%></td>
                                    <td><%=studName.get(i)%></td>
                                    <td><%=metricNo.get(i)%></td>
                                    <td><%=proTitle.get(i)%></td>
                                    <td align="center">
                                    <span class="glyphicon glyphicon-list-alt" style="color:<%=proURL%>;font-size: 1.5em" onclick="panelEvaluation('<%=metricNo.get(i)%>')"title="Evaluation Form" alt="Evaluation Form" ></span>
                                    </td>
                                </tr>
                        <%  }
                          }%>
                    </table>
                    <input type="hidden" name="metricNo" value="">
                    <br><br>
                    <table class="table" style="margin:auto;width: 50%" cellpadding="0px" cellspacing="0px">
                       <tr>
                            <td><span class="glyphicon glyphicon-list-alt" style="color:#fff;font-size: 1.5em"></span></td>
						   <td style="line-height:24px; color:#FCF5CA">Evaluation (Done)</td>
                            <td><span class="glyphicon glyphicon-list-alt" style="color:#FF0000;font-size: 1.5em"></span></td>
						   <td style="line-height:24px; color:#FCF5CA">Evaluation (Pending)</td>
                        </tr>
                    </table>
                    </form>
                    <br><br><br>
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
