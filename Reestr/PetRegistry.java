// Класс реестра животных

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

class PetRegistry {
    private List<Animal> pets = new ArrayList<>();
    private Scanner scanner = new Scanner(System.in);

    public void registerPet(Counter counter) {
        System.out.print("Введите тип животного (Dog/Cat/Hamster/Mouse): ");
        String type = scanner.nextLine();
        System.out.print("Введите имя животного: ");
        String name = scanner.nextLine();

        Animal pet = null;
        if ("Dog".equalsIgnoreCase(type)) {
            pet = new Dog(name);
        } else if ("Cat".equalsIgnoreCase(type)) {
            pet = new Cat(name);
        } else if ("Hamster".equalsIgnoreCase(type)){
            pet = new Hamster(name);
        } else if ("Mouse".equalsIgnoreCase(type)){
            pet = new Mouse(name);
        }
        if (pet != null) {
            pets.add(pet);
            counter.add();
            System.out.println("Животное " + pet.getName() + " добавлено.");
        } else {
            System.out.println("Неизвестный тип животного.");
        }
    }

    public void listCommands() {
        System.out.print("Введите имя животного: ");
        String name = scanner.nextLine();
        for (Animal pet : pets) {
            if (pet.getName().equalsIgnoreCase(name)) {
                System.out.println("Команды для " + pet.getName() + ": " + pet.getCommands());
                return;
            }
        }
        System.out.println("Животное не найдено.");
    }

    public void teachCommand() {
        System.out.print("Введите имя животного: ");
        String name = scanner.nextLine();
        System.out.print("Введите команду для обучения: ");
        String command = scanner.nextLine();
        for (Animal pet : pets) {
            if (pet.getName().equalsIgnoreCase(name)) {
                pet.addCommand(command);
                System.out.println("Животное " + pet.getName() + " обучено команде: " + command);
                return;
            }
        }
        System.out.println("Животное не найдено.");
    }

    public void showMenu() {
        System.out.println("   Выберите пункт из меню:");
        System.out.println("1. Завести новое животное");
        System.out.println("2. Показать список команд животного");
        System.out.println("3. Обучить животное новой команде");
        System.out.println("4. Выйти");
    }
}
