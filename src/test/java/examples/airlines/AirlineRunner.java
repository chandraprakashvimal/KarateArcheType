package examples.airlines;

import com.intuit.karate.junit5.Karate;

class AirlineRunner {
    
    @Karate.Test
    Karate testAirline() {
        return Karate.run("RetryFailed").relativeTo(getClass());
    }    

}
