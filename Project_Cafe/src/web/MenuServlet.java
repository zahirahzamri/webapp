package web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MenuDAO;
import model.Menu;

public class MenuServlet {
	
	private static final long serialVersionUID = 1L;
    private MenuDAO menuDAO;

    public void init() {
        menuDAO = new MenuDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertMenu(request, response);
                    break;
                case "/delete":
                    deleteMenu(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateMenu(request, response);
                    break;
                default:
                    listMenu(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listMenu(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {
        List < Menu > listUser = menuDAO.selectAllMenu();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("menu-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("menu-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Menu existingUser = menuDAO.selectMenu(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("menu-form.jsp");
        request.setAttribute("menu", existingUser);
        dispatcher.forward(request, response);

    }

    private void insertMenu(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        String name = request.getParameter("name");
        String quantity = request.getParameter("quantity");
        String type = request.getParameter("type");
        String price = request.getParameter("price");
        
        int quantity2;
        quantity2 = Integer.parseInt(quantity);
        double price2 = 0; 
        price2 = Double.parseDouble(price);
        
        Menu newMenu = new Menu(name, quantity2, type, price2);
        menuDAO.insertMenu(newMenu);
        response.sendRedirect("menu-list.jsp");
    }

    private void updateMenu(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("productID"));
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String price = request.getParameter("price");
        double price2 = 0; 
        price2 = Double.parseDouble(price);
        
        Menu book = new Menu(id, name, type, price2);
        menuDAO.updateMenu(book);
        response.sendRedirect("menu-list.jsp");
    }

    private void deleteMenu(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("productID"));
        menuDAO.deleteMenu(id);
        response.sendRedirect("menu-list.jsp");

    }
	
}
