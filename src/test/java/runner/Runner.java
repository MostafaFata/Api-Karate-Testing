package runner;

import com.intuit.karate.junit5.Karate;

public class Runner {

    @Karate.Test
    Karate run(){
        return Karate.run("src/test/java/features")
                //.tags("")
                .karateEnv("qa");
    }



}
