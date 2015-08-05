<%-- 
    Document   : AdGenerateTTable
    Created on : Mar 12, 2009, 1:17:53 PM
    Author     : rou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
ArrayList free_time = new ArrayList();
ArrayList staffNo = new ArrayList();
ArrayList lectName = new ArrayList();

ArrayList room = new ArrayList();
ArrayList roomID = new ArrayList();

ArrayList ev2_no = new ArrayList();
ArrayList ev_time = new ArrayList();
ArrayList ev1_no = new ArrayList();
ArrayList ev_room = new ArrayList();




String test="";
String query="SELECT free_period,b.lectName, a.staffNo "+
             "from lec_timetable a "+
             "inner join lecturer b on a.staffNo=b.staffNo "+
             "where a.semester='"+Semester.getSemester()+"'"+
             "order by lectName ";
String quotaQuery = "select ev1, ev2 from quota_lecturer where semester='"+semester+"'"; 

int room_row=0;          

int row=0;
int q_row=0;
 if ((!(UserSession==null))&&(UserType.equals("3"))){
     DB objDB = new DB();
     objDB.connect();
     objDB.query(query);
     row = objDB.getNumberOfRows();
        for(int i=0;i<row;i++)
            {
                free_time.add(objDB.getDataAt(i, "free_period"));
                staffNo.add(objDB.getDataAt(i,"staffNo"));
                lectName.add(objDB.getDataAt(i,"lectName"));
            }
     objDB.query(quotaQuery);
     q_row=objDB.getNumberOfRows();
     for(int i=0;i<q_row;i++)
         {
            double temp=Double.parseDouble(objDB.getDataAt(i, "ev1"));
            quota_ev1=Math.ceil(temp/2);
            temp=Double.parseDouble(objDB.getDataAt(i,"ev2"));
            quota_ev2=Math.ceil(temp/2);
         }
     
     objDB.query("select * from demo_room");
     room_row = objDB.getNumberOfRows();
     for(int i=0;i<room_row;i++)
         {
            room.add(objDB.getDataAt(i,"room_name"));
            roomID.add(objDB.getDataAt(i,"roomID"));
         }
     objDB.query("SELECT * FROM lec_ev_timetable where semester='"+Semester.getSemester()+"'");
     for(int i=0;i<objDB.getNumberOfRows();i++)
         {
            ev1_no.add(objDB.getDataAt(i, "ev1"));
            ev2_no.add(objDB.getDataAt(i,"ev2"));
            ev_time.add(objDB.getDataAt(i,"slot"));
            ev_room.add(objDB.getDataAt(i,"room"));
           
         }
    objDB.close();       
%>

<html>
    
    <head>
        
        <link rel="stylesheet" type="text/css" href="css/timetable.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        
        <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/AdTimeTable.js"></script>
        <title>Final Year Project Management System</title>
    </head>
    
    <body>
         
        <div id="Wrapper" style="padding-top:50px;">
         <%@ include file="headeradmin.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">

         
    
   
    <div style="height:auto" id="WrapperBody">
       
        <center>
            <form>
           
                    <br><h2></h2>
                    <center>
                    <div>
                        <div style="width:50%" class="panel panel-default">
							<div class="panel-heading" style="background:#FCF5CA ">
								<h2 style="color:#740F2D" class="panel-title"><b>Assign Chairman and Panel PSM 1</h2>
  </div>
  <div class="panel-body">
	  <b style="color:#740F2D;">Presentation Room&emsp;
                            <select name="demoRoom" onchange="showTable('generate')">
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<room_row;i++){%>
                                    <option value="<%=roomID.get(i)%>"><%=room.get(i)%></option>
                                    <%}%>
                                </select>
  </div>
                        </div>
                               
                            
                        
                    </div>
                    <%for(int num_room =0; num_room<room_row;num_room++){ %>
                    
                    <table style="padding-left:100px" id="adTimetable" class="hide" name="roomTable">
                        <tr>
							<td colspan="6"><h2 style="font-weight:bold; color: #FCF5CA;">Room:<%=room.get(num_room)%></h2></td>
                        </tr>
                        <tr>
                            <td style="width:75px;">&nbsp;</td>
                            <td style="width:170px;" id="adTitle" bgcolor="#ebebeb" >Sunday</td>
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
                                             if(row==0){%>
                                     <td id="<%=cName%>"></td>    
                                            <%} else {
                                                 ArrayList selectOption = new ArrayList();
                                                 ArrayList selectValue = new ArrayList();
                                                  if(!(free_time.size()==0)){%> 
                                                           <% for(int r=0;r<free_time.size();r++){
                                                                if(free_time.get(r).equals(slot)){
                                                                selectOption.add(lectName.get(r));
                                                                selectValue.add(staffNo.get(r));
                                                                } 
                                                            }
                                                }
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
                                            <%  if(!(selectOption.size()==0)){%>
                                            
                                            <select name="p1<%=slot%>_<%=roomID.get(num_room)%>" onchange="javascript:checkEvaluator(this,document.forms[0].p2<%=slot%>_<%=roomID.get(num_room)%>);checkP1(this,<%=quota_ev1%>);checkSlot(this)">
                                                <option value="">Please Select</option>
                                                <%for(int k=0;k<selectOption.size();k++){%>
                                                    <option value="<%=selectValue.get(k)%>" <%if(selectValue.get(k).equals(selected_ev1)){%> selected <%}%>><%=selectOption.get(k)%></option>
                                                <%}%>
                                            
                                            </select>
                                            
                                            <br>
                                            <br>
                                            <select name="p2<%=slot%>_<%=roomID.get(num_room)%>" onchange="javascript:checkEvaluator(this,document.forms[0].p1<%=slot%>_<%=roomID.get(num_room)%>);checkP2(this,<%=quota_ev2%>);checkSlot(this)">
                                                <option value="">Please Select</option>
                                                <%for(int k=0;k<selectOption.size();k++){%>
                                                    <option value="<%=selectValue.get(k)%>" <%if(selectValue.get(k).equals(selected_ev2)){%> selected <%}%>> <%=selectOption.get(k)%></option>
                                                <%}%>
                                            
                                            </select>
                                            
                                            <%}%>
                                    </td>   
                                    <%}%>
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
                    <div id="itemButton" class="hide">
                       <div class="btn btn-success" onclick="saveTimeTable('psm1')">&emsp;Save&emsp;</div>                       
                    </div>
                    </center>
                    </form>
            
             
        
        </center>
                    <br><br><br><br><br><br><br><br>
        


                
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