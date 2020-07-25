package Filter;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

public class FilterLogin implements Filter {

	public void destroy() {
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletResponse HttpResponse=(HttpServletResponse)response;
		
		String userEmail= request.getParameter("userEmail");
		String userPassword=request.getParameter("userPassword");

		if(userEmail.equals("")||userPassword.equals("")||userPassword==null||userEmail==null)
		{
			HttpResponse.sendRedirect("Login.jsp?msg=error");
		}
		else
		{
		chain.doFilter(request, response);
		}
	}
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
