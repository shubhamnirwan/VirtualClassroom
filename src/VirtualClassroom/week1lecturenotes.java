package VirtualClassroom;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/week1lecturenotes")
public class week1lecturenotes extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 File file = new File("E:\\Eclipse\\Workspace\\VirtualClassroom\\WebContent\\docs\\OOProgWithJava-notes.pdf");
		    response.setHeader("Content-Type",    getServletContext().getMimeType(file.getName()));
		    response.setHeader("Content-Length", String.valueOf(file.length()));
		    response.setHeader("Content-Disposition", "inline; filename=\"OOProgWithJava-notes.pdf\"");
		    Files.copy(file.toPath(), response.getOutputStream());
		 
	}
}