import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MyClass {
	
	public static Connection letsConnect() {
		
		Connection conn = null;
		String dbDriver = "com.mysql.jdbc.Driver";
		String dbUrl = "jdbc:mysql://localhost:3306/"; 
		String dbUsername = "root";
		String dbPassword = "Zahirah98@";
		
		try {
			Class.forName(dbDriver);
			DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
			//System.out.println("Connected.");
		} 
		catch (SQLException  | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return conn;
	}
	
	public static void FetchData() {
		Connection conn = letsConnect();
		String sql = "SELECT * FROM products";
		
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()) {
				System.out.println(rs.getString(1) + " " + rs.getString(2));
			}
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		
		MyClass.letsConnect();
		MyClass.FetchData();

	}

}
