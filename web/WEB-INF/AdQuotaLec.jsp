<%-- 
    Document   : AdQuotaLec
    Created on : Feb 27, 2009, 5:01:35 PM
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

String itemAdd = "addHide";
String btnAdd = "addShow";
String itemEdit ="addHide";

String temp_i = request.getParameter("index");
String semester = "";
String query = "select * from quota_lecturer";
String querydept="select * from department";
String queryscheme="select * from evaluationscheme where flag='Y'";
ArrayList ev1 = new ArrayList();
ArrayList ev2 =  new ArrayList();
ArrayList ev1_psm2 = new ArrayList();
ArrayList ev2_psm2 =  new ArrayList();
ArrayList evTitle = new ArrayList();
ArrayList sv =  new ArrayList();
ArrayList sem = new ArrayList();
ArrayList dept=new ArrayList();
ArrayList evId=new ArrayList();
ArrayList evName=new ArrayList();
ArrayList evDesc=new ArrayList();
String deptscheme[];
String delURL = "Images/del_24_2.jpg";
String editURL = "Images/edit_24_2.jpg";
String color ="#fff0f5";
int row = 0;
int index = 0;
int rowdeptscheme=0;

DB objDB = new DB(); 

if ((!(UserSession==null))&&(UserType.equals("3"))) {
     semester= Semester.getSemester();
     objDB.connect();
     objDB.query(querydept);
     int rowdept=objDB.getNumberOfRows();
     for(int i=0;i<rowdept;i++){
         dept.add(objDB.getDataAt(i, "deptName"));
     }
     objDB.query(query);
     row = objDB.getNumberOfRows();
     for(int i = 0;i<row;i++){
        ev1.add(objDB.getDataAt(i,"ev1"));
        ev2.add(objDB.getDataAt(i, "ev2"));
        evTitle.add(objDB.getDataAt(i, "ev_Title"));
        sv.add(objDB.getDataAt(i, "supervision"));
        sem.add(objDB.getDataAt(i,"semester"));
        ev1_psm2.add(objDB.getDataAt(i, "ev1_psm2"));
        ev2_psm2.add(objDB.getDataAt(i,"ev2_psm2"));
     }
     
     if(!(temp_i ==null))
         {
            index = Integer.parseInt(request.getParameter("index"));
            itemAdd = "addHide";
            btnAdd = "addHide";
            itemEdit ="addShow";
         }
     objDB.query(queryscheme);
     int rowscheme=objDB.getNumberOfRows();
     for(int i=0;i<rowscheme;i++){
          evId.add(objDB.getDataAt(i, "id"));
          evName.add(objDB.getDataAt(i, "ev_scheme"));
          evDesc.add(objDB.getDataAt(i, "ev_desc"));
     }
     
%>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css"> <link rel="stylesheet" type="text/css" href="style.css"> 
        <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
        <script type="text/javascript" src="js/AdQuotaLec.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Year Project Management System</title>
    </head>
    <style type="text/css">
    .addShow
    {
            display: ;
    }
    .addHide
    {
            display:none;
    }
    
    
   
    </style>
  
    <body>
                 
        <div id="Wrapper" style="padding-top:50px;">
         
         <%@ include file="headeradmin.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">

    
    <div style="height:auto" id="WrapperBody">
        

        <br><center>
            <form name="quotaLec">
                    <h2 style="font-weight:bold; color:#fcf5ca;">Quota of Lecturer</h2>
                       <center>
                           <table class="table table-bordered " style="background: white;">
                               
                               <tr bgcolor="#fcf5ca"  style="font-weight:bold ; color:#740f2d;" align="center"  >
                                   <td>Semester</td>
                                 <td>Supervision</td>
                                 
                                 <td >Chairman (PSM 1)</td>
                                 <td >Panel (PSM 1)</td>
                                 <td>Evaluator (Proposal)</td>
                                 <td >Chairman (PSM 2)</td>
                                 <td >Panel (PSM 2)</td>
                                 <%
                                 for(int i=0;i<rowdept;i++){
                                     %>
                                     <td  colspan="2"><%=dept.get(i)%></td>
                                   <%     
                                 }
                                 
                                 %>
                                 <td>Edit</td>
                                 <td>Delete</td>
                             </tr>
                             
                            
                             
                             <%  if(!(row==0)){
                                 for(int i=0;i<ev1.size();i++){
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
                             <tr>
                                 <td><%=sem.get(i)%></td>
                                 <td><%=sv.get(i)%></td>
                                
                                 <td><%=ev1.get(i)%></td>
                                 <td><%=ev2.get(i)%></td>
                                 <td><%=evTitle.get(i)%></td>
                                 <td><%=ev1_psm2.get(i)%></td>
                                 <td><%=ev2_psm2.get(i)%></td>
                                  <%
                                 for(int j=0;j<rowdept;j++){
                                     String tempString=String.valueOf(dept.get(j));
                                     tempString=tempString.replaceAll("\\s+", "");
                                     for(int k=0;k<2;k++){
                                         if(k==0){
                                             tempString+="_softDev";
                                         }else{
                                             tempString+="_research";
                                         }
                                         System.out.println(tempString);
                                     String querygetdata="select "+tempString+" from quota_lecturer where semester='"+String.valueOf(sem.get(i))+"' ";
                                     objDB.connect();
                                     objDB.query(querygetdata);
                                     %>
                                     <td><%
                                     if(String.valueOf(objDB.getDataAt(0, tempString)).equals("null")||String.valueOf(objDB.getDataAt(0, tempString)).equals("")){
                                         %>No result<%
                                     }else{
                                         %><%=String.valueOf(objDB.getDataAt(0, tempString))%><%
                                     }
                                     tempString=String.valueOf(dept.get(j));
                                     tempString=tempString.replaceAll("\\s+", "");
                                     }
                                     
                                 }
                                 
                                 %>
                                 <td align="center">
                                     <span onclick="save('edit','<%=i%>')" title="Edit" alt="Edit" ><i style="font-size:1.5em" class="glyphicon glyphicon-edit"></i></span>   
                                 </td>
                                 <td align="center">
                                     <span onclick="save('delete','<%=sem.get(i)%>')" title="Delete" alt="Delete" ><i style="font-size:1.5em" class="glyphicon glyphicon-remove"></i></span>
                                 </td>
                             </tr>
                             <% }
                                 }
                             else{
                             %>
                             <tr>
                                 <td colspan="6">There is no quota selected from data based.</td>
                             </tr>
                             <%}%>
                           </table>
                           
                           <table>
                             <tr align="center" id="btnAdd" class="<%=btnAdd%>">
                                 <td colspan="6"><span class="btn btn-success" onclick="showAdd()">Add Quota&nbsp;<i class="glyphicon glyphicon-plus-sign"></i></span></td>
                             </tr>
                         
                         
                         <tr id="itemAdd" class="<%=itemAdd%>">
                                
                             <td colspan="8">
                               <table class="table table-bordered" style="width:100% ;background:white;">
                                        <tr align="center" bgcolor="#fcf5ca">
                                            <td colspan="4"><b style="font-weight:bold; color:#740f2d;">Add Quota</td>
                                        </tr>
                                            <tr>
                                                <td>Semester</td>
                                                
                                                <td colspan="3"><%=semester%></td>
                                                
                                            </tr>
                                            
                                            <tr>
                                                <td>Supervision</td>
                                                
                                                <td colspan="3"><input class="form-control" type="text" name="svQuota" id="inputText" maxlength="2" ></td>
                                            </tr>

                                            <tr>
                                                <td>Chairman (PSM 1)</td>
                                                
                                                 <td colspan="3"><input class="form-control" type="text" name="ev1" id="inputText" maxlength="2"></td>
                                            </tr>

                                            <tr>
                                                <td>Panel (PSM 1)</td>
                                                
                                                <td colspan="3"><input class="form-control" type="text" name="ev2" id="inputText" maxlength="2"></td>
                                            </tr>
                                            
                                            <tr>
                                                <td>Evaluator (Proposal)</td>
                                                
                                                <td colspan="3"><input class="form-control" type="text" name="evTitle" id="inputText" maxlength="2"></td>
                                            </tr>
                                            <tr>
                                                <td>Chairman (PSM 2)</td>
                                                
                                                 <td colspan="3"><input class="form-control" type="text" name="ev1_psm2" id="inputText" maxlength="2"></td>
                                            </tr>

                                            <tr>
                                                <td>Panel (PSM 2)</td>>
                                                
                                                <td colspan="3"><input class="form-control" type="text" name="ev2_psm2" id="inputText" maxlength="2"></td>
                                            </tr>
                                            
                                            <%
                                 for(int i=0;i<rowdept;i++){
                                     String tempString=String.valueOf(dept.get(i));
                                     tempString= tempString.replaceAll("\\s+", "_");
                                     %>
                                     <tr>
                                                <td><%=dept.get(i)%></td>
                                                
                                                <td colspan="3"><select class="form-control"  name="<%=tempString%>" >
                                                    <option value="">Please Select</option>
                                                 <%
                                                    for(int j=0;j<rowscheme;j++){
                                                     %><option value="<%=evName.get(j)%>"><%=evName.get(j)%>(<%=evDesc.get(j)%>)</option><%
                                                     }
                                                     %>
                                                    </select>
                                                </td>
                                            </tr>
                                     
                                   <%     
                                 }
                                 
                                 %>
                                     </table>
                                                <table align="center">
                                                    <tr align="center"><td align="center" colspan="3">
                                                        <span class="btn btn-success" onclick="save('add','<%=semester%>')">&emsp;Save&emsp;</span>
                                                <span class="btn btn-warning" onclick=" hideAdd()">&emsp;Cancel&emsp;</span>
                                                        </td></tr>
                                                </table>
                                  </fieldset>
                            </td>
                         </tr>
                         
                         <tr id="itemEdit" class="<%=itemEdit%>">
                                
                             <td colspan="8">
                                <br>
                                <br>
                                 <table class="table table-bordered" style="width:100%">
                                        <tr align="center" bgcolor="#ebebeb">
                                            <td colspan="4"><b>Edit Quota</td>
                                        </tr>
                                            <tr>
                                                <td>Semester</td>
                                                
                                                <td colspan="3"><%=semester%></td>
                                                
                                            </tr>
                                            
                                            <tr>
                                                <td>Supervision</td>
                                                
                                                 <td colspan="3"><input class="form-control" type="text" name="editSvQuota" id="inputText" maxlength="2" <%if((temp_i==null)){%> value="0" <%} else{ %> value="<%=sv.get(index)%>"<%}%>></td>
                                            </tr>

                                            <tr>
                                                <td>Chairman (PSM 1)</td>
                                                
                                                 <td colspan="3"><input class="form-control" type="text" name="editEv1" id="inputText" maxlength="2" <%if((temp_i==null)){%> value="0" <%} else{ %> value="<%=ev1.get(index)%>"<%}%>></td>
                                            </tr>

                                            <tr>
                                                <td>Panel (PSM 1)</td>
                                                
                                                <td colspan="3"><input class="form-control" type="text" name="editEv2" id="inputText" maxlength="2" <%if((temp_i==null)){%> value="0" <%} else{ %> value="<%=ev2.get(index)%>"<%}%>></td>
                                            </tr>
                                            
                                            <tr>
                                                <td>Evaluator (Project title)</td>
                                                
                                                <td colspan="3"><input class="form-control" type="text" name="editEvTitle" id="inputText" maxlength="2" <%if((temp_i==null)){%> value="0" <%} else{ %> value="<%=evTitle.get(index)%>"<%}%>></td>
                                            </tr>
                                            
                                            <tr>
                                                <td>Chairman (PSM 2)</td>
                                                
                                                 <td colspan="3"><input class="form-control" type="text" name="editEv1_psm2" id="inputText" maxlength="2" <%if((temp_i==null)){%> value="0" <%} else{ %> value="<%=ev1_psm2.get(index)%>"<%}%>></td>
                                            </tr>

                                            <tr>
                                                <td>Panel (PSM 2)</td>
                                                
                                                <td colspan="3"><input class="form-control" type="text" name="editEv2_psm2" id="inputText" maxlength="2" <%if((temp_i==null)){%> value="0" <%} else{ %> value="<%=ev2_psm2.get(index)%>"<%}%>></td>
                                            </tr>
                                            </table>
                                                <table align="center">
                                                    <tr align="center"><td align="center" colspan="3">
                                                        <span class="btn btn-success" onclick="save('saveChanges','<%=semester%>')">&emsp;Save&emsp;</span>
                                                <span class="btn btn-warning" onclick=" hideAdd()">&emsp;Cancel&emsp;</span>
                                                        </td></tr>
                                                </table>
                                            
                                            <input type="hidden" name="semester" value="">
                                     </table>
                                  </fieldset>
                            </td>
                         </tr>
                        </table>
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
