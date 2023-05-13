import java.util.ArrayList;
import java.util.Scanner;

public class Store {
    
    public static void main(String[] args) {
        
        ArrayList<App> apps = new ArrayList<App>();
        
        // create some sample apps
        App app1 = new App("App1", "Description of App1", 1.99);
        App app2 = new App("App2", "Description of App2", 2.99);
        App app3 = new App("App3", "Description of App3", 0.99);
        
        // add the apps to the store
        apps.add(app1);
        apps.add(app2);
        apps.add(app3);
        
        // create a scanner to get user input
        Scanner scanner = new Scanner(System.in);
        
        // loop to display the apps and get user selection
        while (true) {
            System.out.println("Welcome to the Store!");
            System.out.println("Please select an app to download:");
            
            // display the available apps
            for (int i = 0; i < apps.size(); i++) {
                App app = apps.get(i);
                System.out.println((i + 1) + ". " + app.getName() + " - " + app.getDescription() + " - $" + app.getPrice());
            }
            
            // get the user's selection
            System.out.print("Selection: ");
            int selection = scanner.nextInt();
            
            // download the selected app
            App selectedApp = apps.get(selection - 1);
            System.out.println("Downloading " + selectedApp.getName() + "...");
            // add code here to download the app
            
            // ask if the user wants to download another app
            System.out.print("Do you want to download another app? (y/n): ");
            String answer = scanner.next();
            if (answer.equalsIgnoreCase("n")) {
                break;
            }
        }
        
        System.out.println("Thank you for visiting the Store!");
    }
}

class App {
    
    private String name;
    private String description;
    private double price;
    
    public App(String name, String description, double price) {
        this.name = name;
        this.description = description;
        this.price = price;
    }
    
    public String getName() {
        return name;
    }
    
    public String getDescription() {
        return description;
    }
    
    public double getPrice() {
        return price;
    }
    
}
