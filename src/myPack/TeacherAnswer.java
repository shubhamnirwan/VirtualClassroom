package myPack;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/TeacherAnswer")
public class TeacherAnswer extends HttpServlet
{

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		Integer postId=Integer.parseInt(request.getParameter("postId"));
		
		try 
		{
			
				request.setAttribute("RS", new DAO().SelectedPost(postId));
				request.setAttribute("RST", new DAO().SelectedPostReply(postId));
				RequestDispatcher rd=request.getRequestDispatcher("Teacheranswer.jsp");
				rd.include(request, response);
			
			
		}
		catch (SQLException e)
		{
			System.out.println("Selected Post DAO Logic exception"+e);
		}
		
	}
}
