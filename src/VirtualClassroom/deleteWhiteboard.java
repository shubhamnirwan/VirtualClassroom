package VirtualClassroom;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.UserModel;
import myPack.DAO;
@WebServlet("/deleteWhiteboard")
public class deleteWhiteboard extends HttpServlet 
{
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		ServletContext context=getServletContext(); 
		
		HttpSession session=request.getSession();
		
		UserModel user=(UserModel) session.getAttribute("currentSessionUser");
		
		UserModel post =new UserModel();
		
		post.setUserName(user.getUserName());

		if(user.getUserName()!=null)
		{
			try 
			{
				if(new DAO().deleteWhiteboard(post))
				{
					//response.sendRedirect("Teacherindex.jsp?msg=postDone");
					System.out.println("success");
				}
				
				else
				{
				//	response.sendRedirect("TeacherWhiteboard.jsp?msg=noWhiteBoard");
					out.println("whiteboard wasn,t delete in database");
				}
			}
			catch (SQLException e)
			{
				System.out.println("Error in server"+e);
			}
	}
		else
		{
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			request.setAttribute("msg", "Please Login for Continue.");
			rd.include(request, response);
		}
	}

}
