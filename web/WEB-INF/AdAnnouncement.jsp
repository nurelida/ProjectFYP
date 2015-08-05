<%-- 
    Document   : AdAnnouncement
    Created on : Feb 6, 2009, 12:28:32 AM
    Author     : rou Test commit by elida
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
 if ((!(UserSession==null))&&(UserType.equals("3"))) {
  
     String query="Select* from announcement";
     
     ArrayList annTitle = new ArrayList();
     ArrayList annDesc = new ArrayList();
     ArrayList annShow = new ArrayList();
     ArrayList annID = new ArrayList();
     String temp = "";
     
     String color = "#fff0f5";
     
     String aTitle = "";
     String aDesc = "";
     String aShow = "";
     
     String imgDelete = "";
     String imgEdit = "";
    
     
     
     String aID = request.getParameter("aID");
     String editQuery = "select * from announcement where annID='"+aID+"'";
     
     DB objDB = new DB();
     objDB.connect();
     
     //Edit Announcement
      if(!(aID==null))
         {
            objDB.query(editQuery);
            aDesc = objDB.getDataAt(0,"annDesc");
            aTitle = objDB.getDataAt(0,"annTitle");
            aShow =  objDB.getDataAt(0,"annShow");
                
         }
     
    
    objDB.query(query);
     int row = objDB.getNumberOfRows();
    
     for(int i=0;i<objDB.getNumberOfRows();i++)
         {
            annTitle.add(objDB.getDataAt(i, "annTitle"));
            annDesc.add(objDB.getDataAt(i,"annDesc"));
            annID.add(objDB.getDataAt(i,"annID"));
            temp = objDB.getDataAt(i,"annShow");
            if(temp.equals("Y"))
                annShow.add("Yes");
            else
                annShow.add("No");
         }
     
     objDB.close();
    
%>
<html>

    <head>
        <link rel="stylesheet" type="text/css" href="css/table.css">
        <link rel="stylesheet" type="text/css" href="css/button.css"> 
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css"> <link rel="stylesheet" type="text/css" href="style.css"> 
        

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/dropdown.js"></script>
        <script type="text/javascript" src="js/AdAnnouncement.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Year Project Management System</title>
    </head>
    		
    <style type="text/css">
		.addAnnShow,
		.editAnnShow	{
			display: ;	
		}
		.addAnnHide,
		.editAnnHide	{
			display:none;
		}
    </style>
  
    <body>
        <div id="Wrapper" style="padding-top:50px;">
        	<%@ include file="headeradmin.jsp" %>
				<img src="Images/headerbg3.png" alt="" class="home-img">

    				<div style="height:auto" id="WrapperBody">
         				<center>
          					<h2>Announcement</h2>
                				<span>
                    				<table style="width:80%" class="table table-bordered table-hover">
										<form name="editExpertise">
											<tr bgcolor="#ebebeb" style="font-weight:bold" align="center">
												<td  width="550px">Announcement</td>
												<td  width="50px">Edit</td>
												<td  width="50px">Delete</td>
											</tr>
											<% String classExpertise = "addAnnShow";
												if(!(aID==null))
													classExpertise = "addAnnHide";
												if(row > 0)
													{   for(int i=0;i<annID.size();i++)
													   {
											%>
										   	<tr>
											   <td ><div style="font-weight:bold"><%=annTitle.get(i)%></div>
											   <br style="line-height:1px">
												<%=annDesc.get(i)%>
												<br style="line-height:1px">
												Show announcement:<%=annShow.get(i)%></td>
											   <td valign="top" align="center" ><span onclick="editAnnID(<%=annID.get(i)%>)"><i style="font-size:1.5em" class="glyphicon glyphicon-edit"></i></span></td>
											   <td valign="top" align="center" ><span  onclick="deleteAnnID(<%=annID.get(i)%>)"><i style="font-size:1.5em" class="glyphicon glyphicon-remove"></i></span></td>   
											</tr>
                            					<%      }
                            					}
                           						else
                                				{%>
                        					<tr>
                            					<td colspan="3">There is no data selected from data base</td>
                        					</tr>
                       						 <%      }%>
											<input type="hidden" name="annID" value="">
									</table>
											
									<table>
										<tr>
											<td colspan="3" align="center" id="btnAddAnn" class="<%=classExpertise%>"><span class="btn btn-success" onclick="showAddAnn()">&emsp;Add&nbsp;<i class="glyphicon glyphicon-plus"></i>&emsp;</span>
											</td>
										</tr>
                        			</table>
                            		<table>
                        				<tr>
                            				<td colspan="3" class="addAnnHide" id="itemAddAnn">
                                				<br style="line-height:5px">
                                				<br>                         
                                       				<table class="table table-bordered">
                                            			<tr bgcolor="#ebebeb" >
                                                		<td colspan="4" align="center"><b>Add Announcement</td>
                                            			</tr>
                                                 <tr>
                                                    <td>Title</td>
                                                   
                                                    <td colspan="3" align="left">
                                                        <input  class="form-control" type="text" name="addTitle" id="inputText"></input>
                                                    </td>
                                                 </tr>
                                                 
                                                 <tr>
                                                     <td>Description</td>
                                                    
                                                     <td colspan="3"><textarea class="form-control" col="90" rows="5" id="inputText" name="addDescription"></textarea></td>
                                                 </tr>
                                                 
                                                 <tr>
                                                     <td>Show announcement</td>
                                                    
                                                     <td colspan="3"><select class="form-control" name="annShow" id="inputText">
                                                                    <option value="">Please Select</option>
                                                                    <option value="Y">Show</option>
                                                                    <option value="N">Hide</option>
                                                                     </select></td>
                                                 </tr>
                                        </table>
                                <table align="center">
                                    <tr align="center">
                                        <td>&nbsp;</td>
                                                     <td align="center"><span class="btn btn-success" onclick="checkAddAnn()">&emsp;Submit&emsp;</span>
                                                     <span class="btn btn-warning" onclick="hideAddAnn()">&emsp;Cancel&emsp;</span></td>
                                                     </tr>
                                            </table>
                                   
                               
                            </td>
                        </tr>
                       
                        
                        <%
                       String editClass="editAnnHide";
                       if(!(aID==null))
                        {
                           
                           editClass="editAnnShow";
                       %>
                        <tr>
                            
                            <td colspan="3" class="<%=editClass%>" id="itemEditAnn">
                                <br style="line-height:5px">
                                <br>
                             
                                            <table class="table table-bordered">
                                                <tr bgcolor="#ebebeb">
                                                    <td colspan="4" align="center">
                                                        <b>Edit Announcement</b>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td>Title</td>
                                                   
                                                    <td colspan="3"><input class="form-control" id="inputText" name="editTitle" type="text" value="<%=aTitle%>"></input></td>
                                                            
                                                 </tr>
                                                 
                                                 <tr>
                                                     <td>Description</td>
                                                    
                                                     <td colspan="3"><textarea class="form-control" col="90" rows="5" id="inputText" name="editDescription"><%=aDesc%></textarea></td>
                                                 </tr>
                                                 
                                                  <tr>
                                                     <td>Show announcement</td>
                                                    
                                                     <td colspan="3"><select class="form-control" name="editShow" id="inputText">
                                                                    <option value="">Please Select</option>
                                                                    <option value="Y"  <%if(aShow.equals("Y")){%> selected<%}%>>Show</option>
                                                                    <option value="N" <%if(aShow.equals("N")){%> selected<%}%>>Hide</option>
                                                                     </select></td>
                                                 </tr>
                                            </table>
                                                                     <table align="center">
                                                 <tr align="center">
                                                     
                                                     <td align="center"><span class="btn btn-success" onclick="updateAnnID(<%=aID%>)">&emsp;Update&emsp;</span>
                                                     <span class="btn btn-warning" onclick="hideEditAnn()">&emsp;Cancel&emsp;</span></td>
                                                 </tr>
                                            </table>
                                    
                               
                            </td>
                        </tr>
                        <% 
                       }
                       %>
                </form>     
                </table>
     
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

