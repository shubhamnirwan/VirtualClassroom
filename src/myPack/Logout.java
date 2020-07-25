package myPack;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/logout")
public class Logout extends HttpServlet
{
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();

		HttpSession session=request.getSession();
		session.removeAttribute("userEmail");
		session.removeAttribute("userPassword");
		session.invalidate();
		RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
		request.setAttribute("msg", "You are logged out");
		rd.include(request, response);
			
	}

}
