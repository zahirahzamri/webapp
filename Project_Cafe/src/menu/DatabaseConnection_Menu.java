package menu;
import java.sql.*;

/**
 * A Java MySQL UPDATE example.
 * Demonstrates the use of a SQL UPDATE statement against a
 * MySQL database, called from a Java program.
 * 
 * Created by Alvin Alexander, http://devdaily.com
 *
 */
public class DatabaseConnection_Menu{
	  
	  Connection conn;

	  public static void main(String[] args){
		  
		  new DatabaseConnection_Menu();
	  }
	 
	  public DatabaseConnection_Menu(){
	    
		try{ 
			String dbName = "mydb"; 
			String dbUsername = "root"; 
			String dbPassword = "Zahirah98@";
			
	      Class.forName("com.mysql.jdbc.Driver").newInstance();
	      String url = "jdbc:mysql://localhost:3306/";
	      conn = DriverManager.getConnection(url + dbName + "?useTimezone=true&serverTimezone=UTC", "dbUsername", "dbPassword");
	      
	      doTests();
	      conn.close();
	    }
		
	    catch (ClassNotFoundException ex) {System.err.println(ex.getMessage());}
	    catch (IllegalAccessException ex) {System.err.println(ex.getMessage());}
	    catch (InstantiationException ex) {System.err.println(ex.getMessage());}
	    catch (SQLException ex)           {System.err.println(ex.getMessage());}
	  }

	  private void doTests(){
	    doSelectTest();

	    doInsertTest();  doSelectTest();
	    doUpdateTest();  doSelectTest();
	    doDeleteTest();  doSelectTest();
	  }

	  private void doSelectTest(){
		  
	    System.out.println("[OUTPUT FROM SELECT]");
	    String query = "SELECT productName, productPrice FROM products";
	    
	    try{
	      Statement st = conn.createStatement();
	      ResultSet rs = st.executeQuery(query);
	      
	      while (rs.next()){
	        String s = rs.getString("productName");
	        float n = rs.getFloat("productPrice");
	        System.out.println(s + "   " + n);
	      }
	    }
	    catch (SQLException ex)
	    {
	      System.err.println(ex.getMessage());
	    }
	  }

	  private void doInsertTest()
	  {
	    System.out.print("\n[Performing INSERT] ... ");
	    try{
	      Statement st = conn.createStatement();
	      st.executeUpdate("INSERT INTO products (productName, quantity, productCategory, productPrice)" +
	                       "VALUES (?,?,?,?)");
	    }
	    catch (SQLException ex){
	      System.err.println(ex.getMessage());
	    }
	  }

	  
	  private void doUpdateTest(){
	    System.out.print("\n[Performing UPDATE] ... ");
	    try{
	      Statement st = conn.createStatement();
	      st.executeUpdate("UPDATE products SET productName = ?, productPrice = ? WHERE productName = ?");
	    }
	    catch (SQLException ex){
	      System.err.println(ex.getMessage());
	    }
	  }

	  private void doDeleteTest(){
	    System.out.print("\n[Performing DELETE] ... ");
	    try{
	      Statement st = conn.createStatement();
	      st.executeUpdate("DELETE FROM products WHERE productName = ?");
	    }
	    catch (SQLException ex){
	      System.err.println(ex.getMessage());
	    }
	  }
	}