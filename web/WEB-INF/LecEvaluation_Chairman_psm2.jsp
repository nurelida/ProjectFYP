<%-- 
    Document   : LecEvaluation_Chairman_psm2
    Created on : Mar 30, 2009, 6:10:29 PM
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
String peradaban = "";
String persiapan = "";
String ketepatan = "";
String kefahaman = "";
String keyakinan = "";
String soal_jawab = "";
String jumlah = "";
String comment = "";

float peradaban_m = -1;
float persiapan_m = -1;
float ketepatan_m =-1;
float kefahaman_m = -1;
float keyakinan_m = -1;
float soal_jawab_m = -1;
 if ((!(UserSession==null))&&(UserType.equals("2"))) {
     DB objDB = new DB();
     objDB.connect();
     objDB.query("select proTitle, b.studName, c.peradaban, c.persiapan,"+
                 " c.ketepatan, c.kefahaman, c.keyakinan, c.soal_jawab, c.jumlah, c.ev_comment "+
                "from title a "+
                "inner join student b on b.metricNo=a.metricNo "+
                "left outer join ev_pembentangan_psm2 c on c.metricNo=a.metricNo "+
                "where a.metricNo='"+metricNo+"'");
     String proTitle = objDB.getDataAt(0, "proTitle");
     String studName = objDB.getDataAt(0,"studName");
     jumlah = objDB.getDataAt(0,"jumlah");
     if(!(jumlah==null))
         {
            
            peradaban=objDB.getDataAt(0,"peradaban");
            peradaban_m = Float.parseFloat(peradaban)*10/1;
            persiapan=objDB.getDataAt(0,"persiapan");
            persiapan_m = Float.parseFloat(persiapan)*10/2;
            ketepatan=objDB.getDataAt(0,"ketepatan");
            ketepatan_m = Float.parseFloat(ketepatan)*10/3;
            kefahaman=objDB.getDataAt(0,"kefahaman");
            kefahaman_m = Float.parseFloat(kefahaman)*10/5;
            keyakinan=objDB.getDataAt(0,"keyakinan");
            keyakinan_m = Float.parseFloat(keyakinan)*10/2;
            soal_jawab=objDB.getDataAt(0,"soal_jawab");
            soal_jawab_m = Float.parseFloat(soal_jawab)*10/2;
            comment=objDB.getDataAt(0,"ev_comment");
         }
     
     
     objDB.close();
%>
<html>

    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <script type="text/javascript" src="js/LecEvaluation_Chairman.js"></script>
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
                <span>
                    <form>
                     <h2>Second Assessor(Chairman) PSM 2 </h2>
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
                                    <td  align="left"><textarea cols="30" rows="10" id="inputText" name="comment" <%if(!(jumlah==null)){%> readonly <%}%>><%if(!(jumlah==null)){%> <%=comment%><%}%></textarea></td>
                                </tr>
                             </table>
                             
                             <table style="font-weight:bold;text-align:left">
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
                     
                            <table>
                                <tr bgcolor="#fa8072" style="font-weight:bold">
                                    <td width="10px">No.</td>
                                    <td width="300px">Item Penilaian</td>
                                    <td width="110px">Paras Penilaian</td>
                                    <td width="100px">Markah</td>
                                </tr>
                                <tr bgcolor="#ffe4e1">
                                    <td>1.</td>
                                    <td>Peradaban persembahan(1%)</td>
                                    <td><select  name="peradaban" onchange="getAll()" <%if (!(jumlah==null)){%> disabled<%}%>>
                                            <option value="">Please Select</option>
                                            <% for(int i=0;i<11;i++) {%>
                                            <option value="<%=i%>" <%if(i==peradaban_m){%> selected<%}%>><%=i%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    
                                    <td><input style="width:50px" type="text" name="peradaban_m" readonly value="<%=peradaban%>"></td>
                                </tr>

                                <tr bgcolor="#ffb6c1">
                                    <td>2.</td>
                                    <td>Persiapan dan susunan pembentangan(2%)</td>
                                    <td><select name="persiapan" onchange="getAll()" <%if (!(jumlah==null)){%> disabled<%}%>>
                                            <option value="">Please Select</option>
                                            <% for(int i=0;i<11;i++) {%>
                                            <option value="<%=i%>" <%if(i==persiapan_m){%> selected<%}%>><%=i%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    <td><input style="width:50px" type="text" name="persiapan_m" readonly value="<%=persiapan%>"></td>
                                </tr>

                                <tr bgcolor="#ffe4e1">
                                    <td>3.</td>
                                    <td>Ketepatan dan kejelasan penyampaian(3%)</td>
                                    <td><select name="ketepatan" onchange="getAll()" <%if (!(jumlah==null)){%> disabled<%}%>>
                                        <option value="">Please Select</option>
                                            <% for(int i=0;i<11;i++) {%>
                                            <option value="<%=i%>" <%if(i==ketepatan_m){%> selected<%}%>><%=i%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    <td><input style="width:50px" type="text" name="ketepatan_m" readonly value="<%=ketepatan%>"></td>
                                </tr>

                                <tr bgcolor="#ffb6c1">
                                    <td>4.</td>
                                    <td>Kefahaman mengenai projek(5%)<%=kefahaman_m%></td>
                                    <td><select name="kefahaman" onchange="getAll()" <%if (!(jumlah==null)){%> disabled<%}%>>
                                            <option value="">Please Select</option>
                                            <% for(int i=0;i<11;i++) {%>
                                            <option value="<%=i%>" <%if(i==kefahaman_m){%> selected<%}%>><%=i%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    <td><input style="width:50px" type="text" name="kefahaman_m" readonly value="<%=kefahaman%>"></td>
                                </tr>

                                <tr bgcolor="#ffe4e1">
                                    <td>5.</td>
                                    <td>Keyakinan semasa penyampaian(2%)</td>
                                    <td><select name="keyakinan" onchange="getAll()" <%if (!(jumlah==null)){%> disabled<%}%>>
                                            <option value="">Please Select</option>
                                            <% for(int i=0;i<11;i++) {%>
                                            <option value="<%=i%>" <%if(i==keyakinan_m){%> selected<%}%>><%=i%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    <td><input style="width:50px" type="text" name="keyakinan_m" readonly value="<%=keyakinan%>"></td>
                                </tr>

                                <tr bgcolor="#ffb6c1">
                                    <td>6.</td>
                                    <td>Pengendalian soal jawab(2%)</td>
                                    <td><select name="soalJawab" onchange="getAll()" <%if (!(jumlah==null)){%> disabled<%}%>>
                                            <option value="">Please Select</option>
                                            <% for(int i=0;i<11;i++) {%>
                                            <option value="<%=i%>" <%if(i==soal_jawab_m){%> selected<%}%>><%=i%></option>
                                            <%}%>
                                        </select>
                                    </td>
                                    <td><input style="width:50px" type="text" name="soalJawab_m" readonly value="<%=soal_jawab%>"></td>
                                </tr>

                                <tr style="font-weight:bold">
                                    <td colspan="3" align="right">Total</td>
                                    <td><input style="width:50px" type="text" name="total" readonly <%if(!(jumlah==null)){%> value="<%=jumlah%>" <%}%> > &nbsp;/&nbsp;15 </td>
                                </tr>
                            </table>
                    
                    <%if((jumlah==null)){%>
                    <div id="itemButton">
                       
                            <div class="button" onmouseover="this.className='buttonHover'" onmouseout="this.className='button'"onclick="save('psm2')">Submit</div>                       
                    </div>
                    <%} else {%>
                    <div id="itemEdit"class="editShow">
                        <div id="itemButton">
                             <div class="button" onmouseover="this.className='buttonHover'" onmouseout="this.className='button'"onclick="edit()">Edit</div>                       
                        </div>
                    </div>
                    <div id="itemSaveChanges" class="saveChangesHide">
                        <div id="itemButton">
                             <div class="button" onmouseover="this.className='buttonHover'" onmouseout="this.className='button'"onclick="save('psm2_Edit')">Save Changes</div>                       
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
                </span>
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