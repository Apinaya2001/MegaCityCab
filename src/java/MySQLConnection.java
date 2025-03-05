import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConnection {
    public static void main(String[] args) {
        Connection connection = null;
        
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");  // This loads the driver
            
            // Establish connection to MySQL database
            String url = "jdbc:mysql://localhost:3308/city_cab"; // Replace with your DB details
            String username = "root"; // Your MySQL username
            String password = ""; // Your MySQL password
            
            connection = DriverManager.getConnection(url, username, password);
            System.out.println("Connected to the database!");
            
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Connection failed!");
            e.printStackTrace();
        } finally {
            // Close the connection
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
