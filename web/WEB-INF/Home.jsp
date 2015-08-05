<%@ page import="FYPManagementSys_Bean.DB" %>
<%@ page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%
     String query="Select* from news ORDER BY newsID DESC LIMIT 3";
     ArrayList deptCode = new ArrayList();
     ArrayList deptName= new ArrayList();
     ArrayList newsTitle = new ArrayList();
     ArrayList newsContent = new ArrayList();
     ArrayList newsID = new ArrayList();
     String temp = "";
     
     String color = "#fff0f5";
     
     String aTitle = "";
     String aDesc = "";
     String aShow = "";
         
     DB objDB = new DB();
     objDB.connect();
     
    objDB.query(query);
     int row = objDB.getNumberOfRows();
    int count=0;
     for(int i=0;i<objDB.getNumberOfRows();i++)
         {
            newsTitle.add(objDB.getDataAt(i, "newsTitle"));
            newsContent.add(objDB.getDataAt(i,"newsContent"));
            newsID.add(objDB.getDataAt(i,"newsID"));
            count++;
           
         }
     
     query="select * from department";
     objDB.query(query);
     int rowD=objDB.getNumberOfRows();
     for(int i=0;i<rowD;i++)
         {
            deptCode.add(objDB.getDataAt(i, "deptCode"));
            deptName.add(objDB.getDataAt(i,"deptName"));
            
           
         }
     
    
     objDB.close();
    
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="style.css">
        
        <script src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/toUpper.js"></script>
        <script type="text/javascript" src="js/Login.js"></script>
        <script type="text/javascript" src="js/register.js"></script>
        <script type="text/javascript" src="js/trim.js"></script>
        <script type="text/javascript" src="js/toUpper.js"></script>
        
        <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
        
         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
         <script src="js/login-register.js" type="text/javascript"></script>
         <script src="js/ValidatorReg.js" type="text/javascript"></script>
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Final Year Project Management System</title>
        <script type="text/javascript" src="js/Login.js"></script>
    </head>
    
  
    <body onkeypress="CheckNumericKeyInfo(event.keyCode, event.which);">
       
           
           <div id="Wrapper">
            <%@ include file="headerguest.jsp" %>
            <div id="BGBody">
<!--                <div class="container">-->
                <img src="Images/headerbg3.png" alt="" class="home-img">
                    <div id="WrapperBody" >
                       <div class="container">
                           <div id="BodyContent">
                            <span>
                                <div id="slide" class="carousel slide" data-ride="carousel" data-interval="3000">
  <!-- Indicators -->
                                  <ol class="carousel-indicators">
                                    <% for(int i=0;i<count;i++){
                                        if(i==0){
                                            %><li data-target="#slide" data-slide-to="<%=i%>" class="active"></li><%}
                                        else{
                                            %><li data-target="#slide" data-slide-to="<%=i%>"></li><%
                                        } 
                                    }%>    
                                  </ol>
                                  <div class="carousel-inner" role="listbox">
                                     <% if(row>0){
                                         for(int i=0;i<newsID.size();i++){
                                             if(i==0){
                %><div class="item active"><a>
                        <img style="border-radius: 5px; width:100%; max-width:100%;" src="news/<%=newsTitle.get(i)%>.jpg"  alt="<%=newsTitle.get(i)%>"></a>
      <div class="carousel-caption">
        <h3><%=newsContent.get(i)%></h3>
      </div>
    </div><%    
          }else{%>
                <div class="item">
                    <img style="border-radius: 5px; width:100%; max-width:100%;" src="news/<%=newsTitle.get(i)%>.jpg"  alt="<%=newsTitle.get(i)%>">
      <div class="carousel-caption">
        <h3><%=newsContent.get(i)%></h3>
      </div>
    </div><%
                
            }
          
      }}%>
   
   
  </div>

   
  <a class="left carousel-control" href="#slide" role="button" data-slide="prev">
    <b class="glyphicon glyphicon-chevron-left" aria-hidden="true"></b>
    
  </a>
  <a class="right carousel-control" href="#slide" role="button" data-slide="next">
    <b class="glyphicon glyphicon-chevron-right" aria-hidden="true"></b>
    
  </a>
</div>
</span>
        </div>
                                <div id="Right" class="visible-lg">
                                    <a class="twitter-timeline" height="350" data-chrome="noscrollbar" href="https://twitter.com/utm_my" data-widget-id="554828794347790337">Tweets by @utm_my</a>



         <!--Main Menu-->
        
         <br>
         <!--Login-->
         
        
        
         <br>
         </div>
                                         </div>
</div>
<!--</div>-->
</div> 
         
         
         <%@ include file="Footer.jsp" %>
        
     	

    
      </div>
         
     
    </body>
    	
		
</html>
