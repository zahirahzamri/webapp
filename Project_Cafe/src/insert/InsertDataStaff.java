package insert;
import java.io.IOException; 
import java.io.PrintWriter; 
import java.sql.Connection; 
import java.sql.PreparedStatement; 

import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 

// Import Database Connection Class file 
import insert.DatabaseConnection; 

// Servlet Name 
@WebServlet("/InsertDataStaff") 
public class InsertDataStaff extends HttpServlet { 
	private static final long serialVersionUID = 1L; 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		
		try { 
			
			// Initialize the database 
			Connection con = DatabaseConnection.initializeDatabase(); 
			
			PreparedStatement st = con.prepareStatement("insert into staff (username, password) values(?, ?)"); 

			// For the first parameter, 
			// get the data using request object 
			// sets the data to st pointer 
			st.setString(1, request.getParameter("username")); 

			// Same for second parameter 
			st.setString(2, request.getParameter("password")); 

			// Execute the insert command using executeUpdate() 
			// to make changes in database 
			st.executeUpdate(); 

			// Close all the connections 
			st.close(); 
			con.close(); 

			// Get a writer pointer 
			// to display the successful result 
			PrintWriter out = response.getWriter(); 
			out.println("<html><head><title>Registration Status</title></head><body><b>Successfully Inserted" + "</b>");
			out.println("<br><a href=\"staffMain.jsp\" class=\"button\">Login</a>");
			out.println("</body></html>"); 
		} 
		catch (Exception e) { 
			e.printStackTrace(); 
		} 
	} 
} 
