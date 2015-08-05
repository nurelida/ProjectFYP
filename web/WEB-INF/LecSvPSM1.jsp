 <%-- 
    Document   : LecSvEvaluate
    Created on : Mar 31, 2009, 8:55:43 PM
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
String metricNo = request.getParameter("metric");
String proTitle = "";
String gantt = "";
String kebolehan = "";
String daya = "";
String kekerapan = "";
String peningkatan = "";
String keberkesanan = "";
String peranan = "";
String formet = "";
String abstrak = "";
String objektif = "";
String analisis = "";
String kajian = "";
String metodologi = "";
String kesimpulan = "";
String rujukan = "";
String lampiran = "";
String persembahan = "";
String ayat = "";
String gambarajah = "";
String total = "";
String comment = null;
String studName="";
String lectNameProfile="";
String userIDProfile="";
String emailProfile="";
String phoneNoProfile="";
String roomNoProfile="";

float gantt_m = -1;
float kebolehan_m = -1;
float daya_m = -1;
float kekerapan_m = -1;
float peningkatan_m = -1;
float keberkesanan_m = -1;
float peranan_m = -1;
float formet_m = -1;
float abstrak_m = -1;
float objektif_m = -1;
float analisis_m = -1;
float kajian_m = -1;
float metodologi_m = -1;
float kesimpulan_m = -1;
float rujukan_m = -1;
float lampiran_m = -1;
float persembahan_m = -1;
float ayat_m = -1;
float gambarajah_m = -1;

String query = "select a.proTitle, b.gantt, b.kebolehan, b.daya, b.kekerapan, b.peningkatan, b.keberkesanan, b.peranan, "+
                "b.formet, b.abstrak, b.objektif, b.analisis, b.kajian, b.metodologi, b.kesimpulan, b.rujukan, b.lampiran, "+
                "b.persembahan, b.ayat, b.gambarajah, b.total, b.komen, c.studName "+
                "from title a "+
                "inner join student c on c.metricNo=a.metricNo "+
                "left outer join supervision_marks_psm1 b on a.metricNo=b.metricNo "+
                "where a.metricNo='"+metricNo+"'";
String queryProfile ="Select* from lecturer where staffNo='"+UserSession+"'";

 if ((!(UserSession==null))&&(UserType.equals("2"))) {
     
     DB objDB = new DB();
     objDB.connect();
     objDB.query(queryProfile);
     lectNameProfile = objDB.getDataAt(0,"lectName");
     userIDProfile = objDB.getDataAt(0,"staffNo");
     emailProfile = objDB.getDataAt(0,"emailAdd");
     phoneNoProfile = objDB.getDataAt(0,"phoneNo");
     roomNoProfile = objDB.getDataAt(0,"roomNo");
     objDB.query(query);
     studName = objDB.getDataAt(0, "studName");
     proTitle = objDB.getDataAt(0, "proTitle");
        total = objDB.getDataAt(0, "total") ;
        if(!(total==null))
            {
             gantt = objDB.getDataAt(0, "gantt");
             gantt_m = Float.parseFloat(gantt)*10/3;
             kebolehan = objDB.getDataAt(0, "kebolehan") ;
             kebolehan_m = Float.parseFloat(kebolehan)*10/2;
             daya = objDB.getDataAt(0, "daya") ;
             daya_m = Float.parseFloat(daya)*10/2;
             kekerapan = objDB.getDataAt(0, "kekerapan") ;
             kekerapan_m = Float.parseFloat(kekerapan)*10/1;
             peningkatan = objDB.getDataAt(0, "peningkatan") ;
             peningkatan_m = Float.parseFloat(peningkatan)*10/1;
             keberkesanan = objDB.getDataAt(0, "keberkesanan") ;
             keberkesanan_m = Float.parseFloat(keberkesanan)*10/1;
             peranan = objDB.getDataAt(0, "peranan") ;
             peranan_m = Float.parseFloat(peranan)*10/5;
             formet = objDB.getDataAt(0, "formet") ;
             formet_m = Float.parseFloat(formet)*10/5;
             abstrak = objDB.getDataAt(0, "abstrak") ;
             abstrak_m = Float.parseFloat(abstrak)*10/3;
             objektif = objDB.getDataAt(0, "objektif") ;
             objektif_m = Float.parseFloat(objektif)*10/5;
             analisis = objDB.getDataAt(0, "analisis") ;
             analisis_m = Float.parseFloat(analisis)*10/5;
             kajian = objDB.getDataAt(0, "kajian") ;
             kajian_m = Float.parseFloat(kajian)*10/5;
             metodologi = objDB.getDataAt(0, "metodologi") ;
             metodologi_m = Float.parseFloat(metodologi)*10/6;
             kesimpulan = objDB.getDataAt(0, "kesimpulan") ;
             kesimpulan_m = Float.parseFloat(kesimpulan)*10/2;
             rujukan = objDB.getDataAt(0, "rujukan") ;
             rujukan_m = Float.parseFloat(rujukan)*10/1;
             lampiran = objDB.getDataAt(0, "lampiran") ;
             lampiran_m = Float.parseFloat(lampiran)*10/3;
             persembahan = objDB.getDataAt(0, "persembahan") ;
             persembahan_m = Float.parseFloat(persembahan)*10/4;
             ayat = objDB.getDataAt(0, "ayat") ;
             ayat_m = Float.parseFloat(ayat)*10/4;
             gambarajah = objDB.getDataAt(0, "gambarajah") ;
             gambarajah_m = Float.parseFloat(gambarajah)*10/2;
             comment = objDB.getDataAt(0, "komen") ;
                
             
            }
        String tempstat="";
        String stat="";
        query="select staffNo,metricNo,status from supervisor where staffNo='"+UserSession+"' and metricNo='"+metricNo+"'";
        objDB.query(query);
        tempstat=(String)objDB.getDataAt(0, "status");
        if(tempstat.equals("Approved")){
            stat="S";
        }
      
     objDB.close();
            
     
%>
<html>

    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/titleSuggestion.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"><link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
        <script type="text/javascript" src="js/LecSvPSM1.js"></script>
        <script src="js/jquery.min.js"></script>
        

         <script src="js/bootstrap.min.js"></script>
         <script src="js/dropdown.js"></script>
         <script src="js/profile-pass.js"></script>
         <script src="js/updateProfile.js"></script>
        <title>Final Year Project Management System</title>
    </head>
    
  
    <body>
            
      
      <div id="Wrapper">
         <%@ include file="headerlecture.jsp" %>
        
         
    
    <div class="container">
    <div style="height:auto" id="WrapperBody">
         <span style="position:absolute;top:180px;left:130px"  onclick="javascript:history.back()"><i style="font-size:2.5em;color:#f0ad4e" class="fa fa-arrow-circle-left"></i></span> 
     <br> 
                     <center>
                         <form name="evaluatePSM1">
                     <h2>Supervisor Evaluation form</h2>
                     <center>
                    
               
                        <center>
                            <table style="width:50%" class="table table-bordered">
                                <tr bgcolor="#ebebeb" >
                                    <td colspan="2" align="center"><b>Project Information</td>
                                   
                                </tr>
                                <tr>
                                    <td  width="200px" >Name</td>
                                   
                                    <td  align="left"><%=studName%></td>
                                </tr>
                                
                                <tr>
                                    <td  width="200px" >Metric No.</td>
                                   
                                    <td  align="left"><%=metricNo%></td>
                                    <input class="form-control" type="hidden" name="metricNo" value="<%=metricNo%>"></input>
                                </tr>
                                
                                <tr>
                                    <td  width="200px" >Project title</td>
                                   
                                    <td  align="left"><%=proTitle%></td>
                                </tr>
                                
                                <tr>
                                    <td  width="200px" >Comment</td>
                                   
                                    <td  align="left"><textarea class="form-control" cols="50" rows="10" id="inputText" name="comment" <%if(!(total==null)){%> readonly <%}%>><%if(!(total==null)){%> <%=comment%><%}%></textarea></td>
                                </tr>
                             </table>
                                <table class="table-bordered" style="font-size:1.2em;font-weight:bold;text-align:left">
                                 <tr>
                                     <td colspan="6" align="center">Skala Penilaian</td>
                                 </tr>
                                <tr>
                                    <td bgcolor="#ff0000">Tidak Memuaskan&emsp;0-2</td>
                                    

                                    <td bgcolor="#ff6633">Kurang Memuaskan&emsp;3-4</td>
                                    

                                    <td bgcolor="#ffcc66">Sederhana&emsp;5-6</td>
                                    
                               
                                    <td bgcolor="#ccff66">Memuaskan&emsp;7-8</td>
                                    

                                    <td bgcolor="#66ff66">Sangat Memuaskan&emsp;9-10</td>
                                    
                               </tr>
                            </table>
                                
                     
                                <table style="text-align:left;width:85%" class="table table-bordered table-hover">
                        <tr bgcolor="#ebebeb"  style="font-weight:bold">
                            <td width="10px">No.</td>
                            <td width="300px">Item Penilaian</td>
                            <td width="110px">Paras Penilaian</td>
                            <td width="100px">Markah</td>
                        </tr>
                        
                        <tr bgcolor="#ebebeb"  style="font-weight:bold">
                            <td colspan="4">Penilaian Laporan Kemajuan</td>
                        </tr>
                        
                        <tr  style="font-weight:bold">
                            <td>1.</td>
                           <td colspan="3">Kemajuan Pelajar (3%)</td>
                            
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Pencapaian perancangan Projek berdasarkan carta Gantt.(3%) </td>
                            <td><select class="form-control"  name="gantt" onchange="addAll()" <%if(!(total==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>"<%if(i==gantt_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:80px" type="text" name="gantt_m" readonly   <%if(!(total==null)){%> value="<%=gantt%>"<%}%>></td>
                        </tr>
                        
                        <tr  style="font-weight:bold">
                            <td>2.</td>
                           <td colspan="3">Prestasi Perlaksanaan Projek (5%)</td>
                            
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Kebolehan merancang dan menyelesaikan masalah (2%)</td>
                            <td><select class="form-control"  name="kebolehan" onchange="addAll()" <%if(!(total==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>"<%if(i==kebolehan_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                           <td><input class="form-control" style="width:80px" type="text" name="kebolehan_m" readonly <%if(!(total==null)){%> value="<%=kebolehan%>"<%}%>></td>
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Daya usaha dan kebolehan berdikari (2%) </td>
                            <td><select class="form-control"  name="daya" onchange="addAll()" <%if(!(total==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>"<%if(i==daya_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                           <td><input class="form-control" style="width:80px" type="text" name="daya_m" readonly <%if(!(total==null)){%> value="<%=daya%>"<%}%>></td>
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Kekerapan pelajar berbincang dan mengemukakan perkembangan(1%)</td>
                            <td><select class="form-control"  name="kekerapan" onchange="addAll()" <%if(!(total==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==kekerapan_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:80px" type="text" name="kekerapan_m" readonly <%if(!(total==null)){%> value="<%=kekerapan%>"<%}%>></td>
                        </tr>
                        
                        <tr  style="font-weight:bold">
                            <td>3.</td>
                           <td colspan="3">Perkembangan Intelek / Sahsiah Pelajar (2%)</td>
                            
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Peningkatan pengetahuan dan kemahiran(1%)</td>
                            <td><select class="form-control"  name="peningkatan" onchange="addAll()" <%if(!(total==null)){%> disabled <%}%>>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==peningkatan_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:80px" type="text" name="peningkatan_m" readonly <%if(!(total==null)){%> value="<%=peningkatan%>"<%}%>></td>
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Keberkesanan berkomunikasi/perhubungan(1%)</td>
                            <td><select class="form-control"  name="keberkesanan" onchange="addAll()" <%if(!(total==null)){%> disabled <%}%>>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==keberkesanan_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:80px" type="text" name="keberkesanan_m" readonly <%if(!(total==null)){%> value="<%=keberkesanan%>"<%}%>></td>
                        </tr>
       
                       <tr bgcolor="#ebebeb" style="font-weight:bold">
                            <td colspan="4">Penilaian Cadangan Tajuk</td>
                        </tr>
                        
                        <tr  style="font-weight:bold">
                            <td>1.</td>
                           <td colspan="3">Cadangan Tajuk (5%)</td>
                            
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Peranan pelajar dalam mendapatkan tajuk Projek(5%)</td>
                            <td><select class="form-control"  name="peranan" onchange="addAll()" <%if(!(total==null)){%> disabled <%}%>>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==peranan_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                           <td><input class="form-control" style="width:80px" type="text" name="peranan_m" readonly <%if(!(total==null)){%> value="<%=peranan%>"<%}%>></td>
                        </tr>
                        
                        <tr  style="font-weight:bold">
                            <td>2.</td>
                           <td colspan="3">Kemahiran pelajar dalam penulisan cadangan projek (5%)</td>
                            
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Memenuhi spesifikasi format dalam penulisan laporan(5%) </td>
                            <td><select class="form-control"  name="format" onchange="addAll()" <%if(!(total==null)){%> disabled <%}%>>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==formet_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:80px" type="text" name="format_m" readonly <%if(!(total==null)){%> value="<%=formet%>"<%}%>></td>
                        </tr>
                        
                        <tr  style="font-weight:bold">
                            <td>3.</td>
                           <td colspan="3" style="font-weight:bold">Penulisan Cadangan Projek (40%)</td>
                            
                        </tr>
                        
                                               
                        <tr >
                            <td>&nbsp;</td>
                            <td>Abstrak(3%)</td>
                            <td><select class="form-control"  name="abstrak" onchange="addAll()" <%if(!(total==null)){%> disabled <%}%>>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==abstrak_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                           <td><input class="form-control" style="width:80px" type="text" name="abstrak_m" readonly<%if(!(total==null)){%> value="<%=abstrak%>"<%}%>></td>
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Objektif, skop dan pernyataan masalah(5%)</td>
                            <td><select class="form-control" name="objektif" onchange="addAll()" <%if(!(total==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==objektif_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                           <td><input class="form-control" style="width:80px" type="text" name="objektif_m" readonly<%if(!(total==null)){%> value="<%=objektif%>"<%}%>></td>
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Analisis Masalah(5%)</td>
                            <td><select class="form-control"  name="analisis" onchange="addAll()" <%if(!(total==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==analisis_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:80px" type="text" name="analisis_m" readonly<%if(!(total==null)){%> value="<%=analisis%>"<%}%>></td>
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Kajian literatur / latarbelakang (5%)</td>
                            <td><select class="form-control"  name="kajian" onchange="addAll()" <%if(!(total==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==kajian_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:80px" type="text" name="kajian_m" readonly <%if(!(total==null)){%> value="<%=kajian%>"<%}%> ></td>
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Metodologi Kajian (Kaedah/Teknik, Keperluan Perkakasan & Perisian, Justifikasi dsb)(6%)</td>
                            <td><select class="form-control"  name="metodologi" onchange="addAll()" <%if(!(total==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==metodologi_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                           <td><input class="form-control" style="width:80px" type="text" name="metodologi_m" readonly <%if(!(total==null)){%> value="<%=metodologi%>"<%}%>></td>
                        </tr>
                        
                        <tr >
                            <td>&nbsp;</td>
                            <td>Kesimpulan(2%)</td>
                            <td><select class="form-control"  name="kesimpulan" onchange="addAll()" <%if(!(total==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==metodologi_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:80px" type="text" name="kesimpulan_m" readonly<%if(!(total==null)){%> value="<%=kesimpulan%>"<%}%>></td>
                        </tr>
                        
                         <tr >
                            <td>&nbsp;</td>
                            <td>Rujukan / Bibliografi(1%)</td>
                            <td><select class="form-control"  name="rujukan" onchange="addAll()" <%if(!(total==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==rujukan_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                           <td><input class="form-control" style="width:80px" type="text" name="rujukan_m" readonly <%if(!(total==null)){%> value="<%=rujukan%>"<%}%>></td>
                        </tr>
                        
                         <tr >
                            <td>&nbsp;</td>
                            <td>Lampiran / Carta Gantt(3%)</td>
                            <td><select class="form-control"  name="lampiran" onchange="addAll()" <%if(!(total==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>"<%if(i==lampiran_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                           <td><input class="form-control" style="width:80px" type="text" name="lampiran_m" readonly <%if(!(total==null)){%> value="<%=lampiran%>"<%}%>></td>
                        </tr>
                        
                         <tr >
                            <td>&nbsp;</td>
                            <td>Susunan persembahan laporan mengikut jujukan secara logik(4%)</td>
                            <td><select class="form-control"  name="persembahan" onchange="addAll()" <%if(!(total==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==persembahan_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                           <td><input class="form-control" style="width:80px" type="text" name="persembahan_m" readonly <%if(!(total==null)){%> value="<%=persembahan%>"<%}%>></td>
                        </tr>
                        
                         <tr >
                             <td>&nbsp;</td>
                            <td>Susunan ayat yang mudah dan jelas difahami(4%)</td>
                           <td><select class="form-control"  name="ayat" onchange="addAll()" <%if(!(total==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==ayat_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                           <td><input class="form-control" style="width:80px" type="text" name="ayat_m" readonly <%if(!(total==null)){%> value="<%=ayat%>"<%}%>></td>
                        </tr>
                        
                         <tr >
                            <td>&nbsp;</td>
                            <td>Gambarajah/lakaran yang dapat memudahkan pemahaman(2%)</td>
                            <td><select class="form-control"  name="gambarajah" onchange="addAll()" <%if(!(total==null)){%> disabled <%}%>>
                                    <option value="">Please Select</option>
                                    <% for(int i=0;i<11;i++) {%>
                                    <option value="<%=i%>" <%if(i==gambarajah_m){%> selected <%}%>><%=i%></option>
                                    <%}%>
                                </select>
                            </td>
                            <td><input class="form-control" style="width:80px" type="text" name="gambarajah_m" readonly <%if(!(total==null)){%> value="<%=gambarajah%>"<%}%>></td>
                        </tr>
                        
                         
                        <tr style="font-weight:bold">
                            <td colspan="3" align="right">Total</td>
                            <td><input class="form-control" style="width:80px" type="text" name="total" readonly <%if(!(total==null)){%> value="<%=total%>" <%}%> > &nbsp;/&nbsp;60 </td>
                        </tr>
                    </table>
                    
                    <%if((total==null)){%>
                    <div id="itemButton">
                       
                            <div class="button" onmouseover="this.className='buttonHover'" onmouseout="this.className='button'"onclick="save('save')">Submit</div>                       
                    </div>
                    <%} else {%>
                    <div id="itemEdit"class="show">
                        <div id="itemButton">
                             <div class="btn btn-info" onclick="edit()">&emsp;Edit&emsp;</div>                       
                        </div>
                    </div>
                    <div id="itemSaveChanges" class="hide">
                        <div id="itemButton">
                             <div class="btn btn-success" onclick="save('saveChanges')">Save Changes</div>                       
                        </div>
                    </div>
                    <%}%>
                    
                    </center>
                    </fieldset>
                </center>
                </form>
                    
                    </center>
        
  
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
