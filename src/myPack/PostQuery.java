package myPack;
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
@WebServlet("/PostQuery")
public class PostQuery extends HttpServlet 
{
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String postTitle =request.getParameter("postTitle");		//get post topic of user from stackguru.jsp
		String postDescription=request.getParameter("postDescription");	// get post or description stackguru.jsp
		
		ServletContext context=getServletContext(); 
		
		HttpSession session=request.getSession();
		
		UserModel user=(UserModel) session.getAttribute("currentSessionUser");
		
		UserModel post =new UserModel();
		
		post.setUserEmail(user.getUserEmail());
		post.setUserPassword(user.getUserPassword());
		post.setPostTitle(postTitle);
		post.setPostDescription(postDescription);

		if(user.getUserEmail()!=null)
		{
			try 
			{
				if(new DAO().Post(post))
				{
					response.sendRedirect("post.jsp?msg=postDone");
				}
				
				else
				{
					System.out.println("Post was't stored in DB.");
				}
			}
			catch (SQLException e)
			{
				System.out.println("Error in PostQuery"+e);
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
