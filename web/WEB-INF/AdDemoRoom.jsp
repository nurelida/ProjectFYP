<%-- 
    Document   : AdDemoRoom
    Created on : Mar 13, 2009, 10:44:29 PM
    Author     : rou
--%>
<a href="AdDemoRoom.jsp"></a>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");

String temp = request.getParameter("index");
String itemAdd = "addHide";
String itemEdit ="editHide";
String btnAdd = "addShow";
String query="select * from demo_room";
ArrayList roomID = new ArrayList();
ArrayList roomName = new ArrayList();

String delURL = "Images/del_24_2.jpg";
String editURL = "Images/edit_24_2.jpg";
String color ="#fff0f5";
int row = 0;
int index = 0;

if ((!(UserSession==null))&&(UserType.equals("3"))) {
    DB objDB = new DB();
    objDB.connect();
    objDB.query(query);
    row=objDB.getNumberOfRows();
    for(int i=0;i<row;i++)
        {
            roomID.add(objDB.getDataAt(i, "roomID"));
            roomName.add(objDB.getDataAt(i, "room_name"));
        }
    objDB.close();
    
    if(!(temp==null))
        {
            index = Integer.parseInt(temp);
            itemAdd = "addHide";
            itemEdit ="editShow";
            btnAdd = "addHide";
        }
%>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
         <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css"> <link rel="stylesheet" type="text/css" href="style.css"> 
        
        <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
        <script type="text/javascript" src="js/AdDemoRoom.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Year Project Management System</title>
    </head>
    <style type="text/css">
    .addShow,
    .editShow
    {
            display: ;
    }
    .addHide,
    .editHide
    {
            display:none;
    }
    </style>
  
    <body>
                 
        <div id="Wrapper" style="padding-top:50px;">
         
         <%@ include file="headeradmin.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">

    
    <div style="height:auto" id="WrapperBody">
        

        <center>
            <h2 style="font-weight:bold; color:#fcf5ca;">Presentation room</h2>
            <form name="quotaLec">
                    
                       <center>
                         <table style="width:50%" class="table table-hover table-bordered">
                             <tr bgcolor="#fcf5ca" style="font-weight:bold;color:#740f2d;" align="center" >
                                 
                                 <td width="20px">No.</td>
                                 <td>Presentation Room</td>
                                 <td width="52px">Edit</td>
                                 <td width="52px">Delete</td>
                             </tr>
                             <%  if(!(row==0)){
                                 for(int i=0;i<roomID.size();i++){
                                     if(color.equals("#ffe4e1"))
                                                    {
                                                        delURL="Images/del_24_1.jpg";
                                                        editURL = "Images/edit_24_1.jpg";
                                                        color = "#ffb6c1";
                                                    }
                                                 else
                                                    {  
                                                        color = "#ffe4e1";
                                                        delURL="Images/del_24_2.jpg";
                                                        editURL = "Images/edit_24_2.jpg";
                                                    }
                             %>
                             <tr style="background:white;">
                                 <td align="center"><%=i+1%></td>
                                 <td><%=roomName.get(i)%></td>
                                 <td widht="50px" >
                                     <span  onclick="save('edit','<%=i%>')" title="Edit" alt="Edit" ><i class="glyphicon glyphicon-edit"></i></span>
                                 </td>
                                 <td>
                                    <span  onclick="save('delete','<%=roomID.get(i)%>')" title="Delete" alt="Delete" ><i class="glyphicon glyphicon-remove"></i></span> 
                                 </td>
                             </tr>
                             <% }
                                 }
                             else{
                             %>
                             <tr>
                                 <td colspan="6">There is no presentation room had been assign.</td>
                             </tr>
                             <%}%>
                         </table>
                         <table>
                             <tr align="center" id="btnAdd" class="<%=btnAdd%>">
                                 <td colspan="6"><span class="btn btn-success" onclick="showAdd()">&emsp;Add&nbsp;<i class="glyphicon glyphicon-plus-sign"></i>&emsp;</span></td>
                             </tr>
                         </table>
                                        <table>
                         
                         <tr id="itemAdd" class="<%=itemAdd%>">
                                
                             <td colspan="6">
                                <br>
                                <br>
                                 
                                    <table class="table table-bordered">
                                        <tr>
          
                                            <td bgcolor="#fcf5ca" style="color:#740f2d" colspan="4"><b>Add New Presentation Room</td>
                                            </tr>
                                            <tr style="background:white;">
                                                <td >Presentation Room</td>
                                                
                                                <td colspan="3"><input class="form-control" id="inputText" type="text" name="demoRoom"></td>
                                            </tr>
                                                                                 </table>
                                <table align="center">
                                            <tr align="center">
                                               
                                                <td align="center"><span class="btn btn-success" onclick="save('save','0')">&emsp;Save&emsp;</span>
                                                <span class="btn btn-warning" onclick=" hideAdd()">&emsp;Cancel&emsp;</span></td>
                                            </tr>
                                            
                                </table>
                            </td>
                         </tr>
                         </table>
                         <%if(!(temp==null)){%>
                         <table>
                         <tr id="itemEdit" class="<%=itemEdit%>">
                                
                             <td colspan="6">
                                <br>
                                <br>
                                  <table class="table table-bordered">
                                        <tr>
          
                                            <td bgcolor="#ebebeb" colspan="4"><b>Edit Presentation Room</td>
                                            </tr>
                                            <tr>
                                                <td >Presentation Room</td>
                                                
                                                <td colspan="2"><input class="form-control" id="inputText" type="text" name="editDemoRoom" value="<%=roomName.get(index)%>"></td>
                                            </tr>
                                  </table>
                                            <table align="center">
                                            
                                            <tr align="center">
                                                
                                                <td align="center"><span class="btn btn-success" onclick="save('saveChanges','<%=roomID.get(index)%>')">&emsp;Save&emsp;</span>
                                                <span class="btn btn-warning" onclick=" hideAdd()">&emsp;Cancel&emsp;</span></td>
                                            </tr>
                                            
                                     </table>
                                 
                            </td>
                            <%}%>
                         </tr>
                        </table>
                        <input type="hidden" name="roomID" value="">
                      </center>
                      </form>
           
     
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
