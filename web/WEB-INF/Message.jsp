<%-- 

    Document   : Message
    Created on : Jan 13, 2009, 12:18:29 AM
    Author     : rou
    This Page used in:
    Register
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        
        <link rel="stylesheet" type="text/css" href="css/registerFrm.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <script src="js/jquery.min.js"></script>
        

         <script src="js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Year Project Management System</title>
    </head>
<%
    String address ="./ServMessage?PageID=Home";
    String message =request.getParameter("Message");
    int time = 5500;
    if(message.equals("Profile"))
        {
            message="Congratulation, Your profile have been updated.";
            address="./ServMessage?PageID=StudentHome";
        }
    else if(message.equals("ProfileFailed"))
        {
            message="Sorry, You cannot update your profile now. Sorry for any inconvenient.";
             address="./ServMessage?PageID=StudentHome";
        }
    else if(message.equals("ChgPswFail"))
        {
            message="Sorry, You old password does not valid.<br> Please enter again.";
            address="./ServMessage?PageID=StudentHome";
        }
    
    else if(message.equals("LecProfile"))
        {
            message="Congratulation, Your profile have been updated.";
            address="./ServMessage?PageID=LecHome";
        }
    else if(message.equals("LecProfileFailed"))
        {
            message="Sorry, You cannot update your profile now. Sorry for any inconvenient.";
             address="./ServMessage?PageID=LecHome";
        }
    else if(message.equals("LecChgPswFail"))
        {
            message="Sorry, You old password does not valid.<br> Please enter again.";
            address="./ServMessage?PageID=LecHome";
        }
    else if(message.equals("StudTitleUpdate"))
        {
            message="Congratulation, Your project title have been updated.";
            address="./ServMessage?PageID=StudTitleSuggestion";
        }
    
    else if(message.equals("AdRegSuc"))
        {
            message="Congratulation, your lecturer registration was succesful.";
            address="./ServMessage?PageID=AdRegisterLec";
        }
    
    else if(message.equals("AdRegFail"))
        {
            message="Sorry, your lecturer registration was failed.";
            address="./ServMessage?PageID=AdRegisterLec";
        }
    else if(message.equals("InvalidQuota"))
        {
            message="Invalid Option";
            address="./ServMessage?PageID=AdQuotaLec";
        }
    else if(message.equals("QuotaFail"))
        {
            String sem = (String)request.getAttribute("semester");
            message="Sorry you only can edit the lecturer quota for semester: "+sem
                    +".<br>You cannot add the quota of lecturer twice for the semester."
                    +"<br> Unless you delete the record of semester:"+sem;
            address="./ServMessage?PageID=AdQuotaLec";
            time = 15000;
        }
    else if(message.equals("EVTitleFailed"))
        {
            message="Sorry, the quota of Evaluator was full. <br> Please select again.";
            address="./ServMessage?PageID=AdAsgEvT";
        }


%>    
  
    <body>
       
      
      <div id="Wrapper">
          <div id="BGTop">
        <div id="Top">
            <div id="TopContent">
 
            </div>
        </div>
              <div class="container"></div>
          </div>
         

    
    <div class="container">
    <div id="WrapperBody">
<div style="margin:auto">
    
    <center>
                            
                            <h3> 
                            <br><%=message%>
                            </h3>
                            <img src="Images/loading.gif"></img> 
                            
                            <br>
                            <a href="<%=address%>">Please Click Here to proceed if you are not redirect to the page.</a>
                            <script type="text/javascript"> 
                            function goRedirect(){
                              window.location.href ="<%=address%>";
                              }

                              setTimeout("goRedirect()", <%=time%>);
                           </script>
                           
                        
    </center>     
    
    
</div>

                
      
</div>
</div>
         <br><br><br>
         <%@ include file="Footer.jsp" %>
         
         
</div> 
         
     
    </body>
</html>

