import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.solvd.laba.services.IBusRunner;
import com.solvd.laba.services.impl.BusRunnerImpl;


public class Runner {
    private static final Logger LOGGER = LogManager.getLogger(Runner.class);

    public static void main(String[] args) {
        IBusRunner busRunner = new BusRunnerImpl();
        busRunner.programRunner();
    }
}
