import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;


public class SearchItem {

    public static void main(String[] args) {
        
    }


    // Method to call from Main class
    public static void callSearchItem(Scanner scanner) {
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
        System.out.println("Enter the title of the item you want to search for.");
        String inpTitle = scanner.nextLine();

        if (inpTitle == null || inpTitle.trim().isEmpty()) {
            System.out.println("Title cannot be empty. Returning to the main menu.");
            return;
        }

        String callStoredProc = "{call dbo.searchItem(?)}";

        try (Connection connection = DriverManager.getConnection(connectionUrl);
            CallableStatement prepsSearchItem = 
            connection.prepareCall(callStoredProc);) {
            connection.setAutoCommit(false);

            prepsSearchItem.setString(1, inpTitle);

            try (ResultSet rs = prepsSearchItem.executeQuery()) {
                // Display the results
                System.out.println("Title\tCondition\tAvailability");
                while (rs.next()) {
                    String resultTitle = rs.getString("title");
                    String condition = rs.getString("condition");
                    String loanStatus = rs.getString("loanStatus");
                    System.out.println(resultTitle + "\t" + condition + "\t" + loanStatus);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}