
package myPack;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.UserModel;
@WebServlet("/TeacherPostReply")
public class TeacherPostReply extends HttpServlet 
{
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		UserModel user = (UserModel)session.getAttribute("currentSessionUser");
		Integer postId=Integer.parseInt(request.getParameter("postId"));
		String postReply=request.getParameter("postReply");
		
		if(user!=null)
		{
			UserModel reply =new UserModel();
			reply.setUserEmail(user.getUserEmail());
			reply.setPostId(postId);
			reply.setPostReply(postReply);
			
			try 
			{
				if(new DAO().PostReply(reply))
				{
					response.sendRedirect("TeacherAnswer?postId="+postId+"&msg=postDone");
				}
				else 
				{
					System.out.println("Reply was't stored in DB.");
				}
			}
			catch (SQLException e)
			{
				System.out.println("Post Reply DAO Logic exception"+e);
			}
		}
		else
		{
			response.sendRedirect("Login.jsp?msg=loginAgain");
			
		}
		
		
	}

}
