package org.knowm.xdropwizard.jobs;

import org.knowm.sundial.Job;
import org.knowm.sundial.SundialJobScheduler;
import org.knowm.sundial.annotations.CronTrigger;
import org.knowm.sundial.exceptions.JobInterruptException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@CronTrigger(cron = "0/25 * * * * ?")
public class MyJob extends Job {

  private final Logger logger = LoggerFactory.getLogger(MyJob.class);

  @Override
  public void doRun() throws JobInterruptException {

    // pull object from ServletContext, which was added in the pllication's run method
    String myObject = (String) SundialJobScheduler.getServletContext().getAttribute("MyKey");

    logger.info("MyJob says: " + myObject);
  }
}
