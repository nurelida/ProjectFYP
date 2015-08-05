<%-- 
    Document   : AdViewLec
    Created on : Feb 3, 2009, 11:28:38 PM
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
 if ((!(UserSession==null))&&(UserType.equals("3"))) {
  
     String query="Select* from lecturer order by lectName";
     
     int row = 0;
     
     String temp="";
     String disabled ="";
     String detailURL="Images/User1.jpg";
     String delURL="Images/del_24_2.jpg";
     ArrayList lectName = new ArrayList();
     ArrayList staffNo = new ArrayList();
     ArrayList active = new ArrayList();
     
     
     
     String color ="#fff0f5";
     
     DB objDB = new DB();
     objDB.connect();
     objDB.query(query);
     row = objDB.getNumberOfRows();
     for(int i=0;i<row;i++)
         {
           lectName.add(objDB.getDataAt(i,"lectName"));
           staffNo.add(objDB.getDataAt(i,"staffNo"));
           active.add(objDB.getDataAt(i,"active"));
         }
     objDB.close();
     %>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/table.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css"> <link rel="stylesheet" type="text/css" href="style.css">    
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        
        <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
        <script type="text/javascript" src="js/AdView.js"></script>
        <script>
            $(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Year Project Management System</title>
    </head>
   <body>
     <div id="Wrapper" style="padding-top:50px;">
         <%@ include file="headeradmin.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">

         
    
   
    <div style="height:auto" id="WrapperBody">
        
        <center>
            <span>
               
                
				
                <div style="width:80%" class="panel panel-default">
					<div class="panel-heading" style="background: #FCF5CA;">
						<h2 style="font-weight:bold ; color:#740F2D;">List Of Lecturer</h2>
	 
  </div>
  <div class="panel-body alert-warning" style="background:white;">
      <a style="" class="btn btn-success" href="./ServMenu?Page=AdRegisterLec">&emsp;&emsp;&emsp;&emsp;Add&emsp;&emsp;&emsp;&emsp;</a>
      <br> <span>
                    <table class="table table-hover" id="expertise" style="padding-top:10px;width:100% ;background:white;">
                    <form>
                        <tr style="font-weight:bold" align="center">
                             <td  width="20px">No.</td>   
                             <td width="450px">Name</td>
                             <td width="100px">Status</td>
                             <td>Info</td>
                             <td  width="50px">Delete</td>
                        </tr>
                       
                         <% 
                            if(row > 0)
                                {   for(int i=0;i<row;i++)
                                   {
                                       
                                        if(color.equals("#ffe4e1"))
                                            {
                                               
                                                
                                                detailURL="Images/User2.jpg";
                                                delURL="Images/del_24_1.jpg";
                                            }
                                         else
                                            {  
                                                
                                                
                                                detailURL="Images/User1.jpg";
                                                delURL="Images/del_24_2.jpg";
                                                
                                            }
                                        
                           %>
                           <tr align="center" style="color:#000">
                           <td align="center"><%=i+1%></td>
                           <td><%=lectName.get(i)%></td>
                           <td>
                               <select name="lecAc" onchange="SA('<%=lectName.get(i)%>',this.value,'<%=staffNo.get(i)%>')">
                                   <option value="">Please Select</option>
                                   <option value="Active" <%if(active.get(i).equals("Active")){%> selected <%}%>>Active</option>
                                   <option value="Inactive" <%if(active.get(i).equals("Inactive")){%> selected <%}%>>Inactive</option>
                               </select>
                           </td>
                           <td><span  onclick="viewLec('<%=staffNo.get(i)%>')" data-toggle="tooltip" title="<%=lectName.get(i)%> Details" data-placement="right" ><i style="font-size: 2em" class="fa fa-user"></i></span></td>
                           <td align="center"><span onclick="deleteLec('<%=staffNo.get(i)%>','<%=lectName.get(i)%>')" data-toggle="tooltip" title="Delete <%=lectName.get(i)%> from database" data-placement="right" ><i style="font-size: 2em" class="fa fa-remove"></i></span></td>
                        </tr>
                            <%      }
                              }
                            else
                                {%>
                        <tr>
                            <td colspan="3">There is no data selected from data base</td>
                        </tr>
                        <%      }%>
                        <input type="hidden" name="staffNo" value="">
                        <input type="hidden" name="lecActive" value="">
                    
                     
                </form>     
                </table>
                         </div>
                </div>
                       
                        
                    
                    
           
 
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
