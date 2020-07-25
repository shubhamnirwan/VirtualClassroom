package Filter;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
public class FilterTeacherSignup implements Filter {

	public void destroy() {
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletResponse HttpResponse=(HttpServletResponse)response; 
		String userName=request.getParameter("userName");
		String fatherName= request.getParameter("fatherName");
		String motherName= request.getParameter("motherName");
		String address= request.getParameter("address");
		String designation= request.getParameter("designation");
		String degree= request.getParameter("degree");
		String userEmail= request.getParameter("userEmail");
		String mobileNo=request.getParameter("mobileNo");
		String userPassword=request.getParameter("userPassword");

		if(userEmail.equals("")||userName.equals("")||userPassword.equals("")||userPassword==null||fatherName.equals("")||motherName.equals("")||address.equals("")||designation.equals("")||degree.equals("")|| mobileNo.equals(""))
		{
			HttpResponse.sendRedirect("Signup.jsp?msg=error");
		}
		else
		{
		chain.doFilter(request, response);
		}
	}
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
