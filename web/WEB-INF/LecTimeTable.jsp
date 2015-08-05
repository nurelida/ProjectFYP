<%-- 
    Document   : LecTimeTable
    Created on : Mar 11, 2009, 6:05:56 PM
    Author     : rou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="FYPManagementSys_Bean.Common" %>
<%@ page import="FYPManagementSys_Bean.Semester" %>
<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");
String selectedPSM = (String)request.getAttribute("selectedPSM");
String selectedEv = (String)request.getAttribute("selectedEv");

String query="select * from lec_timetable where staffNo='"+UserSession+"' and semester='"+Semester.getSemester()+"'";
String queryProfile ="Select* from lecturer where staffNo='"+UserSession+"'";
String lectNameProfile="";
String userIDProfile="";
String emailProfile="";
String phoneNoProfile="";
String roomNoProfile="";
String time="";
int row =0;
int row_ev1Table =0;
int row_ev2Table =0;
int row_ev1_psm1 = 0;

ArrayList ev1_time = new ArrayList();
ArrayList ev1_no = new ArrayList();
ArrayList ev1_room = new ArrayList();

ArrayList ev2_time = new ArrayList();
ArrayList ev2_no = new ArrayList();
ArrayList ev2_room = new ArrayList();

ArrayList ev1_psm1 = new ArrayList();
ArrayList ev1_ev2_psm1 = new ArrayList();
ArrayList ev1_time_psm1 = new ArrayList();
ArrayList ev1_day_psm1 = new ArrayList();
ArrayList ev1_room_psm1 = new ArrayList();
ArrayList ev1_studName_psm1 = new ArrayList();
ArrayList ev1_metricNo_psm1 = new ArrayList();
ArrayList ev1_proTitle_psm1 = new ArrayList();
String show = "";
String color2 = "#fff0f5";

ArrayList freeTime = new ArrayList();

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
     row = objDB.getNumberOfRows();
     for(int i=0;i<row;i++)
         {
            freeTime.add(objDB.getDataAt(i, "free_period"));
         }
     
    objDB.query("SELECT b.lectName as ev1, slot, d.room_name "+
                "FROM lec_ev_timetable a "+
                "inner join lecturer b on a.ev1=b.staffNo "+
                "inner join lecturer c on a.ev2=c.staffNo "+
                "inner join demo_room d on d.roomID=a.room "+
                "where ev1='"+UserSession+"'");
     row_ev1Table = objDB.getNumberOfRows();
     for(int i=0;i<objDB.getNumberOfRows();i++)
         {  
            ev1_no.add(objDB.getDataAt(i,"ev1"));
            ev1_time.add(objDB.getDataAt(i,"slot"));
            ev1_room.add(objDB.getDataAt(i,"room_name"));
         }
     objDB.query("SELECT b.lectName as ev2, slot, d.room_name "+
                "FROM lec_ev_timetable a "+
                "inner join lecturer b on a.ev1=b.staffNo "+
                "inner join lecturer c on a.ev2=c.staffNo "+
                "inner join demo_room d on d.roomID=a.room "+
                "where ev2='"+UserSession+"'");
     
     row_ev2Table=objDB.getNumberOfRows();
     for(int i=0;i<objDB.getNumberOfRows();i++)
         {  
            ev2_no.add(objDB.getDataAt(i,"ev1"));
            ev2_time.add(objDB.getDataAt(i,"slot"));
            ev2_room.add(objDB.getDataAt(i,"room_name"));
         }
        if(selectedPSM==null)
             selectedPSM="";
        if(selectedEv==null)
             selectedEv="";
     String querySelect = "";
     if(selectedPSM.equals("psm1")){
         if(selectedEv.equals("ev1")){
             querySelect = "select  a.slot, d.lectName as EV1, e.lectName as EV2, f.studName,  b.session, g.room_name, i.proTitle, f.metricNo "+
                "from lec_ev_timetable a "+
                "inner join project_evaluation b on b.slot=a.slot "+
                "inner join lecturer d on d.staffNo=a.ev1 "+
                "inner join lecturer e on e.staffNo=a.ev2 "+
                "inner join student f on f.metricNo=b.metricNo "+
                "inner join demo_room g on g.roomID=b.roomID "+
                "inner join psm_1 h on h.metricNo=b.metricNo "+
                "inner join title i on i.metricNo=b.metricNo "+
                "where a.ev1='"+UserSession+"' and a.semester='"+Semester.getSemester()+"'";
         }
         else{
            querySelect = "select  a.slot, d.lectName as EV1, e.lectName as EV2, f.studName,  b.session, g.room_name, i.proTitle, f.metricNo "+
                "from lec_ev_timetable a "+
                "inner join project_evaluation b on b.slot=a.slot "+
                "inner join lecturer d on d.staffNo=a.ev1 "+
                "inner join lecturer e on e.staffNo=a.ev2 "+
                "inner join student f on f.metricNo=b.metricNo "+
                "inner join demo_room g on g.roomID=b.roomID "+
                "inner join psm_1 h on h.metricNo=b.metricNo "+
                "inner join title i on i.metricNo=b.metricNo "+
                "where a.ev2='"+UserSession+"' and a.semester='"+Semester.getSemester()+"'"; 
         }
     }
     else if(selectedPSM.equals("psm2")){
         if(selectedEv.equals("ev1")){
           querySelect = "select  a.slot, d.lectName as EV1, e.lectName as EV2, f.studName,  b.session, g.room_name, i.proTitle, f.metricNo "+
                        "from lec_ev_timetable_psm2 a "+
                        "inner join project_evaluation_psm2 b on b.slot=a.slot "+
                        "inner join lecturer d on d.staffNo=a.ev1 "+
                        "inner join lecturer e on e.staffNo=a.ev2 "+
                        "inner join student f on f.metricNo=b.metricNo "+
                        "inner join demo_room g on g.roomID=b.roomID "+
                        "inner join psm_2 h on h.metricNo=b.metricNo "+
                        "inner join title i on i.metricNo=b.metricNo "+
                        "where a.ev1='"+UserSession+"' and a.semester='"+Semester.getSemester()+"'";
         }
         else{
             querySelect = "select  a.slot, d.lectName as EV1, e.lectName as EV2, f.studName,  b.session, g.room_name, i.proTitle, f.metricNo "+
                        "from lec_ev_timetable_psm2 a "+
                        "inner join project_evaluation_psm2 b on b.slot=a.slot "+
                        "inner join lecturer d on d.staffNo=a.ev1 "+
                        "inner join lecturer e on e.staffNo=a.ev2 "+
                        "inner join student f on f.metricNo=b.metricNo "+
                        "inner join demo_room g on g.roomID=b.roomID "+
                        "inner join psm_2 h on h.metricNo=b.metricNo "+
                        "inner join title i on i.metricNo=b.metricNo "+
                        "where a.ev2='"+UserSession+"' and a.semester='"+Semester.getSemester()+"'";
         }
     }
     if((!selectedPSM.equals(""))&&(!selectedEv.equals(""))){
         objDB.query(querySelect);
         row_ev1_psm1 = objDB.getNumberOfRows();
         for(int i=0;i<objDB.getNumberOfRows();i++){
                String temp_day = objDB.getDataAt(i,"slot");
                String temp_session = objDB.getDataAt(i,"session");
                ev1_day_psm1.add(Common.getDay(temp_day.substring(2, 4)));
                ev1_time_psm1.add(Common.getTime(temp_day.substring(4,6),temp_session));
                ev1_room_psm1.add(objDB.getDataAt(i,"room_name"));
                ev1_psm1.add(objDB.getDataAt(i, "EV1"));
                ev1_studName_psm1.add(objDB.getDataAt(i, "studName")); 
                ev1_metricNo_psm1.add(objDB.getDataAt(i,"metricNo")); 
                ev1_proTitle_psm1.add(objDB.getDataAt(i, "proTitle"));
                ev1_ev2_psm1.add(objDB.getDataAt(i,"EV2"));
         }
     }
    objDB.query("select flag from flag_lec_ev_schedule");
    show = objDB.getDataAt(0,"flag");
    objDB.close();    
   
%>
<html

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/timetable.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/LecTimeTable.js"></script>
        <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
         <script src="js/profile-pass.js"></script>
         <script src="js/updateProfile.js"></script>
        <title>Final Year Project Management System</title>
    </head>
   <style type="text/css">
    .mouseHover{
            color:#FF0000; 
            text-decoration: underline;
            cursor:default;
    }
    .mouseOut{
            text-decoration: underline;
            cursor:default;
    }
 </style>
  
    <body>
               
      
      <div id="Wrapper" style="padding-top:50px;">
         <%@ include file="headerlecture.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">
         
    
    
    <div style="height:auto" id="WrapperBody">
        <br>

        <br><center>
           <form name="lecTT">
                    <% if(show.equals("Yes")){ %>
						<h2 style="font-weight:bold; color: #FCF5CA">Please Click for free time.</h2>
                    <table style="width:90%" class="timetable table table-bordered table-hover" >
                       
                       <tr>
                            <td style="background-color:white; width:130px;"></td>
                            <td style="background-color:white; width:100px;">Sunday</td>
                            <td style="background-color:white; width:100px;">Monday</td>
                            <td style="background-color:white; width:100px;">Tuesday</td>
                            <td style="background-color:white; width:100px;">Wednesday</td>
                            <td style="background-color:white; width:100px;">Thursday</td>
                       </tr>
                       <%
                         
                         for(int i=2;i<13;i++)
                           {%>
                        <tr>
                            <%for(int j=0;j<6;j++){
                                String rStr = Integer.toString(j);
                                String cStr = Integer.toString(i);
                                String name=Common.completeStr(rStr, 2)+ Common.completeStr(cStr, 2);
                                
                                if(j==0)
                                    { if(i==2)
                                          time="8.00 am";
                                      else if(i==3)
                                          time="9.00 am";
                                      else if(i==4)
                                          time="10.00 am";
                                      else if(i==5)
                                          time="11.00 am";
                                      else if(i==6)
                                          time="12.00 pm";
                                      else if(i==7)
                                          time="1.00 pm";
                                      else if(i==8)
                                          time="2.00 pm";
                                      else if(i==9)
                                          time="3.00 pm";
                                      else if(i==10)
                                          time="4.00 pm";
                                      else if(i==11)
                                          time="6.00 pm";
                                      else if(i==12)
                                          time="7.00 pm";
                                 %>
                                    <td style="background-color:white;"><%=time%></td>
                                <%} else{
                                        
                                        if(row==0){
                                 %>
                                        <td style="background-color:rgb(255, 146, 182);" id="tt<%=name%>" onclick="chg(this, document.lecTT.tt<%=name%>)">
                                        <input type="hidden" name="tt<%=name%>"></td>
                                <%      }
                                        else{
                                             String color="rgb(255, 146, 182)";
                                             String value="0";
                                             
                                             for(int k=0;k<freeTime.size();k++){
                                                 if(freeTime.get(k).equals("tt"+name)){ 
                                                  color="rgb(102, 255, 102)";
                                                  value="1";
                                                }
                                               
                                              }
                                 %> 
                                             <td style="background-color:<%=color%>;" id="tt<%=name%>" onclick="chg(this, document.lecTT.tt<%=name%>)">
                                             <input type="hidden" name="tt<%=name%>" value="<%=value%>"></td> 
                                 <%       }
                                }
                                %>
                            <%}%>
                        </tr>
                        <%}%>
                        </table>
                       
                        <table>
                            <tr>
								<td width="50px"style="background-color:red; "></td><td class="desc" style="color: #FCF5CA;">Busy</td>
								<td width="50px"style="background-color:#66FF66; "></td><td class="desc" style="color: #FCF5CA;">Free Time</td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td>
                                    <br>
                                </td>
                            </tr>
                            <tr>
                                <td><span class="btn btn-success" onclick="saveTimeTable('saveTimetable')">&emsp;Save&emsp;</span></td>
                            </tr>
                        </table>
                    </center>
                        <%} else {%>
                        <div style="margin:auto">
                            <div style="width:50%" class="panel panel-default">
  <div class="panel-heading">
      <h2 style="color:#000" class="panel-title">Evaluation Schedule</h2>
  </div>
  <div class="panel-body alert-warning">
                
                       <table style="font-weight:bold;text-align:right">
                           <tr>
                               <td>Bachelor Project:</td>
                               <td>&emsp;</td>
                               <td>
                                   <select class="form-control" name="selectedPSM" onchange="showSelectEv(this.value)">
                                       <option value="">Please Select</option>
                                       <option value="psm1" <%if(selectedPSM.equals("psm1")){%> selected <%}%> >Bachelor Project 1 (PSM1)</option>
                                       <option value="psm2" <%if(selectedPSM.equals("psm2")){%> selected <%}%> >Bachelor Project 2 (PSM2)</option>
                                   </select>
                               </td>
                           </tr>
                           <tr><td><br></td></tr>
                           <tr>
                               <td>Evaluator:</td>
                               <td>&emsp;</td>
                               <td>
                                   <select class="form-control" name="selectedEv" onchange="selectEv('selectEv')" <%if(selectedPSM.equals("")){%> disabled <%}%>>
                                       <option value="">Please Select</option>
                                       <option value="ev1" <%if(selectedEv.equals("ev1")){%> selected <%}%>>Main Assessor (Chairman)</option>
                                       <option value="ev2" <%if(selectedEv.equals("ev2")){%> selected <%}%>>Second Assessor (Panel)</option>
                                   </select>
                               </td>
                           </tr>
                       </table>
  </div>
            </div>
                        
                       </div>
                       <%if((!selectedPSM.equals(""))&&(!selectedEv.equals(""))){%>
                       <table style="width:80%" class="table table-bordered table-hover">
                           <tr bgcolor="#ebebeb" style="font-weight:bold;text-align:center">
                               <td width="250px">Student Name</td>
                               <td width="250px">Project Title</td>
                               <td width="80px">Day</td>
                               <td width="50px">Time</td>
                               <td width="150px">Chairman</td>
                               <td width="150px">Panel</td>
                           </tr>
                           <%if(row_ev1_psm1>0){%>
                           <%for(int i=0;i<row_ev1_psm1;i++){
                              if(color2.equals("#ffe4e1")){
                                    color2 = "#ffb6c1";
                                    }
                                 else{  
                                    color2 = "#ffe4e1";
                                 }
                               %>
                           <tr >
                               <td style="text-decoration:underline"><div onmouseover="this.className='mouseHover'" onmouseout="this.className='mouseOut'" onclick="viewTitle('<%=ev1_metricNo_psm1.get(i)%>')"><%=ev1_studName_psm1.get(i)%></div></td>
                               <td><%=ev1_proTitle_psm1.get(i)%></td>
                               <td><%=ev1_day_psm1.get(i)%></td>
                               <td><%=ev1_time_psm1.get(i)%></td>
                               <td><%=ev1_psm1.get(i)%></td>
                               <td><%=ev1_ev2_psm1.get(i)%></td>
                           </tr>
                           <%}%>
                           <%}else{%>
                           <tr>
                               <td colspan="6">No result found !!</td>
                           </tr>
                           <%}%>
                       </table>
                       <%}%>
                       <center>
                       
                    </center>
                    <%}%>
                    <input type="hidden" name="metric" value="">
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