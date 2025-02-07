import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Scanner;

public class BorrowItem {

    public static void main(String[] args) {
        
    }


    // Method to call from Main class
    public static void callBorrowItem(Scanner scanner) {
        String connectionUrl =
            "jdbc:sqlserver://cxp-sql-02\\hjw40;"
            + "database=WorldsBestLibrary;"
            + "user=dbuser;"
            + "password=csds341143sdsc;"
            // + "password=scsd341143dscs;"
            + "encrypt=true;"
            + "trustServerCertificate=true;"
            + "loginTimeout=15;";
        
        // Get user input
        System.out.println("Enter a valid mediaID: ");
        int inpMediaID = scanner.nextInt();

        System.out.println("Enter a valid memberID: ");
        int inpMemberID = scanner.nextInt();
        
        String callStoredProc = "{call borrowItem(?,?)}";

        try (Connection connection = DriverManager.getConnection(connectionUrl);
            CallableStatement prepsBorrowItem =
            connection.prepareCall(callStoredProc);) {
            connection.setAutoCommit(false);
             // 2 parameters to stored proc start with a parameter index of 1
             prepsBorrowItem.setInt(1, inpMediaID);
             prepsBorrowItem.setInt(2, inpMemberID);
             prepsBorrowItem.execute();
            
            connection.commit();
        }
        
        // Handle any errors that may have occurred.clear
        catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
