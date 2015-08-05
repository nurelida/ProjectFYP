<%-- 
    Document   : AdAsignTestPsm1
    Created on : Jun 23, 2009, 12:24:18 AM
    Author     : rou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="FYPManagementSys_Bean.Common" %>
<%@ page import="FYPManagementSys_Bean.Semester" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");
String selectedDay = (String)request.getAttribute("selectedDay");
String selectedRoom = (String)request.getAttribute("selectedRoom");
String color = "#fff0f5";
String time = "";
String disabled = "";
ArrayList room_name = new ArrayList();
ArrayList roomID = new ArrayList();
ArrayList chairman = new ArrayList();
ArrayList panel = new ArrayList();
ArrayList chairmanNo = new ArrayList();
ArrayList panelNo = new ArrayList();
ArrayList slot = new ArrayList();


//Select title 
ArrayList T1proTitle = new ArrayList ();
ArrayList T1metricNo = new ArrayList ();

ArrayList T2proTitle = new ArrayList ();
ArrayList T2metricNo = new ArrayList ();

//Select selectedTitle
ArrayList SproTitle = new ArrayList();
ArrayList SmetricNo = new ArrayList();
ArrayList Sslot = new ArrayList();
ArrayList Schairman = new ArrayList();
ArrayList Spanel = new ArrayList();
ArrayList Ssession = new ArrayList();

 if ((!(UserSession==null))&&(UserType.equals("3"))) {
     if(selectedRoom==null)
         selectedRoom="";
     if(selectedDay==null)
         selectedDay="";
     if(selectedRoom.equals("")&&selectedDay.equals(""))
         disabled="disabled";
     DB objDB = new DB();
     objDB.connect();
     objDB.query("select * from demo_room");
     for(int i=0;i<objDB.getNumberOfRows();i++){
         room_name.add(objDB.getDataAt(i, "room_name"));
         roomID.add(objDB.getDataAt(i, "roomID"));
     }
     if(!selectedRoom.equals("")&&!selectedDay.equals("")){
         objDB.query("select a.ev1, a.ev2, b.lectName as chairman, c.lectName as panel, a.slot "+
                    "from lec_ev_timetable a "+
                    "inner join lecturer b on b.staffNo=a.ev1 "+
                    "inner join lecturer c on c.staffNo=a.ev2 "+
                    "where a.room='"+selectedRoom+"' and a.slot like'tt"+selectedDay+"%' "+
                    "order by a.slot");
         for(int i=0;i<objDB.getNumberOfRows();i++){
             chairman.add(objDB.getDataAt(i,"chairman"));
             chairmanNo.add(objDB.getDataAt(i,"ev1"));
             panel.add(objDB.getDataAt(i,"panel"));
             panelNo.add(objDB.getDataAt(i,"ev2"));
             slot.add(objDB.getDataAt(i,"slot"));
         }
     
         objDB.query("select a.proTitle, b.studName, b.metricNo, d.slot, d.session, d.roomID, e.ev1, e.ev2 "+
                    "from title a "+
                    "inner join student b on a.metricNo=b.metricNo "+
                    "inner join psm_1 c on a.metricNo=c.metricNo "+
                    "left outer join project_evaluation d on d.metricNo=a.metricNo "+
                    "left outer join lec_ev_timetable e on e.slot=d.slot "+
                    "where d.slot is  NUll and c.semester='"+Semester.getSemester()+"'");
         for(int i=0;i<objDB.getNumberOfRows();i++){
                T1proTitle.add(objDB.getDataAt(i,"proTitle"));
                T1metricNo.add(objDB.getDataAt(i,"metricNo"));
                
                T2proTitle.add(objDB.getDataAt(i,"proTitle"));
                T2metricNo.add(objDB.getDataAt(i,"metricNo"));
         }
         objDB.query("select a.proTitle, b.studName, b.metricNo, d.slot, d.session, d.roomID, e.ev1, e.ev2 "+
                    "from title a "+
                    "inner join student b on a.metricNo=b.metricNo "+
                    "inner join psm_1 c on a.metricNo=c.metricNo "+
                    "inner join project_evaluation d on d.metricNo=a.metricNo "+
                    "inner join lec_ev_timetable e on e.slot=d.slot "+
                    "where d.slot='tt"+selectedDay+"%' and d.roomID='"+selectedRoom+"'");
         for(int i=0;i<objDB.getNumberOfRows();i++){
             SproTitle.add(objDB.getDataAt(i, "proTitle"));
             SmetricNo.add(objDB.getDataAt(i,"metricNo"));
             Sslot.add(objDB.getDataAt(i,"slot"));
             Ssession.add(objDB.getDataAt(i,"session"));
             Schairman.add(objDB.getDataAt(i,"ev1"));
             Spanel.add(objDB.getDataAt(i,"ev2"));
         }
     }
     objDB.close();
     
%>
<html>
    <head>
        
        <script type="text/javascript" src="js/AdAssignEvaluatorTest.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Year Project Management System</title>
    </head>
    
    <body>
      <form> 
      <div id="Wrapper">
          <div id="Top">
                <div id="TopContent">
                
                </div>
          </div> 
          <div id="BodyContent">
                <span>
                    <h2>Evaluator</h2>
                    <table style="font-weight:bold;text-align:right">
                        <tr>
                            <td>Presentation Room</td>
                            <td><select name="selectedRoom" onchange="select_room(this.value)">
                                    <option value="">Please Select</option>
                                    <%for(int i=0;i<room_name.size();i++){%>
                                    <option value="<%=roomID.get(i)%>" <%if(selectedRoom.equals(roomID.get(i))){%> selected<%}%>><%=room_name.get(i)%></option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Day</td>
                            <td><select name="selectedDay" onchange="select_day()" <%=disabled%>>
                                    <option value="">Please Select</option>
                                    <option value="01" <%if(selectedDay.equals("01")){%> selected<%}%> >Monday</option>
                                    <option value="02" <%if(selectedDay.equals("02")){%> selected<%}%> >Tuesday</option>
                                    <option value="03" <%if(selectedDay.equals("03")){%> selected<%}%> >Wednesday</option>
                                    <option value="04" <%if(selectedDay.equals("04")){%> selected<%}%> >Thursday</option>
                                    <option value="05" <%if(selectedDay.equals("05")){%> selected<%}%> >Friday</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <%if(!selectedRoom.equals("")&&!selectedDay.equals("")){%>
                    <table>
                        <tr bgcolor="#fa8072" style="font-weight:bold" align="center">
                            <td>Time</td>
                            <td>Chairman</td>
                            <td>Panel</td>
                            <td>Project Title</td>
                        </tr>
                        <% for(int r=2;r<13;r++){
                            String sChairman = "";
                            String sPanel = "";
                            String sChairmanNo ="";
                            String sPanelNo= "";
                            String tempSlot = "";
                                    if(color.equals("#ffe4e1"))
                                       color = "#ffb6c1";
                                    else
                                       color = "#ffe4e1";
                                     if(r==2){
                                          time="8.00am";
                                          tempSlot = "tt"+selectedDay+"02";
                                     }
                                      else if(r==3){
                                          time="9.00am";
                                          tempSlot = "tt"+selectedDay+"03";
                                      }
                                      else if(r==4){
                                          time="10.00am";
                                          tempSlot = "tt"+selectedDay+"04";
                                      }
                                      else if(r==5){
                                          time="11.00am";
                                          tempSlot = "tt"+selectedDay+"05";
                                      }
                                      else if(r==6){
                                          time="12.00pm";
                                          tempSlot = "tt"+selectedDay+"06";
                                      }
                                      else if(r==7){
                                          time="1.00pm";
                                          tempSlot = "tt"+selectedDay+"07";
                                      }
                                      else if(r==8){
                                          time="2.00pm";
                                          tempSlot = "tt"+selectedDay+"08";
                                      }
                                      else if(r==9){
                                          time="3.00pm";
                                          tempSlot = "tt"+selectedDay+"09";
                                      }
                                      else if(r==10){
                                          time="4.00pm";
                                          tempSlot = "tt"+selectedDay+"10";
                                      }
                                      else if(r==11){
                                          time="5.00pm";
                                          tempSlot = "tt"+selectedDay+"11";
                                      }
                                      else if(r==12){
                                          time="6.00pm";
                                          tempSlot = "tt"+selectedDay+"12";
                                      }
                                    String temp = "";
                                    for(int j=0;j<chairman.size();j++){
                                        if(tempSlot.equals(slot.get(j))){
                                          sChairman=(String)chairman.get(j) ;
                                          sPanel = (String)panel.get(j);
                                        }
                                        else{
                                            sChairman="";
                                            sPanel="";
                                        }
                                     }
                                    String abc = "";
                                    for(int m=0;m<SproTitle.size();m++){
                                        if(Sslot.get(m).equals(tempSlot)&&Ssession.get(m).equals("1")){
                                            T1proTitle.add(SproTitle.get(m));
                                            T1metricNo.add(SmetricNo.get(m));
                                            abc = (String)SproTitle.get(m);
                                        }
                                        else if((Sslot.get(m).equals(tempSlot))&&(Ssession.get(m).equals("2"))){
                                            T2proTitle.add(SproTitle.get(m));
                                            T2metricNo.add(SmetricNo.get(m));
                                            abc = (String)SproTitle.get(m);
                                        }
                                    }
                         %>
                         <tr bgcolor="<%=color%>">
                             <td><%=time%></td>
                             <td><%=sChairman%></td>
                             <td><%=sPanel%><%=tempSlot%>aa<%=slot.size()%>bb<%=abc%></td>
                             <td><%if(!sChairman.equals("")&&!sPanel.equals("")){%>
                                 <select>
                                     <option>Please Select</option>
                                     <% for(int k=0;k<T1proTitle.size();k++){%>
                                     <option value=<%=T1metricNo.get(k)%>><%=T1proTitle.get(k)%></option>
                                     <%}%>
                                 </select>
                                 <br>
                                 <select>
                                     <option>Please Select</option>
                                     <% for(int k=0;k<T2proTitle.size();k++){%>
                                     <option value=<%=T2metricNo.get(k)%>><%=T2proTitle.get(k)%></option>
                                     <%}%>
                                 </select>
                             <%}%>
                             </td>
                         </tr>
                         <%}%>
                    </table>
                    <%}%>
                </span>
          </div>
                
        <div id="Right">
         <!-- Login As -->
         <%@ include file="User.jsp" %>
         <br>
         <!--Main Menu-->
         <%@ include file="AdMainMenu.jsp" %>
         <br>
         </div>
         <!-- Footer-->
         <%@ include file="Footer.jsp" %>	
    </div>
     </form>
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