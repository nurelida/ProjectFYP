/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package FYPManagementSystem;
import FYPManagementSys_Bean.DB;
import FYPManagementSys_Bean.Common;
import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author rou
 */
public class ServLecEvaluation_Chairman extends HttpServlet {
   
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String UserSession = (String)session.getAttribute("user");
        String UserType = (String)session.getAttribute("userType");
        String address = "";
        String metricNo = request.getParameter("metricNo");
        String option = request.getParameter("Option");
        String query = "";
        try {
            if ((!(UserSession==null))&&(UserType.equals("2"))) {
            
            if(option.equals("Chairman")){
            query="insert into ev_pembentangan_psm1 value('"+metricNo+"','"
                                                            +request.getParameter("peradaban_m")+"','"
                                                            +request.getParameter("persiapan_m")+"','"
                                                            +request.getParameter("ketepatan_m")+"','"
                                                            +request.getParameter("kefahaman_m")+"','"
                                                            +request.getParameter("keyakinan_m")+"','"
                                                            +request.getParameter("soalJawab_m")+"','"
                                                            +request.getParameter("total")+"','"
                                                            +Common.replaceSingleQuote(request.getParameter("comment"))+"')";
             address="/WEB-INF/LecEvaluation_Chairman.jsp?metricNo="+metricNo;
            }
            if(option.equals("Chairman_Edit")){
            query="update ev_pembentangan_psm1 set peradaban='"+request.getParameter("peradaban_m")
                                              +"', persiapan='"+request.getParameter("persiapan_m")
                                              +"', ketepatan='"+request.getParameter("ketepatan_m")
                                              +"', kefahaman='"+request.getParameter("kefahaman_m")
                                              +"', keyakinan='"+request.getParameter("keyakinan_m")
                                              +"', soal_jawab='"+request.getParameter("soalJawab_m")
                                              +"', jumlah='"+request.getParameter("total")
                                              +"', ev_comment='"+Common.replaceSingleQuote(request.getParameter("comment"))
                                              +"' where metricNO='"+metricNo+"'";
             address="/WEB-INF/LecEvaluation_Chairman.jsp?metricNo="+metricNo;
            }
            if(option.equals("Chairman_psm2")){
            query="insert into ev_pembentangan_psm2 value('"+metricNo+"','"
                                                            +request.getParameter("peradaban_m")+"','"
                                                            +request.getParameter("persiapan_m")+"','"
                                                            +request.getParameter("ketepatan_m")+"','"
                                                            +request.getParameter("kefahaman_m")+"','"
                                                            +request.getParameter("keyakinan_m")+"','"
                                                            +request.getParameter("soalJawab_m")+"','"
                                                            +request.getParameter("total")+"','"
                                                            +Common.replaceSingleQuote(request.getParameter("comment"))+"')";
             address="/WEB-INF/LecEvaluation_Chairman_psm2.jsp?metricNo="+metricNo;
            }
            if(option.equals("Chairman_psm2_Edit")){
            query="update ev_pembentangan_psm2 set peradaban='"+request.getParameter("peradaban_m")
                                              +"', persiapan='"+request.getParameter("persiapan_m")
                                              +"', ketepatan='"+request.getParameter("ketepatan_m")
                                              +"', kefahaman='"+request.getParameter("kefahaman_m")
                                              +"', keyakinan='"+request.getParameter("keyakinan_m")
                                              +"', soal_jawab='"+request.getParameter("soalJawab_m")
                                              +"', jumlah='"+request.getParameter("total")
                                              +"', ev_comment='"+Common.replaceSingleQuote(request.getParameter("comment"))
                                              +"' where metricNO='"+metricNo+"'";
             address="/WEB-INF/LecEvaluation_Chairman.jsp?metricNo="+metricNo;
            }
            if(option.equals("Panel")){
            query="insert into ev_penilaian_psm1 value ('"+metricNo+"','"
                                                          +request.getParameter("matlamat_m")+"','"
                                                          +request.getParameter("kajian_m")+"','"
                                                          +request.getParameter("perancangan_m")+"','"
                                                          +request.getParameter("pengumpulan_m")+"','"
                                                          +request.getParameter("teknik_m")+"','"
                                                          +request.getParameter("rekabentuk_m")+"','"
                                                          +request.getParameter("perkakasan_m")+"','"
                                                          +request.getParameter("hasil_m")+"','"
                                                          +request.getParameter("rujukan_m")+"','"
                                                          +request.getParameter("lampiran_m")+"','"
                                                          +request.getParameter("laporan_m")+"','"
                                                          +request.getParameter("total")+"','"
                                                          +Common.replaceSingleQuote(request.getParameter("comment"))+"')";
                                                          
            address="/WEB-INF/LecEvaluation_Panel.jsp?metricNo="+metricNo;
            }
            if(option.equals("PanelEdit")){
            query="update ev_penilaian_psm1 set matlamat='" +request.getParameter("matlamat_m")
                                            +"',kajian='" +request.getParameter("kajian_m")
                                            +"',perancangan='"+request.getParameter("perancangan_m")
                                            +"',pengumpulan='"+request.getParameter("pengumpulan_m")
                                            +"',teknik='"+request.getParameter("teknik_m")
                                            +"',rekabentuk='"+request.getParameter("rekabentuk_m")
                                            +"',perkakasan='"+request.getParameter("perkakasan_m")
                                            +"',hasil='"+request.getParameter("hasil_m")
                                            +"',rujukan='"+request.getParameter("rujukan_m")
                                            +"',lampiran='"+request.getParameter("lampiran_m")
                                            +"',laporan='"+request.getParameter("laporan_m")
                                            +"',total='"+request.getParameter("total")
                                            +"',komen='" +Common.replaceSingleQuote(request.getParameter("comment"))
                                            +"' where metricNo='"+metricNo+"'";
                                                          
            address="/WEB-INF/LecEvaluation_Panel.jsp?metricNo="+metricNo;
            }
            if(option.equals("Panel_psm2")){
            query="insert into ev_penilaian_psm2 value ('"+metricNo+"','"
                                                          +request.getParameter("skop_m")+"','"
                                                          +request.getParameter("metodologi_m")+"','"
                                                          +request.getParameter("hasil_m")+"','"
                                                          +request.getParameter("teknologi_m")+"','"
                                                          +request.getParameter("komersial_m")+"','"
                                                          +request.getParameter("total")+"','"
                                                          +Common.replaceSingleQuote(request.getParameter("comment"))+"')";
            
            address="/WEB-INF/LecEvaluation_Panel_psm2.jsp?metricNo="+metricNo;
            }
            if(option.equals("Panel_psm2_Edit")){
            query="update ev_penilaian_psm2 set skop='"+request.getParameter("skop_m")
                                                 +"',metodologi='"+request.getParameter("metodologi_m")
                                                 +"',hasil='"+request.getParameter("hasil_m")
                                                 +"',teknologi='"+request.getParameter("teknologi_m")
                                                 +"',komersial='"+request.getParameter("komersial_m")
                                                 +"',total='"+request.getParameter("total")
                                                 +"',komen='"+Common.replaceSingleQuote(request.getParameter("comment"))
                                                 +"' where metricNo='"+metricNo+"'";
            
            address="/WEB-INF/LecEvaluation_Panel_psm2.jsp?metricNo="+metricNo;
            }
            
            DB objDB = new DB();
            objDB.connect();
            objDB.query(query);
            objDB.close();
               
           }
           else{
                address="/WEB-INF/Message.jsp?Message=Sorry. Your are not allowed to access this page without login.";
           }
           
           RequestDispatcher dispatcher = request.getRequestDispatcher(address);
           dispatcher.forward(request, response);
        } finally { 
            out.close();
        }
    } 
   
}
