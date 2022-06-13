import com.solvd.laba.service.IBusRunner;
import com.solvd.laba.service.impl.BusRunnerImpl;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;


public class Runner {
    private static final Logger LOGGER = LogManager.getLogger(Runner.class);

    public static void main(String[] args) {
        IBusRunner busRunner = new BusRunnerImpl();
        busRunner.programRunner();
    }
}
