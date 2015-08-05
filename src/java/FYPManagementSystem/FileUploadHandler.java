/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates test
 * and open the template in the editor.
 */
package FYPManagementSystem;
 import java.io.File;
import java.io.IOException;
import java.util.List;
import FYPManagementSys_Bean.DB;
import FYPManagementSys_Bean.Common;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


public class FileUploadHandler extends HttpServlet {
    private final String UPLOAD_DIRECTORY = "D:/FYPSystem/web/news";
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String address = "";
        
      String option=request.getParameter("Option");
      String addTitle="";
      String addContent="";
      
      String query="";
      String queryLastID="";
      DB objDB = new DB();
        //process only if its multipart content
      if(option.equals("Add")){
          
          
        if(ServletFileUpload.isMultipartContent(request)){
            try {
                
                List<FileItem> multiparts = new ServletFileUpload(
                                         new DiskFileItemFactory()).parseRequest(request);
               
                for(FileItem item : multiparts){
                    if(!item.isFormField()){
                        String name = new File(item.getName()).getName();
                        item.write( new File(UPLOAD_DIRECTORY + File.separator + addTitle+".jpg"));
                    }
                    else if(item.isFormField()){
                        if(item.getFieldName().contentEquals("addTitle")){  //Check if the item in the loop is the user_id
                             addTitle = item.getString();                //If yes store the value
                          }
                        if(item.getFieldName().contentEquals("addContent")){  //Check if the item in the loop is the user_id
                             addContent = item.getString();                //If yes store the value
                          }
                    }
                }
                query= "insert into news (newsTitle,newsContent) values('"+Common.replaceSingleQuote(addTitle)+"','"+Common.replaceSingleQuote(addContent)+"')";
           
               //File uploaded successfully
               request.setAttribute("message", "File Uploaded Successfully");
            } catch (Exception ex) {
               request.setAttribute("message", "File Upload Failed due to " + ex);
            }          
                  address="WEB-INF/AdNews.jsp";
        }else{
            request.setAttribute("message",
                                 "Sorry this Servlet only handles file upload request");
        }
      }
      objDB.connect();
      objDB.query(query);
      objDB.close();
    
       RequestDispatcher dispatcher = request.getRequestDispatcher(address);
                        dispatcher.forward(request, response);
     
    }
  
}