<%-- 
    Document   : AdAssignEvaluator
    Created on : Mar 18, 2009, 2:50:06 PM
    Author     : rou
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="FYPManagementSys_Bean.Semester"%>
<%@ page import="FYPManagementSys_Bean.Common"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");



String color = "#fff0f5";
String evaluateWithoutSchedule="hide";
ArrayList ev1 = new ArrayList();
ArrayList ev2 = new ArrayList();
ArrayList ev1No = new ArrayList();
ArrayList ev2No = new ArrayList();
ArrayList room = new ArrayList();
ArrayList ev_slot = new ArrayList();

ArrayList ex1No=new ArrayList();
ArrayList ex1Name=new ArrayList();
ArrayList ex2No=new ArrayList();

ArrayList title = new ArrayList();
ArrayList metricNo = new ArrayList();
ArrayList sv = new ArrayList();
ArrayList proField = new ArrayList();

ArrayList roomID = new ArrayList();
ArrayList roomName = new ArrayList();

ArrayList studMetricNo = new ArrayList();
ArrayList studSession = new ArrayList();
ArrayList studSlot = new ArrayList();
ArrayList studRoom = new ArrayList();


ArrayList lectName = new ArrayList();
ArrayList staffNo = new ArrayList();


int row=0;
int title_row =0;
int room_row=0;
int pro_ev_row =0;

DB objDB = new DB();
//if (true == false) { 

 if ((!(UserSession==null))&&(UserType.equals("3"))) {
     objDB.connect();
     objDB.query("SELECT a.slot, a.room, b.lectName as ev1Name, c.lectName as ev2Name, a.ev1, a.ev2 "+
                 "FROM lec_ev_timetable a "+
                 "inner join lecturer b on b.staffNo=a.ev1 "+
                 "inner join lecturer c on c.staffNo=a.ev2 "+
                 "where a.semester='"+Semester.getSemester()+"'");
     row = objDB.getNumberOfRows();
     for(int i=0 ;i< row; i++)
         {
             ev_slot.add(objDB.getDataAt(i, "slot"));
             room.add(objDB.getDataAt(i, "room"));
             ev1No.add(objDB.getDataAt(i,"ev1"));
             ev2No.add(objDB.getDataAt(i,"ev2"));
             ev1.add(objDB.getDataAt(i,"ev1Name"));
             ev2.add(objDB.getDataAt(i,"ev2Name"));
             
             
           
         }
     objDB.query("SELECT a.proTitle, a.metricNo, b.proField, c.staffNo as supervisor "+
                    "from title a "+
                    "inner join projectField b on a.proField=b.id "+
                    "inner join supervisor c on c.metricNo=a.metricNo "+
                    "inner join psm_1 d on d.metricNo=a.metricNo "+
                    "where a.status!='Fail' and d.semester='"+Semester.getSemester()+"'");
     title_row = objDB.getNumberOfRows();
     for(int i=0;i<title_row;i++)
         {
            title.add(objDB.getDataAt(i, "proTitle"));
            metricNo.add(objDB.getDataAt(i,"metricNo"));
            proField.add(objDB.getDataAt(i,"proField"));
            sv.add(objDB.getDataAt(i,"supervisor"));
         }
     
     objDB.query("select roomID, room_name from demo_room");
     room_row = objDB.getNumberOfRows();
     for(int i=0;i<room_row;i++)
         {
            roomID.add(objDB.getDataAt(i,"roomID"));
            roomName.add(objDB.getDataAt(i,"room_name"));
         }
     
     objDB.query("select slot,roomID, metricNo, session from project_evaluation where semester='"+Semester.getSemester()+"'");
     pro_ev_row = objDB.getNumberOfRows();
     for(int i=0;i<pro_ev_row;i++)
        {
            studMetricNo.add(objDB.getDataAt(i,"metricNo"));
            studSession.add(objDB.getDataAt(i,"session"));
            studSlot.add(objDB.getDataAt(i,"slot"));
            studRoom.add(objDB.getDataAt(i,"roomID"));
        }
     for(int i=0;i<title_row;i++){
         String querygetidexaminer="select coalesce(examiner1No,'UNKNOWN')as examiner1No,coalesce(examiner2No,'')as examiner2No from evaluator where metricNo='"+String.valueOf(metricNo.get(i))+"'";
         
         objDB.query(querygetidexaminer);
         ex1No.add(objDB.getDataAt(i, "examiner1No"));
         ex2No.add(objDB.getDataAt(i, "examiner2No"));
         //ex1Name.add(objDB.getDataAt(i, "examiner1Name"));
         
         if(ex1No.get(i)==null)
           { ex1No.set(i,"");
           }
     }
     
     String queryLec ="select lectName, staffNo from lecturer order by lectName";
     objDB.query(queryLec);
     //lecRow=objDB.getNumberOfRows();

     for(int i=0;i<objDB.getNumberOfRows();i++)
     {
        lectName.add(objDB.getDataAt(i,"lectName"));
        staffNo.add(objDB.getDataAt(i,"staffNo"));
        
        
     }
     
     
     
     String querySupervisor ="select staffNo, metricNo from supervisor order by staffNo";
     objDB.query(queryLec);
     //lecRow=objDB.getNumberOfRows();

     for(int i=0;i<objDB.getNumberOfRows();i++)
     {
        metricNo.add(objDB.getDataAt(i,"metricNo"));
        staffNo.add(objDB.getDataAt(i,"staffNo"));
        
        
     }
%>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css"> <link rel="stylesheet" type="text/css" href="style.css"> 
        
        <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
        <script type="text/javascript" src="js/AdAssignEvaluator.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Final Year Project Management System</title>
            <style type="text/css">
    .Show{
            display: block;
    }
    .Hide{
            display:none;
    }
    .Show1{
            color:blue;
    }
    .Hide1{
            color:red;
    }
    </style>
    </head>

    
    <body>
        <script type="text/javascript">
        var numOfTitle=<%=title_row%>;
    </script>
          
        <div id="Wrapper" style="padding-top:50px;">
         <%@ include file="headeradmin.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">

         
    
   
    <div style="height:auto" id="WrapperBody">
        <br><center>
            <%if(!evaluateWithoutSchedule.equals("hide")){%>
            <form>
                        <h2></h2>
                        <center>
                            <div style="width:50%" class="panel panel-default">
								<div class="panel-heading" style="background:#FCF5CA">
	  <h2 style="color:#740F2D" class="panel-title"><b>Assign Evaluator PSM 1</h2>
  </div>
  <div class="panel-body ">
                        <table>
							<tr style="font-weight:bold; background:#FCF5CA;" align="center">
                                
                                <td>Room</td>
                                <td>&emsp;</td>
                                <td><select class="form-control" name="room" onchange="javascript:selectDay(this);selectRoomDay()">
                                        <option value="">Please Select</option>
                                        <% for(int i=0;i<room_row;i++){%>
                                        <option value="<%=roomID.get(i)%>"><%=roomName.get(i)%> </option>
                                        <%}%>
                                    </select>
                                </td>
                            </tr>
                            <tr><td><br></td></tr>
                            <tr style="font-weight:bold" align="center">    
                                <td>Day</td>
                                <td>&emsp;</td>
                                <td><select class="form-control" name="day" disabled onchange="selectRoomDay()">
                                        <option value="">Please Select</option>
                                        <option value="1">Sunday</option>
                                        <option value="2">Monday</option>
                                        <option value="3">Tuesday</option>
                                        <option value="4">Wednesday</option>
                                        <option value="5">Thursday</option>
                                    </select>
                                </td>
                            </tr>
                            </table>
  </div>
                            </div>
                            <% for(int numOfRoom=0;numOfRoom<room_row;numOfRoom++){%>
                                <% String day="";
                                   String time="";
                                    
                                    for(int c=1;c<6;c++){
                                        if(c==1)
                                          day="Monday";
                                        else if(c==2)
                                          day="Tuesday";
                                        else if(c==3)
                                          day="Wednesday";
                                        else if(c==4)
                                          day="Thursday";
                                        else if(c==5)
                                          day="Friday";   
//                                           %>
                                <table class="Hide" id="day<%=c%>_<%=roomID.get(numOfRoom)%>">
                                    <tr><td  colspan="4" style="font-weight:bold">Day : <%=day%> &nbsp;  Room: <%=roomName.get(numOfRoom)%></td>
                                    </tr>
                                    <tr bgcolor="#ebebeb" style="font-weight:bold" align="center">
                                        <td style="width:70px">Time</td>
                                        <td style="width:200px">Evaluator 1</td>
                                        <td style="width:200px">Evaluator 2 </td>
                                        <td style="width:350px">Title</td>
                                    </tr> 
                                    <% for(int r=2;r<13;r++){
                                    if(color.equals("#ffe4e1"))
                                       color = "#FFFFFF";
                                    else
                                       color = "#E3E3E3";
                                    String rStr = Integer.toString(c);
                                    String cStr = Integer.toString(r);
                                    String slot="tt"+Common.completeStr(rStr, 2)+ Common.completeStr(cStr, 2);
                                    if(r==2)
                                          time="8.00am";
                                      else if(r==3)
                                          time="9.00am";
                                      else if(r==4)
                                          time="10.00am";
                                      else if(r==5)
                                          time="11.00am";
                                      else if(r==6)
                                          time="12.00pm";
                                      else if(r==7)
                                          time="1.00pm";
                                      else if(r==8)
                                          time="2.00pm";
                                      else if(r==9)
                                          time="3.00pm";
                                      else if(r==10)
                                          time="4.00pm";
                                      else if(r==11)
                                          time="5.00pm";
                                      else if(r==12)
                                          time="6.00pm";
                                        String ev_2 ="";
                                        String ev_1 ="";
                                        String ev1_No ="";
                                        String ev2_No ="";
                                        String selectedMetric_1="";
                                        String selectedMetric_2="";
                                      for(int i=0;i<row;i++)
                                          {
                                            if((ev_slot.get(i).equals(slot))&&(room.get(i).equals(roomID.get(numOfRoom))))
                                                {
                                                    ev_1=ev1.get(i).toString();
                                                    ev_2=ev2.get(i).toString();
                                                    ev1_No=ev1No.get(i).toString();
                                                    ev2_No=ev2No.get(i).toString();
                                                }
                                          }
                                       for(int j=0;j<title_row;j++)
                                           {
                                                if(ev_1.equals(sv.get(j)))
                                                    title.set(j, "F");
                                                if(ev_2.equals(sv.get(j)))
                                                    title.set(j, "F");
                                           }
                                        for(int pro_row=0;pro_row<studSlot.size();pro_row++)
                                            {
                                                if((studSlot.get(pro_row).equals(slot))&&(studRoom.get(pro_row).equals(roomID.get(numOfRoom)))){
                                                    if(studSession.get(pro_row).equals("1")){
                                                        selectedMetric_1=studMetricNo.get(pro_row).toString();
                                                    }
                                                    
                                                    if(studSession.get(pro_row).equals("2")){
                                                        selectedMetric_2=studMetricNo.get(pro_row).toString();
                                                    }
                                                    
                                                }
                                            }
                                    %>
                                    <tr>
                                        <td bgcolor="<%=color%>"><%=time%></td>
                                        <td bgcolor="<%=color%>"><%=ev_1%></td>
                                        <td bgcolor="<%=color%>"><%=ev_2%></td>
                                        <td bgcolor="<%=color%>">
                                         <%if(((ev_1.equals(""))||(ev_2.equals("")))){%>
                                         <select name="s1_<%=slot%>_<%=roomID.get(numOfRoom)%>"  style="width:300px">
                                             <option value="">Please Select</option>
                                            <%for(int j=0;j<title_row;j++){
                                                %>
                                                <option class="Show" value="<%=metricNo.get(j)%>" <%if(selectedMetric_1.equals(metricNo.get(j))){%> selected <%}%><%if(sv.get(j).equals(ev1_No) || sv.get(j).equals(ev2_No)){%> disabled <%}%>> <%=title.get(j)%> </option>
                                                <%
                                                }%>
                                        </select>
                                        <br style="line-height:1px">
                                        <br style="line-height:1px">
                                        <select name="s2_<%=slot%>_<%=roomID.get(numOfRoom)%>" onchange="checkAvailability()" style="width:300px">
                                            <option value="">Please Select</option>
                                            <%for(int j=0;j<title_row;j++){
                                                %>
                                                <option class="Show" value="<%=metricNo.get(j)%>" <%if(selectedMetric_2.equals(metricNo.get(j))){%> selected <%}%><%if(sv.get(j).equals(ev1_No) || sv.get(j).equals(ev2_No)){%> disabled <%}%>> <%=title.get(j)%> </option>
                                                <%
                                                }%>
                                        </select>
                                        </td>
                                        <%}%>
                                    </tr>
                                    <%}%>
                               </table> 
                                <%}}%>
                            
                        
                     
                       <table id="itemBtn" class="Hide">
                          <tr>
                             <td><div class="btn btn-success" onclick="save()">&emsp;&nbsp;Save&nbsp;&emsp;</div></td>
                          </tr>
                      </table>
                     <% for(int i=0;i<room_row;i++){%>
                      <input type="hidden" name="roomID" value="<%=roomID.get(i)%>">
                      <%}%>
                    </form>
        <%}else{%>
                 <form>
                        <h2></h2>
                        <center>
                            <div style="width:70%" class="panel panel-default">
  <div class="panel-heading" style="background: #fcf5ca">
      <h2 style="color:#740f2d" class="panel-title"><b>Assign Evaluator PSM 1</h2>
  </div>
  <div class="panel-body ">
                        <table class="table table-bordered">
                            <tr style="font-weight:bold;color:#000" align="center">
                                
                                <td>Student Matric No.</td>
                                <td>Title</td>
                                <td>Examiner 1</td>
                                <td>Examiner 2</td>                 
                            </tr>
                            <%for (int i=0;i<title_row;i++){%>
                                <td><%=metricNo.get(i)%></td>
                                <td><%=title.get(i)%></td>
                                <td><%
                                    String query="select b.LectName,b.staffNo,b.department,b.active "+
                                                 "from student a "+
                                                 "inner join lecturer b on b.department=a.department "+
                                                 "where a.metricNo='"+String.valueOf(metricNo.get(i))+"' "+
                                                 "and b.active='Active'";
                                                 //"from supervisor c"+
                                                 //"inner join evaluator d on d.supervisorNo=c.supervisorNo"+
                                           // "where c.supervisorNo='"+String.valueOf(sv.get(i))+"'";
                                    objDB.query(query);
                                    %>
                                    
                                    <% out.print(ex1No.get(i)); %>
                                   
                                    
                                
                                  
                                    <select  id="assignEX1<%=metricNo.get(i)%>" class="form-control" onchange="assignvalueEX1('<%=metricNo.get(i)%>')" >
                                       
                                        <option value="">Please Select</option>
                                        <%for(int j=0;j<objDB.getNumberOfRows();j++){%>
                                        <%out.print(lectName.get(j));%>
                                        <%--<option value="<%=objDB.getDataAt(j, "staffNo")%>"><%=objDB.getDataAt(j, "lectName")%>   </option>--%>
                                        
                                        <%--<%if(ex1No.get(i).equals(objDB.getDataAt(j, "staffNo")))   {%>selected<%}%> --%>
                                        
                                        <%--    <option value="Conditional Approval (Major)" <%if(statusTitle.equals("Conditional Approval (Major)")){%> selected <%}%>>Conditional Approval(Major)</option>   --%>
                                        
                                        <option <%if((staffNo.get(j).equals(ex1No.get(i)))){%>selected<%}%> value="<%=staffNo.get(j)%>"><%=lectName.get(j)%> </option>
                                      
                                        <%--<option value="<%=staffNo.get(j)%>" <%if((staffNo.get(j).equals(svNo.get(i)))){%> disabled <%}%>  ><%=lecName.get(j)%></option>--%>
                                        
                                  
                                        
                                        
                                        <%}%>
                                    </select>
                                </td>
                                <td>
                                    <%
                                    String query2="select b.LectName,b.staffNo,b.department,b.active "+
                                                 "from student a "+
                                                 "inner join lecturer b on b.department=a.department "+
                                                 "where a.metricNo='"+String.valueOf(metricNo.get(i))+"' "+
                                                 " and b.active='Active'";
                                    objDB.query(query2);
                                    %>
                                    
                                    <% out.print(ex2No.get(i)); %>
                                    <%--<% out.print(ex2No.get(i)); %>--%>
                                    
                                    <select id="assignEX2<%=metricNo.get(i)%>" class="form-control" onchange="assignvalueEX2('<%=metricNo.get(i)%>')"  class="form-control">
                                        
                                        <option value="">Please Select</option>
                                        <%for(int j=0;j<objDB.getNumberOfRows();j++){%>
                                        <%out.print(lectName.get(j));%>
                                        
                                        <%--<option value="<%=objDB.getDataAt(j, "staffNo")%>"><%=objDB.getDataAt(j, "LectName")%></option>--%>
                                        
                                         <%--<option <%if((staffNo.get(j).equals(ex2No.get(i)))){%>selected<%}%> value="<%=lectName.get(j)%>"><%=lectName.get(j)%> </option>--%>
                                        <option <%if((staffNo.get(j).equals(ex2No.get(i)))){%>selected<%}%> value="<%=staffNo.get(j)%>"><%=lectName.get(j)%> </option>
                                        <%--<option value="<%=objDB.getDataAt(j, "staffNo")%>" <%if(ex1No.get(i).equals(objDB.getDataAt(j, "staffNo"))){%> selected <%}%>  ><%=objDB.getDataAt(j, "LectName")%></option>--%>
                                        <%}%>
                                    </select>
                                </td>
                            </tr><%}%>
                            </table>
  </div>
                            </div>
                
                
                
                
                
                            <input type="hidden" name="metricNo" value="">
                            <input type="hidden" name="assignEX1" value="">
                            <input type="hidden" name="assignEX2" value="">
                
                 </form>
                
            <%}%>
             
        
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
           <script>checkAvailability();</script> 
    </body>
</html>


<%
objDB.close();
}
else 
    {
      String  address="/WEB-INF/Message.jsp?Message=Sorry. Your are not allowed to access this page without login.";
      RequestDispatcher dispatcher = request.getRequestDispatcher(address);
      dispatcher.forward(request, response);
    }
%>
