package myPack;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.Random;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Connection.connectionFile;
import Model.UserModel;
@MultipartConfig
public class NotesUpload extends HttpServlet 
{
	Connection Conn;
	PreparedStatement pst;
	public NotesUpload()
	{
		super();
		Conn=connectionFile.getConnection();
	}
public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
{
	response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    try 
    {
      processRequest(request, response);
    } 
    catch (IOException e) 
    {
      out.print("<br>ERROR! " + e.getMessage());
    }
   }
  public void processRequest(HttpServletRequest request,

      HttpServletResponse response) throws ServletException, IOException {

 

    final PrintWriter out = response.getWriter();
    ServletContext context=getServletContext(); 
	
	HttpSession session=request.getSession();
	UserModel user=(UserModel) session.getAttribute("currentSessionUser");
	String userName=user.getUserName();
    String fileName=request.getParameter("fileName");
    String fileTopic=request.getParameter("fileTopic");
     Part filePart = request.getPart("fileUpload");
 Random random= new Random();
 int no=random.nextInt(10000);
 java.util.Date d = new java.util.Date();
 Timestamp ts = new Timestamp(d.getTime());
try
	{
	String sql="insert into Notes values(?,?,?,?,?,?)";
	pst=Conn.prepareStatement(sql);
	if(filePart!=null)
		{
			FileInputStream fis=(FileInputStream) filePart.getInputStream();
			pst.setString(1,fileName);	
			pst.setBlob(2,fis);
			pst.setInt(3, no);
			pst.setTimestamp(4,ts);
			pst.setString(5, fileTopic);
			pst.setString(6, userName);
			pst.execute();
			response.sendRedirect("TeacherNotes.jsp?msg=success");
			
		}	
			pst.close();
	}
	catch (Exception e) 
	{
		out.println(e);
	}

}
}