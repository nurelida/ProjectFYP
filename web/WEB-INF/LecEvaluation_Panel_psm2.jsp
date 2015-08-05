<%-- 
    Document   : LecEvaluation_Panel_psm2
    Created on : Apr 1, 2009, 3:55:15 PM
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
String metricNo = request.getParameter("metricNo");
String skop = "";
String metodologi = "";
String hasil = "";
String teknologi = "";
String komersial = "";
String total = null;
String komen = "";
String proTitle = "";
String studName = "";

float skop_m = -1;
float metodologi_m = -1;
float hasil_m = -1;
float teknologi_m = -1;
float komersial_m = -1;

String query ="select a.proTitle, b.studName, c.skop, c.metodologi, c.hasil, c.teknologi, c.komersial, c.total, c.komen "+
               "from title a "+
               "inner join student b on b.metricNo=a.metricNo "+
               "left outer join ev_penilaian_psm2 c on c.metricNo=a.metricNo "+
               " where a.metricNo='"+metricNo+"'";


 if ((!(UserSession==null))&&(UserType.equals("2"))) {
     DB objDB = new DB();
     objDB.connect();
     objDB.query(query);
     total = objDB.getDataAt(0, "total");
     studName = objDB.getDataAt(0,"studName");
     proTitle = objDB.getDataAt(0,"proTitle");
     if(!(total==null))
         {
             skop =objDB.getDataAt(0, "skop");
             skop_m = Float.parseFloat(skop)*10/6;
             metodologi = objDB.getDataAt(0, "metodologi");
             metodologi_m = Float.parseFloat(metodologi)*10/3;
             hasil = objDB.getDataAt(0, "hasil");
             hasil_m = Float.parseFloat(hasil)*10/8;
             teknologi = objDB.getDataAt(0, "teknologi");
             teknologi_m = Float.parseFloat(teknologi)*10/4;
             komersial = objDB.getDataAt(0, "komersial");
             komersial_m = Float.parseFloat(komersial)*10/4;
             komen = objDB.getDataAt(0, "komen");
         }
     
%>
<html>

    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <script type="text/javascript" src="js/LecEvaluation_Panel.js"></script>
        <title>Final Year Project Management System</title>
    </head>
    <style type="text/css">
    .editShow,
    .saveChangesShow{
            display: ;
    }
    .editHide,
    .saveChangesHide{
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
             <form>
                     <h2>Main Assessor(Panel) PSM 2 </h2>
                     <center>
                     <fieldset id="titleSuggestion">
                        <legend>Evaluation form</legend>
                        <center>
                            <table>
                                <tr>
                                    <td id="text" width="200px" >Name</td>
                                    <td id="colon">:</td>
                                    <td  align="left"><%=studName%></td>
                                </tr>
                                
                                <tr>
                                    <td id="text" width="200px" >Metric No.</td>
                                    <td id="colon">:</td>
                                    <td  align="left"><%=metricNo%></td>
                                    <input type="hidden" name="metricNo" value="<%=metricNo%>"></input>
                                </tr>
                                
                                <tr>
                                    <td id="text" width="200px" >Project title</td>
                                    <td id="colon">:</td>
                                    <td  align="left"><%=proTitle%></td>
                                </tr>
                                
                                <tr>
                                    <td id="text" width="200px" >Comment</td>
                                    <td id="colon">:</td>
                                    <td  align="left"><textarea cols="30" rows="10" id="inputText" name="comment" <%if(!(total==null)){%> readonly <%}%>><%if(!(total==null)){%> <%=komen%><%}%></textarea></td>
                                </tr>
                             </table>
                             
                             <table style="font-weight:bold">
                                 <tr>
                                     <td colspan="6">Skala Penilaian</td>
                                 </tr>
                                <tr>
                                    <td>Tidak Memuaskan</td>
                                    <td>0-2</td>

                                    <td>Kurang Memuaskan</td>
                                    <td>3-4</td>

                                    <td>Sederhana</td>
                                    <td>5-6</td>
                               </tr>
                               <tr>
                                    <td>Memuaskan</td>
                                    <td>7-8</td>

                                    <td>Sangat Memuaskan</td>
                                    <td>9-10</td>
                               </tr>
                            </table>
                     
                            <table style="text-align:left">
                                <tr bgcolor="#fa8072" style="font-weight:bold;text-align:center">
                                    <td width="10px">No.</td>
                                    <td width="300px">Item Penilaian</td>
                                    <td width="110px">Paras Penilaian</td>
                                    <td width="100px">Markah</td>
                                </tr>
                                <tr bgcolor="#fa8072" style="font-weight:bold;text-align:center">
                                    <td colspan="4">Hasil Projek (25%)</td>
                                </tr>
                                <tr bgcolor="#ffe4e1">
                                    <td>1.</td>
                                    <td>Memenuhi Skop(6%)</td>
                                    <td><select  name="skop" onchange="add_psm2_All()" <% if (!(total==null)){%> disabled <%}%>>
                                            <option value="">Please Select</option>
                                            <% for(int i=0;i<11;i++) {%>
                                            <option value="<%=i%>" <%if(i==skop_m){%> selected <%}%>><%=i%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    <td><input style="width:50px" type="text" name="skop_m" readonly value="<%=skop%>"></td>
                                </tr>
                                
                                <tr bgcolor="#ffb6c1">
                                    <td>2.</td>
                                    <td>Penggunaan teknik/ metodologi/ formula/ kaedah/ pendekatan yang sesuai(3%)</td>
                                    <td><select  name="metodologi" onchange="add_psm2_All()" <% if (!(total==null)){%> disabled <%}%>>
                                            <option value="">Please Select</option>
                                            <% for(int i=0;i<11;i++) {%>
                                            <option value="<%=i%>" <%if(i==metodologi_m){%> selected <%}%>><%=i%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                   <td><input style="width:50px" type="text" name="metodologi_m" readonly value="<%=metodologi%>"></td>
                                </tr>
                                
                                <tr bgcolor="#ffe4e1">
                                    <td>3.</td>
                                    <td>Hasil projek lengkap dan sempurna(8%)</td>
                                    <td><select  name="hasil" onchange="add_psm2_All()" <% if (!(total==null)){%> disabled <%}%>>
                                            <option value="">Please Select</option>
                                            <% for(int i=0;i<11;i++) {%>
                                            <option value="<%=i%>" <%if(i==hasil_m){%> selected <%}%>><%=i%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    <td><input style="width:50px" type="text" name="hasil_m" readonly value="<%=hasil%>"></td>
                                </tr>
                                
                                <tr bgcolor="#ffb6c1">
                                    <td>4.</td>
                                    <td>Penggunaan teknologi/ teknik terkini(4%)<%=teknologi_m%></td>
                                    <td><select  name="teknologi" onchange="add_psm2_All()" <% if (!(total==null)){%> disabled <%}%>>
                                            <option value="">Please Select</option>
                                            <% for(int i=0;i<11;i++) {%>
                                            <option value="<%=i%>" <%if(i==teknologi_m){%> selected <%}%>><%=i%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    <td><input style="width:50px" type="text" name="teknologi_m" readonly value="<%=teknologi%>"></td>
                                </tr>
                                
                                <tr bgcolor="#ffe4e1">
                                    <td>5.</td>
                                    <td>Berciri komersial(4%)</td>
                                    <td><select  name="komersial" onchange="add_psm2_All()" <%if (!(total==null)){%> disabled <%}%>>
                                            <option value="">Please Select</option>
                                            <% for(int i=0;i<11;i++) {%>
                                            <option value="<%=i%>" <%if(i==komersial_m){%> selected <%}%>><%=i%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    <td><input style="width:50px" type="text" name="komersial_m" readonly value="<%=komersial%>"></td>
                                </tr>

                                

                                <tr style="font-weight:bold">
                                    <td colspan="3" align="right">Total</td>
                                    <td><input style="width:50px" type="text" name="total" readonly <%if(!(total==null)){%> value="<%=total%>" <%}%> > &nbsp;/&nbsp;25 </td>
                                </tr>
                            </table>
                    
                    <%if((total==null)){%>
                    <div id="itemButton">
                       
                            <div class="button" onmouseover="this.className='buttonHover'" onmouseout="this.className='button'"onclick="savePSM2()">Submit</div>                       
                    </div>
                    <%} else {%>
                    <div id="itemEdit"class="editShow">
                        <div id="itemButton">
                             <div class="button" onmouseover="this.className='buttonHover'" onmouseout="this.className='button'"onclick="editPSM2()">Edit</div>                       
                        </div>
                    </div>
                    <div id="itemSaveChanges" class="saveChangesHide">
                        <div id="itemButton">
                             <div class="button" onmouseover="this.className='buttonHover'" onmouseout="this.className='button'"onclick="savePSM2('saveChanges')">Save Changes</div>                       
                        </div>
                    </div>
                    <%}%>  
                    <div style="float:right;">
                       
                            <div><img src="Images/Back.jpg" onclick="javascript:history.back();" alt="Back" title="Back"  border="0"></img></div>
                        
                    </div>
                    </center>
                    </fieldset>
                    </center>
                </form>   
        </div>
                
        <div id="Right">
         <!-- Login As -->
         <%@ include file="User.jsp" %>
         <br>
         <!--Main Menu-->
         <%@ include file="LecMainMenu.jsp" %>
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