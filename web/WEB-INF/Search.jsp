<%-- 
    Document   : Search
    Created on : Feb 8, 2009, 3:05:58 PM
    Author     : rou
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="java.util.*"%>
<%@ page import="java.util.List"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");

String color = "#fff0f5";
ArrayList studNameSearch = (ArrayList)request.getAttribute("studName");
ArrayList metricNoSearch = (ArrayList)request.getAttribute("metricNo");
ArrayList svNameSearch = (ArrayList)request.getAttribute("svName");
ArrayList proTitleSearch = (ArrayList)request.getAttribute("proTitle");
ArrayList semesterSearch = (ArrayList)request.getAttribute("semester");



String k =  "";
String c = "";

int row =0;

if(!(studNameSearch==null))
    {
        row = studNameSearch.size();
         k = (String)request.getAttribute("key");
         c = (String)request.getAttribute("categories");
    }

 if ((!(UserSession==null))) {
 String queryprofile ="Select* from student where metricNo='"+UserSession+"'";
 String studName="";
String studuserID="";
String studicNo="";
String studemail="";
String studphoneNo="";
DB objDB = new DB();
     objDB.connect();
     objDB.query(queryprofile);
    studName = objDB.getDataAt(0,"studName");
     studuserID = objDB.getDataAt(0,"metricNo");
    studicNo = objDB.getDataAt(0,"icNo");
    studemail = objDB.getDataAt(0,"emailAdd");
    studphoneNo = objDB.getDataAt(0,"phoneNo");
    objDB.close();
      
      
%>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <script type="text/javascript" src="js/Search.js"></script>
        <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
         <script src="js/profile-pass.js"></script>
         <script src="js/updateProfile.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Year Project Management System</title>
    </head>
    <style type="text/css">
    .mouseHover{
            color:#FF0000; 
            text-decoration: underline;
            cursor:default;
    }
    .mouseOut{
            
            text-decoration: none;
            cursor:default;
    }
    
 </style>
    
    <script type="text/javascript">
        function validateSubmit(){
            return false;
        }
    document.forms[0].onSubmit = validateSubmit;
    </script>
  
    <body>
     
      
      <div id="Wrapper" style="padding-top:50px;">
         <%@ include file="headerstudent.jsp" %>
			 <img src="Images/headerbg3.png" alt="" class="home-img">

   
    <div style="height:auto" id="WrapperBody">

        <br><br>
<!--            <h2 class="text-capitalize">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;project search</h2>-->
            <div style="width:700px;margin:auto;" class="panel panel-default">
  <div class="panel-heading" style="background-color:whitesmoke">
      <h3  class="panel-title"><b>Project Search Form</b></h3>
  </div>
  <div class="panel-body alert-warning">
            <form name="search">
                    <table style="float:left;padding-left: 50px" id="expertise">
                    
                           <tr style="font-weight:bold;">
                                <td>&emsp;&emsp;&emsp;&emsp;&emsp;Categories</td>
                                <td id="colon"></td>
                                <td>
                                    <select class="form-control" name="categories" id="inputText">
                                <option value="">Please Select</option>
                                <option value="title" <%if(c.equals("title")){%> selected<%}%>><b>Project Title</b></option>
                                <option value="author"<%if(c.equals("author")){%>selected<%}%>>Author</option>
                                <option value="sv" <%if(c.equals("sv")){%> selected <%}%>>Project supervisor</option>
                                <option value="semester" <%if(c.equals("semester")){%> selected <%}%>>Semester</option>
                                </select>
                             </td>
                              <td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
                                
                            </tr>
                            <tr><td><br></td></tr>

                            <tr style="font-weight:bold">
                                <td>&emsp;&emsp;&emsp;&emsp;&emsp;Keywords</td>
                                <td id="colon"></td>
                                <td>
                                    <div id="search-group" class="form-group">
                                        <div class="col-xs-1 input-group"><input type="text" style="border-right:0" class="form-control" id="inputText" name="keywords" value="<%=k%>"></input><input type="text"name="test" style="display:none;"> <div style="background-color:#fff;border-left-color: #fff" class="input-group-addon"><a href="javascript:search();" ><i style="color:red" class="glyphicon glyphicon-search"></i></a></div></div></div></td>
                                
                            </tr>
                            <input type="hidden" name="annID" value="">
                        
                          
                        </table>
  </div>
            </div>      <center>

                                <br><br><br>
                        <%if(!(studNameSearch==null)){%>
                        <table  style="width:1000px" class="table table-bordered table-hover alert-warning" >
                        <tr style="font-weight:bold;color:#000" align="center">
                                <td bgcolor="whitesmoke" width="20px">No.</td>
                                <td bgcolor="whitesmoke" width="250px">Student Name</td>
                                <td bgcolor="whitesmoke" width="200px">Project Title</td>
                                <td bgcolor="whitesmoke" width="250px">Supervisor</td>
                                <td bgcolor="whitesmoke" width="50px">Semester</td>
                        </tr>
                           
<% 
                                if(!(studNameSearch.size()==0)){
                                    for(int i=0;i<row;i++)
                                    {
                                         
                              %>
                            <tr>
                                <td><%=i+1%></td>
                                <td style="color:#000;font-weight: bold"><div onclick=""><%=studNameSearch.get(i)%></div></td>
                                <td><a style="color:#FF0000" href="javascript:;" onclick="viewTitle('<%=metricNoSearch.get(i)%>');"><%=proTitleSearch.get(i)%></a></td>    
                                <td><div onclick=""><%=svNameSearch.get(i)%></div></td>
                                <td><%=semesterSearch.get(i)%></td>

                            </tr>
                            <%      }
                                }else{%>
                        <tr>
                            <td colspan="5">No result found!!!</td>
                        </tr>
                        <% }
                        }%>
                        
                        <input type="hidden" name="metricNo" value="">
                        </table>
                 </form>
    <br><br><br>
                 
                     </center>
<div id="BodyContentStudent">
    <span>

                </span>
    
    
</div>
                               
                
        <div id="Left">
            <!-- Login As -->
       
         <br>
         <!--Main Menu-->
         
         
         </div>
                        <br><br><br>
</div>

        
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


