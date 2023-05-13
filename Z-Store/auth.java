import java.util.Scanner;

public class AuthorizationSystem {
    public static void main(String[] args) {
        String username = "myUsername";
        String password = "myPassword";
        
        Scanner input = new Scanner(System.in);
        System.out.print("Username: ");
        String enteredUsername = input.nextLine();
        System.out.print("Password: ");
        String enteredPassword = input.nextLine();
        
        if (enteredUsername.equals(username) && enteredPassword.equals(password)) {
            System.out.println("Access granted");
        } else {
            System.out.println("Access denied");
        }
    }
}
