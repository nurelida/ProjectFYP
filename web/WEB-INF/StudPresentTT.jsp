<%-- 
    Document   : StudPresentTT
    Created on : Mar 20, 2009, 10:42:11 PM
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
String queryprofile ="Select* from student where metricNo='"+UserSession+"'";
int row =0;
int t = 0;
int d = 0;
int t_n = 0;
String slot = "-";
String panel = "-";
String chairman = "-";
String room = "-";
String ses = "-";
String psm ="";
String studName="";
String studuserID="";
String studicNo="";
String studemail="";
String studphoneNo="";

String [] day = new String[5];
day[0] = "Monday";
day[1] = "Tuesday";
day[2] = "Wednesday";
day[3] = "Thursday";
day[4] = "Friday";

String [] time = new String[11];
time[0] = "8.";
time[1] = "9.";
time[2] = "10.";
time[3] = "11.";
time[4] = "12.";
time[5] = "1.";
time[6] = "2.";
time[7] = "3.";
time[8] = "4.";
time[9] = "5.";
time[10] = "6.";

String [] t_name = new String[2];
t_name[0] = "am";
t_name[1] = "pm";

String sess = "";

 if ((!(UserSession==null))&&(UserType.equals("1"))) {
 DB objDB = new DB();
 objDB.connect();
 objDB.query(queryprofile);
 studName = objDB.getDataAt(0,"studName");
 studuserID = objDB.getDataAt(0,"metricNo");
 studicNo = objDB.getDataAt(0,"icNo");
 studemail = objDB.getDataAt(0,"emailAdd");
 studphoneNo = objDB.getDataAt(0,"phoneNo");
 objDB.query("select flag from flag_lec_ev_schedule");
 String flag = objDB.getDataAt(0,"flag");
 if(flag.equals("Yes")){
 objDB.query("select  a.slot, d.lectName as EV1, e.lectName as EV2, f.studName,  b.session, g.room_name "+
                "from lec_ev_timetable a "+
                "inner join project_evaluation b on b.slot=a.slot "+
                "inner join lecturer d on d.staffNo=a.ev1 "+
                "inner join lecturer e on e.staffNo=a.ev2 "+
                "inner join student f on f.metricNo=b.metricNo "+
                "inner join demo_room g on g.roomID=b.roomID " +
                "inner join psm_1 h on h.metricNo=b.metricNo "+
                "where a.room=b.roomID and b.metricNo='"+UserSession+"' and h.semester='"+Semester.getSemester()+"'");
 if(objDB.getNumberOfRows()==0){
     objDB.query("select  a.slot, d.lectName as EV1, e.lectName as EV2, f.studName,  b.session, g.room_name "+
                "from lec_ev_timetable_psm2 a "+
                "inner join project_evaluation_psm2 b on b.slot=a.slot "+
                "inner join lecturer d on d.staffNo=a.ev1 "+
                "inner join lecturer e on e.staffNo=a.ev2 "+
                "inner join student f on f.metricNo=b.metricNo "+
                "inner join demo_room g on g.roomID=b.roomID " +
                "inner join psm_2 h on h.metricNo=b.metricNo "+
                "where a.room=b.roomID and b.metricNo='"+UserSession+"' and h.semester='"+Semester.getSemester()+"'");
     row=objDB.getNumberOfRows();
     psm = "PSM 2";
 }
 else{
     row=objDB.getNumberOfRows();
     psm = "PSM 1";
 }
 if(!(row==0))
     {
     slot=objDB.getDataAt(0,"slot");
     panel=objDB.getDataAt(0,"EV1");
     chairman=objDB.getDataAt(0,"EV2");
     room = objDB.getDataAt(0,"room_name");
     ses = objDB.getDataAt(0, "session");
     if(ses.equals("1"))
         { sess="00";}
     if(ses.equals("2"))
         {sess="30";}
     
     d = Integer.parseInt(slot.substring(2, 4))-1;
     t = Integer.parseInt(slot.substring(4,6))-2;
     if((t+2)>3)
         t_n=1;
     else
         t_n=0;
     }
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
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <title>Final Year Project Management System</title>
    </head>
    <body>
       
      
      <div id="Wrapper" style="padding-top:50px;">
         <%@ include file="headerstudent.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">

   
    <div style="height:auto" id="WrapperBody">
<center>
                    <br>
                    <%if(flag.equals("Yes")){%>
                    <%if(!(row==0)){%>
                    <fieldset id="titleSuggestion">
                        <legend>Presentation Schedule <%=psm%></legend>
                            <table>
                                <tr>
                                    <td id="text" width="200px" >Day</td>
                                    <td id="colon">:</td>
                                    <td  align="left"><%=day[d]%></td>
                                </tr>
                                
                                <tr>
                                    <td id="text" width="200px" >Time</td>
                                    <td id="colon">:</td>
                                    <td  align="left"><%=time[t]%><%=sess%>&nbsp;<%=t_name[t_n]%></td>
                                </tr>
                                
                                <tr>
                                    <td id="text" width="200px" >Panel</td>
                                    <td id="colon">:</td>
                                    <td  align="left"><%=panel%></td>
                                </tr>
                                
                                <tr>
                                    <td id="text" width="200px" >Chairman</td>
                                    <td id="colon">:</td>
                                    <td  align="left"><%=chairman%></td>
                                </tr>
                                
                                <tr>
                                    <td id="text" width="200px" >Presentation Room</td>
                                    <td id="colon">:</td>
                                    <td  align="left"><%=room%></td>
                                </tr>
                             </table>
                     </fieldset>
                     <%} else {%>
                     <h3>
                      <p style="color:#fcf5ca;" class="text-center">Presentation Schedule temporary unavailable.</p>
                          </h3>  <br><br><br><br><br><br><br>
                     <%}%>
                     <%} else {%>
                      <h3>
                      <p style="color:#fcf5ca;" class="text-center">Presentation Schedule temporary unavailable.</p>
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
