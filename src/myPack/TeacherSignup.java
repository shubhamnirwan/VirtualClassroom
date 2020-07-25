package myPack;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.UserModel;
public class TeacherSignup extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	response.setContentType("text/html");
	PrintWriter out=response.getWriter();
	String userName=request.getParameter("userName");
	String fatherName= request.getParameter("fatherName");
	String motherName= request.getParameter("motherName");
	String address= request.getParameter("address");
	String designation= request.getParameter("designation");
	String degree= request.getParameter("degree");
	String userEmail= request.getParameter("userEmail");
	Long mobileNo=Long.parseLong(request.getParameter("mobileNo"));
	String userPassword=request.getParameter("userPassword");
	System.out.println("1");
	UserModel signup=new UserModel();
	signup.setUserName(userName);
	signup.setFatherName(fatherName);
	signup.setMotherName(motherName);
	signup.setAddress(address);
	signup.setUserEmail(userEmail);
	signup.setDesignation(designation);
	signup.setDegree(degree);
	signup.setMobileNo(mobileNo);
	signup.setUserPassword(userPassword);
	try {
		System.out.println("2");
		int x=new DAO().TeacherSignUp(signup);
		if (x>0) {
			
			response.sendRedirect("Login.jsp?msg=SignupSuccess&name="+signup.getUserName()+"");
		}
		else {
			out.println("Error");
		}
		
	}
	catch(SQLException e)
	{
		System.out.println("User Signup Error"+ e );
	}

}
}
