/* This is the Java file the user should first run in order
 * to run queries on the WorldsBestLibrary database. */
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        System.out.println("Welcome to the WorldsBestLibrary database!\n\nMain Menu");
        System.out.println("1. Borrow an item\n3. Search for an item\n4. Add a library member\n6. See all items associated with a creator\n" +
                           "7. See all items under a specific genre\n15. Manage a review of a media item\n99. Quit the program\n\n");

        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("Please type the number of the desired query.");
            if (scanner.hasNextInt()) {
                int choice = scanner.nextInt();

                // Need to explicitly do this to avoid an error
                scanner.nextLine();

                switch (choice) {
                    case 1:
                        BorrowItem.callBorrowItem(scanner);
                        break;
                    case 3:
                        SearchItem.callSearchItem(scanner);
                        break;
                    case 4:
                        AddLibraryMember.callAddLibraryMember(scanner);
                        break;
                    case 6:
                        SelectCreator.callSelectCreator(scanner);
                        break;
                    case 7:
                        SelectGenre.callSelectGenre(scanner);
                        break;
                    case 15:
                        ManageReview.callManageReview(scanner);
                        break;
                    case 99:
                        System.out.println("Exiting the program. Goodbye!");
                        scanner.close();
                        return; // Exit the program
                    default:
                        System.out.println("Invalid choice.");
                }
            }
            else {
                System.out.println("Invalid input.");
                scanner.next(); // Clear invalid input
            }
        }
    }

}
