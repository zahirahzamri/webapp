package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Menu; 

public class MenuDAO {
	
	private String jdbcURL = "jdbc:mysql://localhost:3306/mydb?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Zahirah98@";

    private static final String INSERT_MENU_SQL = "INSERT INTO products" + "  (productName, quantity, productCategory, productPrice) VALUES " +
        " (?, ?, ?, ?);";

    private static final String SELECT_MENU_BY_ID = "SELECT productName, productCategory FROM products WHERE productID =?";
    private static final String SELECT_ALL_MENU = "SELECT * FROM products";
    private static final String DELETE_MENU_SQL = "DELETE FROM products WHERE productID = ?;";
    private static final String UPDATE_MENU_SQL = "UPDATE products SET productName = ?, productCategory = ?, productPrice = ? WHERE productID = ?;";

    public MenuDAO() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    public void insertMenu(Menu menu) throws SQLException {
        System.out.println(INSERT_MENU_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_MENU_SQL)) {
            preparedStatement.setString(1, menu.getProductName());
            preparedStatement.setInt(2, menu.getQuantity());
            preparedStatement.setString(3, menu.getProductCategory());
            preparedStatement.setDouble(4, menu.getProductPrice());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Menu selectMenu(int id) {
        Menu menu = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MENU_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String name = rs.getString("name");
                String type = rs.getString("type");
                menu = new Menu(id, name, type);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return menu;
    }

    public List < Menu > selectAllMenu() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List < Menu > menu = new ArrayList < > ();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_MENU);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("productID");
                String name = rs.getString("name");
                int quantity = rs.getInt("quantity");
                String type = rs.getString("type");
                double price = rs.getDouble("price");
                menu.add(new Menu(id, name, quantity, type, price));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return menu;
    }

    public boolean deleteMenu(int id) throws SQLException {
        boolean rowDeleted;
        try (
        	Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_MENU_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateMenu(Menu menu) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_MENU_SQL);) {
            statement.setInt(1, menu.getProductID());
            statement.setString(2, menu.getProductName());
            statement.setString(3, menu.getProductCategory());
            statement.setDouble(4, menu.getProductPrice());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
	
	
	
}
