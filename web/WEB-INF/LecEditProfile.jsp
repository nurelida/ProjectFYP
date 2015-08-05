<%-- 
    Document   : LecEditProfile
    Created on : Jan 18, 2009, 6:24:34 PM
    Author     : rou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="FYPManagementSys_Bean.DB" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
String UserSession = (String)session.getAttribute("user");
String UserType = (String)session.getAttribute("userType");
String Name = (String)session.getAttribute("name");

String query ="Select* from lecturer where staffNo='"+UserSession+"'";
String lectName="";
String userID="";
String email="";
String phoneNo="";
String roomNo="";
if ((!(UserSession==null))&&(UserType.equals("2"))) {
     DB objDB = new DB();
     objDB.connect();
     objDB.query(query);
     lectName = objDB.getDataAt(0,"lectName");
     userID = objDB.getDataAt(0,"staffNo");
     email = objDB.getDataAt(0,"emailAdd");
     phoneNo = objDB.getDataAt(0,"phoneNo");
     roomNo = objDB.getDataAt(0,"roomNo");
     objDB.close();
     %>
<html>

    <head>
        
        <link rel="stylesheet" type="text/css" href="css/registerFrm.css">
        <script type="text/javascript" src="js/register.js"></script>
        <script type="text/javascript" src="js/trim.js"></script>
        <script type="text/javascript" src="js/toUpper.js"></script>
        <script type="text/javascript" src="js/editProfile.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Year Project Management System</title>
    </head>
    <style type="text/css">
    .profileShow,
    .pswShow,
    .buttonShow,
    .btnUpdateShow,
    .btnChgShow{
            display:; 
    }

    .profileHide,
    .pswHide,
    .buttonHide,
    .btnUpdateHide,
    .btnChgHide{
            display:none;
    }
    
    
   
    </style>

     <body>
       <div id="Wrapper">
       <div id="Top">
            <div id="TopContent">
            </div>
       </div> 
       <div id="BodyContent">
          
                <center>
                <span>
                <form name="frm_lecProfile">
                <div class="profileShow" id="profileItem">
                    <table width="640px" style="font-family:Comic-Ms; font-size:15px" border="0">
                    <tr>
                        <td align="left" colspan="3"><h2>Profile</h2></td>
                    </tr>
                    <tr>
                        <td width="150px" align="right">Name</td>
                        <td width="1px">:</td>
                        <td width="180px"><input type="text" size="30" name="stud_name" id="nameValid" value="<%=lectName%>" readonly></input></td>    
                        <td style="padding-left:0px; float:left;" id="nameValidation" class="validation"></td>
                    </tr>
                    
                    <tr>
                        <td align="right">Staff Number</td>
                        <td width="1px">:</td>
                        <td><input type="text" size="30" name="matric_no"id="matricValid" value="<%=userID%>" readonly></input></td> 
                        <td style="padding-left:0px" id="matricValidation" class="validation"></td>
                    </tr>
                                                          
                    <tr>
                        <td align="right">Contact Number</td>
                        <td width="1px">:</td>
                        <td align="center" valign="top">
                            <input type="text" size="30" name="phone_no"id="PhoneNumValid" value="<%=phoneNo%>" readonly></input><br style="line-height:4px">
                            <span style="font-size:12px;color:red;text-transform:bold"><b>Eg:0124567890</b></span></br>
                        </td> 
                        <td style="padding-left:0px"id="PhoneNumValidation" class="validation"></td>
                    </tr>
                    
                    <tr>
                        <td align="right">Email Address</td>
                        <td width="1px">:</td>
                        <td align="center" valign="top">
                            <input type="text" size="30" name="email_add" id="emailValid" value="<%=email%>" readonly></input><br style="line-height:4px">
                            <span style="font-size:12px;color:red;"><b>Eg:abc@mail.com </b></span></br>
                        </td> 
                        <td style="padding-left:0px" align="center" id="emailValidation" class="validation"></td>
                    </tr>
                    
                    <tr>
                        <td align="right">Room Number</td>
                        <td width="1px">:</td>
                        <td align="center" valign="top">
                            <input type="text" size="30" name="roomNo" onblur="validateRoomNo()" id="roomNoValid" value="<%=roomNo%>" readonly></input><br style="line-height:4px">
                        </td> 
                        <td style="padding-left:0px" align="center" id="roomNoValidation" class="validation"></td>
                    </tr>
                </table>
                </div>
                
                <div class="pswHide" id="pswItem">
                    <table width="640px" style="font-family:Comic-Ms; font-size:15px" border="0">
                    
                    <tr>
                        <td align="left" colspan="3"><h2>Change Password</h2></td>
                    </tr>
                    <tr>
                        <td width="150px" align="right">Password</td>
                        <td width="1px">:</td>
                        <td width="180px"><input type="password" size="30" name="oldpsw" id="oldPswValid"></input></td> 
                        <td>&nbsp;</td>
                        
                    </tr>
                    <tr>
                        <td width="150px" align="right">New Password</td>
                        <td width="1px">:</td>
                        <td width="180px"><input type="password" size="30"onblur="validatePassword()" name="psw" id="pswValid"></input></td> 
                        <td style="padding-left:0px" class="validation" id="pswValidation">&nbsp;</td>
                        
                    </tr>
                    
                    <tr>
                        <td align="right">New Confirm Password</td>
                        <td width="1px">:</td>
                        <td><input type="password" size="30" onblur="passwordConfirmation()"name="psw_confirm" id="pswConfirm"></input></td>
                        <td style="padding-left:0px"id="pswConfirmation" class="validation">&nbsp;</td>
                    </tr>   
                </table>
                </div>
                
                <table style="font-family:Comic-Ms; font-size:15px" border="0">
                    <tr class="buttonShow" id="buttonItem">    
                        <td>
                            <div class="button"   onmouseover="this.className='buttonHover'" onmouseout="this.className='button'" onclick="lecEditProfile();">Edit Profile</div>
                        </td>
                        <td>
                            <div class="button" onmouseover="this.className='buttonHover'" onmouseout="this.className='button'"onclick="ShowPsw();">Change Password</div>
                        </td>
                    </tr>
                    
                    <tr class="btnUpdateHide" id="UpdateItem" > 
                        <td>
                            <div class="button" onmouseover="this.className='buttonHover'" onmouseout="this.className='button'"onclick="LecUpdateProfile();">Save Changes</div>
                        </td>    
                    </tr>
                     
                     <tr class="btnChgHide" id="ChgItem">
                        <td>
                             <div class="button" onmouseover="this.className='buttonHover'" onmouseout="this.className='button'"onclick="LecChgPsw();">Update Password</div>
                       </td>
                       <td>
                           <div class="button" onmouseover="this.className='buttonHover'" onmouseout="this.className='button'"onclick="BackToDefault()">Cancel</div>
                        </td>
                     </tr>
                </table>
                
                </form>
                </span>
                </center>       
        </div>
        
        <div id="Right">
         <!-- Login As -->
         <%@ include file="User.jsp" %>
         <br>       
        <!--Main Menu-->
         <%@ include file="LecMainMenu.jsp" %>
         <br>
         <!--Annoucement-->
         <%@ include file="Annoucement.jsp" %>
         <br>
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