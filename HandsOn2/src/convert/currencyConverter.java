package convert;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class currencyConverter extends HttpServlet {
	
	public String country;
	private String amt;
	public	double amount;
	public double resultOutput;
	public double arabia = 1.11;
	public double rupiah = 0.00030;
	public double bangladesh = 0.049;
	public double afghan = 0.053;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
			response.setContentType("text/html");

			PrintWriter out = response.getWriter();
			country = request.getParameter("ctr");
			amt = request.getParameter("amount");
			amount = Double.parseDouble(amt);
			
			resultOutput = 0.0;
			
			if (country.equals("SAR")) {
				resultOutput = amount * arabia;
			}			
			else if (country.equals("IDR")) {
				resultOutput = amount * rupiah;
			}
			else if (country.equals("BDT")) {
				resultOutput = amount * bangladesh;
			}
			else if (country.equals("AFN")) {
				resultOutput = amount * afghan;
			}
	}
}

