import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        PetRegistry registry = new PetRegistry();
        boolean exit = false;
        Scanner scanner = new Scanner(System.in);

        try (Counter counter = new Counter()) {
            while (!exit) {
                registry.showMenu();
                int choice = scanner.nextInt();
                scanner.nextLine(); // Игнорируем перевод строки после числа

                switch (choice) {
                    case 1:
                        registry.registerPet(counter);
                        break;
                    case 2:
                        registry.listCommands();
                        break;
                    case 3:
                        registry.teachCommand();
                        break;
                    case 4:
                        exit = true;
                        break;
                    default:
                        System.out.println("Неверный выбор, попробуйте снова.");
                }
            }
        } catch (Exception e) {
            System.out.println("Произошла ошибка: " + e.getMessage());
        }
    }
}