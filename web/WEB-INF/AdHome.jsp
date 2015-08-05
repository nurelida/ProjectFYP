<%-- 
    Document   : AdHome
    Created on : Feb 3, 2009, 10:21:07 PM
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
     /* String query="Select * from announcement "+
               "where annShow='Y' order by annID desc";*/
     ArrayList annTitle = new ArrayList();
     ArrayList annDesc = new ArrayList();
     
     String color = "#fff0f5";
     
     String query="Select * from announcement "+
               "where annShow='Y' order by annID desc";
     DB objDB = new DB();
     objDB.connect();
     objDB.query(query);
     int row = objDB.getNumberOfRows();
    
     for(int i=0;i<objDB.getNumberOfRows();i++)
         {
            annTitle.add(objDB.getDataAt(i, "annTitle"));
            annDesc.add(objDB.getDataAt(i,"annDesc"));
         }
     
     objDB.close();
     
     
%>
<html>
     <head>
        
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css">
        <style>
A { text-decoration:none;}
A:link { color: blue }
A:visited { color: blue }
A:hover { color: red }
 .tabmsg { font-size:12px; text-align:center; font-family: "Arial", "Helvetica", sans-serif; color:navy;}
 .stileupdn {font-weight:bold; font-size:8px; font-family: "Arial", "Helvetica, sans-serif"; text-align:center; color:blue;}
 .stileret {font-size:8px; font-family: "Arial", "Helvetica", sans-serif;}


</style>
        <script src="js/jquery.min.js"></script>
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
         <script language="javascript"> 

   
var msgnr=0;
if(msgnr==1){
var retclass='class="stileret"';
}

var celcen=1;

var udopt=1;

var mwidth=635; 

var mheight=250; 

//BACKGROUND: either color(1) or image(2, see below) ;
//1.Background color: could be like: "#ffff00" or "yellow";
//set it "" for no background color;
var mcolor="" ;

//or 2.Background image: "imagename.ext";
//leave it "" for no image background;
var mbground="Images/5.png";

//BORDER for scrolling area: 1, ... ;
//set it 0(zero) for no border;
var mborder=1;

//SPEED in pixels: the higher the faster - set your own!
var mspeed=1; 

//PAUSE between messages in milliseconds: 1000=1s; set to your own; 
var mpause = 2000; 

//Live speed-change option: 0 (not desired) or 1 (desired);
//"stileupdn" would be the STYLE (CSS), see STEP I above;
//celcolor would set background color
var lsopt = 0;
if(lsopt==1){
var vesclass='class="stileupdn"';
var celcolor='#ccffcc';
}


var rcopt=0;
if(rcopt==1){
var cbtxt = new Array();
//MUST BE as many TEXTs as the number of Messages/Images;
//Set your own TEXTs, like Messages Title or what you have in there: 
//cbtxt = ["1-TITLE", "2-Features", "3-Recall Option", "4-Other Possibilities", "5-Check"];
cbtxt=[];
}


var slmg=new Array();
<% for(int i=0;i<annTitle.size();i++){
    %>slmg[<%=i%>]='<h4><font color="red"><b><%=annTitle.get(i)%></b></font></h4>'+
'<br /><h5><%=annDesc.get(i)%></h5>';<%
}
%>


</script> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Year Project Management System</title>
 
    </head>
    
  
    <body onload="vsscrollstart();">
               
      
      <div id="Wrapper" style="padding-top:50px;">
         <%@ include file="headeradmin.jsp" %>
            
             <img src="Images/headerbg3.png" alt="" class="home-img">
         
    
  
    <div  id="WrapperBody">
        <br>

        <br><center>
            <script type="text/javascript" src="js/myvsbody.js"></script>
                
                    
           
      
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