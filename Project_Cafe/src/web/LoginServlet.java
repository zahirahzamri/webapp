package web;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.LoginBean;
import database.LoginDB;

@WebServlet("/customerMain")
public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    private LoginDB loginDB;

    public void init() {
        loginDB = new LoginDB();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        LoginBean loginBean = new LoginBean();
        loginBean.setUsername(username);
        loginBean.setPassword(password);

        try {
            if (loginDB.validate(loginBean)) {
                HttpSession session = request.getSession();
                session.setAttribute("username",username);
                response.sendRedirect("customerOrder.jsp");
            } 
            else {
                HttpSession session = request.getSession();
                session.setAttribute("user", username);
                response.sendRedirect("login.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
