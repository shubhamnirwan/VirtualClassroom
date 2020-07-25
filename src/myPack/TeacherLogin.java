package myPack;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.UserModel;
public class TeacherLogin extends HttpServlet
{
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		String userEmail=request.getParameter("userEmail");	//Getting parameter from Login Page
		String userPassword=request.getParameter("userPassword");	//Getting parameter from Login Page
		
		UserModel login=new UserModel();	//creating model object to store the value in model
		login.setUserEmail(userEmail);		//setting value in model using setter method
		login.setUserPassword(userPassword); //setting value in model using setter method
		try
		{
			UserModel teacherdata=new DAO().TeacherLogin(login);	//creating DAO object and calling Login method passing model type variable
			if(teacherdata!=null)	//checking if data has any value
			{
				HttpSession session=request.getSession(true);	//creating session		
				session.setAttribute("currentSessionUser", teacherdata);	//setting data in HttpSession refrains variable
				response.sendRedirect("Teacherindex.jsp");	// redirect to next or success page
			}
			else
			{
				response.sendRedirect("Login.jsp?msg=notcorrectdetails");
			}
		}
		catch (SQLException e) 
		{           
			System.out.println("Error"+e);
		}
	}

}
