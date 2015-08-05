<%-- 
    Document   : AdViewDemoTable
    Created on : Mar 16, 2009, 11:39:29 AM
    Author     : rou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="FYPManagementSys_Bean.Semester" %>
<%@ page import="FYPManagementSys_Bean.Common" %>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");
String cName="adContent1";
String semester=Semester.getSemester();
double quota_ev1=0;
double quota_ev2=0;

ArrayList room = new ArrayList();
ArrayList roomID = new ArrayList();

ArrayList ev_time = new ArrayList();
ArrayList ev1_no = new ArrayList();
ArrayList ev_room = new ArrayList();
ArrayList ev2_no = new ArrayList();


String test="";
int room_row=0;          

int row=1;
int q_row=0;
 if ((!(UserSession==null))&&(UserType.equals("3"))){
     DB objDB = new DB();
     objDB.connect();

     objDB.query("select * from demo_room");
     room_row = objDB.getNumberOfRows();
     for(int i=0;i<room_row;i++)
         {
            room.add(objDB.getDataAt(i,"room_name"));
            roomID.add(objDB.getDataAt(i,"roomID"));
         }
     objDB.query("select a.slot, a.room, b.lectName as ev1, c.lectName as ev2 "+
                 "from lec_ev_timetable a "+
                 "inner join lecturer b  on a.ev1=b.staffNo "+
                 "inner join lecturer c  on a.ev2=c.staffNo ");
     for(int i=0;i<objDB.getNumberOfRows();i++)
         {
            ev1_no.add(objDB.getDataAt(i,"ev1"));
            ev2_no.add(objDB.getDataAt(i,"ev2"));
            ev_time.add(objDB.getDataAt(i,"slot"));
            ev_room.add(objDB.getDataAt(i,"room"));
         }
    objDB.close();       
%>

<html>
    <style type="text/css">
    .show
    {
            display: ;
    }
    .hide
    {
            display:none;
    }
    
    </style>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/timetable.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/AdTimeTable.js"></script>
        <title>Final Year Project Management System</title>
    </head>
    
    <body>
      <div id="Wrapper">
         <div id="Top">
            <div id="TopContent">
                
            </div>
         </div> 
         <div id="timeTableContent">
                <span>
                    <form>
                    <h2>Presentation Table</h2>
                    <center>
                    <div>
                         Presentation Room
                            <select name="demoRoom" onchange="showTable('view')">
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<room_row;i++){%>
                                    <option value="<%=roomID.get(i)%>"><%=room.get(i)%></option>
                                    <%}%>
                            </select>
                     </div>
                    <%for(int num_room =0; num_room<room_row;num_room++){ %>
                    
                    <table id="adTimetable" class="hide" name="roomTable">
                        <tr>
                            <td colspan="6"><h2>Room:<%=room.get(num_room)%></h2></td>
                        </tr>
                        <tr>
                            <td style="width:75px;">&nbsp;</td>
                            <td style="width:170px;" id="adTitle">Sunday</td>
                            <td style="width:170px;" id="adTitle">Monday</td>
                            <td style="width:170px;" id="adTitle">Tuesday</td>
                            <td style="width:170px;" id="adTitle">Wednesday</td>
                            <td style="width:170px;" id="adTitle">Thursday</td>
                        </tr>
                        
                        <%
                        String time="";
                        for(int i=2;i<13;i++){
                        if(cName.equals("adContent2"))
                            cName="adContent1";
                        else
                            cName="adContent2";
                            %>
                        <tr>    
                            <%   for(int j=0;j<6;j++)
                                    {
                                    String rStr = Integer.toString(j);
                                    String cStr = Integer.toString(i);
                                    String slot="tt"+Common.completeStr(rStr, 2)+ Common.completeStr(cStr, 2);
                                     if(j==0){
                                         if(i==2)
                                          time="8.00 a.m";
                                      else if(i==3)
                                          time="9.00 a.m";
                                      else if(i==4)
                                          time="10.00 a.m";
                                      else if(i==5)
                                          time="11.00 a.m";
                                      else if(i==6)
                                          time="12.00 p.m";
                                      else if(i==7)
                                          time="1.00 p.m";
                                      else if(i==8)
                                          time="2.00 p.m";
                                      else if(i==9)
                                          time="3.00 p.m";
                                      else if(i==10)
                                          time="4.00 p.m";
                                      else if(i==11)
                                          time="5.00 p.m";
                                      else if(i==12)
                                          time="6.00 p.m";
                                %>
                            <td id="adTitle"><%=time%></td>
                                    <%} else{
                                             
                                                 String selected_ev1 ="";
                                                 String selected_ev2="";
                                                  if(!(ev_time.size()==0)){ 
                                                        for(int r=0;r<ev_time.size();r++){
                                                            if(ev_time.get(r).equals(slot)&&(ev_room.get(r).equals(roomID.get(num_room)))){
                                                                selected_ev1 = (String)ev1_no.get(r);
                                                                selected_ev2 = (String)ev2_no.get(r);
                                                            }
                                                        }
                                                  }
                                                
                                                 %>
                                    <td id="<%=cName%>">
                                        <%=selected_ev1%><br>
                                        <%=selected_ev2%>
                                     </td>   
                                    
                                    <%}
                                    }%>
                        </tr>
                             <%}%>
                       
                    </table>
                    <%}%>
                    
                    <%for(int i=0;i<room_row;i++){ %>
                        <input type="hidden" name="roomID" value="<%=roomID.get(i)%>">
                    <%}%>
                    
                    <br>
                    <br>
                   
                    <div style="float:right;">
                        
                            <img src="Images/Back.jpg" onclick="javascript:history.back();" alt="Back" title="Back"  border="0"></img>
                    </div>
                    
                    
                    
                    </center>
                    </form>
                </span>
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