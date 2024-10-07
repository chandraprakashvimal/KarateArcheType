package examples.airlines.javaDataFaker;

import net.datafaker.Faker;

public class RandomDataGenerator {
    static Faker faker = new Faker();

    public static String getRandomNumber(int num) {
        return faker.number().digits(num);
    }

    public static String getRandomName() {
        return faker.name().fullName();
    }

    public static void main(String[] args) {
        System.out.println(RandomDataGenerator.getRandomName());
        System.out.println(RandomDataGenerator.getRandomNumber(5));

    }
}
