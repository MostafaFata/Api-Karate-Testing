package data;

import com.github.javafaker.Faker;

public class DataGenerator {

    public static String generateFirstname(){

        Faker faker = new Faker();
        return faker.name().firstName();

    }

    public static String generateLastname(){

        Faker faker = new Faker();
        return faker.name().lastName();

    }
    public static String generateEmail(){

        // firstname.lastname@domain.ext
        String firstname = generateFirstname();
        String lastname = generateLastname();
        int randomNumber = (int) (Math.random() * 123);
        String domain = "@company.com";

         return firstname + "." + lastname + randomNumber + domain;
    }






}
