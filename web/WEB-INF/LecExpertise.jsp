<%-- 
    Document   : LecExpertise
    Created on : Jan 19, 2009, 6:42:46 PM
    Author     : rou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");

 if ((!(UserSession==null))&&(UserType.equals("2"))) {
  
     String query="Select* from expertisefield where staffNo='"+UserSession+"'";
     String queryProfile ="Select* from lecturer where staffNo='"+UserSession+"'";
     
     ArrayList expertised = new ArrayList();
     ArrayList description = new ArrayList();
     ArrayList expertisedId = new ArrayList();
     
     String lectNameProfile="";
    String userIDProfile="";
    String emailProfile="";
    String phoneNoProfile="";
    String roomNoProfile="";
     
     String editProField = "";
     String editDescription = "";
     String tempProField = "";
    
     String proField="";
     
     String color ="white";
     
     String imgDelete ="";
     String imgEdit ="";
     
     String editID = request.getParameter("editID");
     String editQuery = "select * from expertisefield where expertised_ID='"+editID+"'";
     
     DB objDB = new DB();
     objDB.connect();
     objDB.query(queryProfile);
     lectNameProfile = objDB.getDataAt(0,"lectName");
     userIDProfile = objDB.getDataAt(0,"staffNo");
     emailProfile = objDB.getDataAt(0,"emailAdd");
     phoneNoProfile = objDB.getDataAt(0,"phoneNo");
     roomNoProfile = objDB.getDataAt(0,"roomNo");
     
     //Edit Expertised
      if(!(editID==null))
         {
            objDB.query(editQuery);
            tempProField = objDB.getDataAt(0,"expertised");
            editDescription = objDB.getDataAt(0,"description");
            if(tempProField.equals("SED01"))
                {
                    editProField="Software Engineering";
                }
            else if(tempProField.equals("SED02"))
                {
                    editProField="Computational Intelligent";
                }
            else if(tempProField.equals("SED03"))
                {
                    editProField="Expert System";
                }
            else if(tempProField.equals("SED04"))
                {
                    editProField="Agent Based Project";
                }
            else if(tempProField.equals("SED05"))
                {
                    editProField="Mobile Application";
                }
            
         }
     
    
     objDB.query(query);
     int row = objDB.getNumberOfRows();
    //Select all expertised from data base.
     for(int i=0;i<objDB.getNumberOfRows();i++)
         {
            expertised.add(objDB.getDataAt(i, "expertised"));
            description.add(objDB.getDataAt(i,"description"));
            expertisedId.add(objDB.getDataAt(i,"expertised_ID"));
         }
     
     objDB.close();
    
%>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/table.css">
        <link rel="stylesheet" type="text/css" href="css/button.css"> 
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="style.css">
        <script src="js/jquery.min.js"></script>
        

         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
         <script src="js/profile-pass.js"></script>
         <script src="js/updateProfile.js"></script>
        <script type="text/javascript" src="js/LecExpertise.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Year Project Management System</title>
    </head>
    
 
    <body>
       
      
      <div id="Wrapper" style="padding-top:50px;">
         <%@ include file="headerlecture.jsp" %>

			 <img src="Images/headerbg3.png" alt="" class="home-img">
    
    <div style="height:auto" id="WrapperBody">
        <br>

      <br>
      
        <table style="margin:auto;width:70%;" border="1"id="expertise" class="table table-bordered ">
                    <form name="editExpertise">
						<tr style="background: #FCF5CA;font-weight:bold;color:#740F2D" align="center">
                            <td  width="550px">Expertise Field</td>
                           
                             <td width="50">Edit</td>
                             <td width="50">Delete</td>
                            
                        </tr>
                       
                         <% String classExpertise = "show";
                            if(!(editID==null))
                                {classExpertise = "hide";}
                            if(row > 0)
                                {   for(int i=0;i<expertised.size();i++)
                                   {
                                        
                                       
                                        if(expertised.get(i).equals("SED01"))
                                            {
                                                proField="Software Engineering";
                                            }
                                        else if(expertised.get(i).equals("SED02"))
                                            {
                                                proField="Computational Intelligent";
                                            }
                                        else if(expertised.get(i).equals("SED03"))
                                            {
                                                proField="Expert System";
                                            }
                                        else if(expertised.get(i).equals("SED04"))
                                            {
                                                proField="Agent Based Project";
                                            }
                                        else if(expertised.get(i).equals("SED05"))
                                            {
                                                proField="Mobile Application";
                                            }
                                        
                           %>
							 <tr style="background:white; border: 1px solid grey; color:#740f2d">
                           <td><div style="font-weight:bold; "><%=proField%></div><br style="line-height:1px">
                            <%=description.get(i)%></td>
                           <td valign="top" align="center"><a style="color:#740f2d" href="javascript:;" onclick="editExpertiseID('<%=expertisedId.get(i)%>');"><i style="font-size:1.5em;padding-top: 10px" class="glyphicon glyphicon-edit"></i></a></td>
                            <td valign="top" align="center"><a style="color:#740f2d" href="javascript:;" onclick="deleteExpertiseID('<%=expertisedId.get(i)%>');"><i style="font-size:1.5em;padding-top:  10px" class="glyphicon glyphicon-floppy-remove"></i></a></td>
                            
                                
                        </tr>
                            <%      }
                              }
                            else
                                {%>
                        <tr style="background:white;">
                            <td colspan="3">There is no data selected from data base</td>
                        </tr>
                        <%      }%>
        </table>
        <br>
        <center><div id="btnaddexp" class="<%=classExpertise%>"><a class="btn btn-primary" href="javascript:;" onclick="showAddExpertise();">Add Expertise Field</a></div></center>
        <table style="margin:auto">
                        <input type="hidden" name="expertiseID" value="">
              
                       
                      
                        <tr id="addexp" class="hide">
                            <td colspan="3"  id="itemAddExpertise">
                                <br style="line-height:5px">
                                <br>
                                    <fieldset id="titleSuggestion">
										<legend style="color:#FCF5CA">Add Expertised Field</legend>
                                            <table style="background:white;">
                                                 <tr>
                                                    <td class="desc-text">Expertise Field</td>
                                                    <td id="colon">:</td>
                                                    <td colspan="2" align="left">
                                                        <select class="form-control" name="addProField" id="inputText" >
                                                            <option value="">Please Select</option>
                                                            <option value="SED01">Software Engineering</option>
                                                            <option value="SED02">Computational Intelligent</option>
                                                            <option value="SED03">Expert System</option>
                                                            <option value="SED04">Agent Based Project</option>
                                                            <option value="SED05">Mobile Application Based Project</option>
                                                            </select>
                                                     </td>
                                                 </tr>
                                                 
                                                 <tr>
                                                     <td class="desc-text">Decription</td>
                                                     <td id="colon">:</td>
                                                     <td colspan="2"><textarea class="form-control" col="110" rows="5" id="inputText" name="addDescription"></textarea></td>
                                                 </tr>
                                                 <tr><td><br></td></tr>
                                                 <tr>
                                               <td>&nbsp;</td>
                                                     <td>&nbsp;</td>
                                                     <td >&emsp;<div style="padding-left:110px"></div>&emsp;&emsp;&emsp;<div class="btn btn-success" onclick="checkAddExpertise()">Submit&nbsp;<i class="glyphicon glyphicon-save"></i></div>&emsp;
                                                     <div class="btn btn-warning" onclick="hideAddExpertise()">Cancel&nbsp;<i class="glyphicon glyphicon-backward"></i></div></td>
                                                 </tr>
                                            </table>
                                    </fieldset>
                               
                            </td>
                        </tr>
                       
                        
                        <%
                       String editClass="hide";
                       if(!(editID==null))
                        {
                           
                           editClass="show";
                       %>
                        <tr id="editexp" class="<%=editClass%>">
                            
                            <td colspan="3" class="<%=editClass%>" id="itemEditExpertise">
                                <br style="line-height:5px">
                                <br>
                                    <fieldset id="titleSuggestion">
                                        <legend style="font-weight:bold; color:#fcf5ca;">Edit Expertised Field</legend>
                                            <table>
                                                 <tr>
                                                    <td class="desc-text">Expertise Field</td>
                                                    <td id="colon">:</td>
                                                    <td><%=editProField%></td>
                                                            
                                                 </tr>
                                                 
                                                 <tr>
                                                     <td class="desc-text">Decription</td>
                                                     <td id="colon">:</td>
                                                     
                                                     <td colspan="2"><textarea  class="form-control" col="110" rows="5" id="inputText" name="editDescription"><%=editDescription%></textarea></td>
                                                 </tr>
                                                 <tr><td><br></td></tr>
                                                 <tr>
                                                     <td>&nbsp;</td>
                                                     <td>&nbsp;</td>
                                                     <td><div class="button" onmouseover="this.className='buttonHover'" onmouseout="this.className='button'"onclick="updateExpertiseID(<%=editID%>)">Update</div></td>
                                                     <td><div class="button" onmouseover="this.className='buttonHover'" onmouseout="this.className='button'"onclick="hideEditExpertise()">Cancel</div></td>
                                                 </tr>
                                            </table>
                                    </fieldset>
                               
                            </td>
                        </tr>
                        <% 
                       }
                       %>
                </form>     
                </table>
  
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
