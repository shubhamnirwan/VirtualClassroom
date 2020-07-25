package VirtualClassroom;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.UserModel;
import myPack.DAO;
@WebServlet("/TeacherUrlShare")
public class TeacherUrlShare extends HttpServlet 
{
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String whiteboardName =(String)request.getParameter("param1");	
		String whiteboardtopic =(String)request.getParameter("param2");
		System.out.println(whiteboardName);
		System.out.println(whiteboardtopic);
		ServletContext context=getServletContext(); 
		HttpSession session=request.getSession();
		UserModel user=(UserModel) session.getAttribute("currentSessionUser");
		UserModel url =new UserModel();
		url.setUserName(user.getUserName());
		url.setUserEmail(user.getUserEmail());
		url.setWhiteboardName(whiteboardName);
		url.setWhiteboardtopic(whiteboardtopic);
		if(user.getUserEmail()!=null)
		{
			try 
			{
				if(new DAO().TeacherUrlShare(url))
				{
					System.out.println("url share");
					out.println(whiteboardName+ "and" +whiteboardtopic+ "Added Succesfully"); //response.sendRedirect("TeacherWhiteborad.jsp?msg=share");
				}
				
				else
				{
					System.out.println("url doesn't share");
				}
			}
			catch (SQLException e)
			{
				System.out.println("Error in PostQuery"+e);
			}
	}
		else
		{
			System.out.println("error");
			/*RequestDispatcher rd = request.getRequestDispatcher("userLogin.jsp");
			request.setAttribute("msg", "Please Login for Continue.");
			rd.include(request, response);*/
		}
	}

}
