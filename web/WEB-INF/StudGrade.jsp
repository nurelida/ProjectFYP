<%-- 
    Document   : StudentHome
    Created on : Jan 14, 2009, 10:10:44 PM
    Author     : rou
    Change     :
    ----------------------------------------------------------------------------
    Date            Change                                 Author
    ----------------------------------------------------------------------------
    15/1/2009       Add User Session                       Yihrou
    ----------------------------------------------------------------------------
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="FYPManagementSys_Bean.Common" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");
String queryprofile ="Select* from student where metricNo='"+UserSession+"'";
String grade_psm1 = "";
String studNameGrade = "";
String grade_psm2 = "";
String studName = "";
String studuserID="";
String studicNo="";
String studemail="";
String studphoneNo="";
float psm1_pembentangan =0;
float psm1_penilaian = 0;
float psm1_penyeliaan = 0;

float psm2_pembentangan =0;
float psm2_penilaian = 0;
float psm2_penyeliaan = 0;

float psm1_marks =0;
float psm2_marks =0;
String flag = "";
String query = "select studName, b.jumlah as Pembentangan, c.total as Penilaian, d.total as Penyeliaan "+
                "from student a "+
                "inner join ev_pembentangan_psm1 b on b.metricNo=a.metricNo "+
                "inner join ev_penilaian_psm1 c on c.metricNo=a.metricNo "+
                "inner join supervision_marks_psm1 d on d.metricNo=a.metricNo "+
                "where a.metricNo='"+UserSession+"'";

String query2 ="select a.studName, b.jumlah as pembentangan, c.total as penilaian, d.total as penyeliaan, e.total as fasa1, f.total as fasa2 "+
"from student a "+
"inner join ev_pembentangan_psm2 b on a.metricNo=b.metricNo "+
"inner join ev_penilaian_psm2 c on a.metricNo=c.metricNo "+
"inner join supervision_marks_psm2 d on a.metricNo=d.metricNo "+
"inner join supervision_phase1_psm2 e on e.metricNo=a.metricNo "+
"inner join supervision_phase2_psm2 f on a.metricNo=f.metricNo "+
"where a.metricNo='"+UserSession+"'";
 if ((!(UserSession==null))&&(UserType.equals("1"))) {
     
     DB objDB = new DB();
     objDB.connect();
     objDB.query(queryprofile);
    studName = objDB.getDataAt(0,"studName");
    studuserID = objDB.getDataAt(0,"metricNo");
    studicNo = objDB.getDataAt(0,"icNo");
    studemail = objDB.getDataAt(0,"emailAdd");
    studphoneNo = objDB.getDataAt(0,"phoneNo");
     objDB.query("select flag from flag_stud_result");
     flag = objDB.getDataAt(0, "flag");
     if(flag.equals("Yes")){
         objDB.query(query);
         if(objDB.getNumberOfRows()>0){
            psm1_marks=Float.parseFloat(objDB.getDataAt(0,"Penilaian"))+Float.parseFloat(objDB.getDataAt(0,"Pembentangan"))+Float.parseFloat(objDB.getDataAt(0, "Penyeliaan"));
            grade_psm1 = Common.checkGrade(psm1_marks);
         }
         studNameGrade = objDB.getDataAt(0,"studName");
         objDB.query(query2);
         if(objDB.getNumberOfRows()>0)
             {
             psm2_marks= Float.parseFloat(objDB.getDataAt(0,"pembentangan"))+
                         Float.parseFloat(objDB.getDataAt(0,"penyeliaan"))+ 
                         Float.parseFloat(objDB.getDataAt(0,"penilaian"))+
                         (Float.parseFloat(objDB.getDataAt(0,"fasa1"))/15*5)+
                         (Float.parseFloat(objDB.getDataAt(0,"fasa2"))/15*10);
             grade_psm2 = Common.checkGrade(psm2_marks);
             }
         else
             grade_psm2 = "<b style=\"color:#ff0000;\">Temporary not available.</b>";
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
      
      
      <div id="Wrapper" style="padding-top:50px;">
         <%@ include file="headerstudent.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">

   
    <div style="height:auto" id="WrapperBody">
<center>
                   <%if(flag.equals("Yes")){%>
                    <% if(!grade_psm1.equals("")){%>
                    <h2>Grade</h2>
                    <table style="font-family: Arial, Helvetica, sans-serif; font-size: 13px;">
                        <tr style="font-weight:bold" align="center">
                            <td>Name</td>
                            <td><%=studNameGrade%></td>
                        </tr>
                        
                        <tr style="font-weight:bold" align="center">
                            <td>Grade PSM 1</td>
                            <td><%=grade_psm1%></td>
                        </tr>
                        <tr style="font-weight:bold" align="center">
                            <td>Grade PSM 2</td>
                            <td><%=grade_psm2%></td>
                        </tr>
                    </table>
                    <%} else{%>
                    <br>
                     <h3>
                      <p class="text-center">Grade temporary not available.</p>
                      </h3>  <br><br><br><br><br><br><br>
                    <%}%>
                    <%} else {%>
                    <br>
                     <h3>
                      <p class="text-center" >Grade temporary not available.</p>
                      </h3>  <br><br><br><br><br><br><br>
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