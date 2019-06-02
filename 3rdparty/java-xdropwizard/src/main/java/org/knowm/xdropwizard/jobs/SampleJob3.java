package org.knowm.xdropwizard.jobs;

import org.knowm.sundial.Job;
import org.knowm.sundial.JobContext;
import org.knowm.sundial.exceptions.JobInterruptException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/** @author timmolter */
public class SampleJob3 extends Job {

  private final Logger logger = LoggerFactory.getLogger(SampleJob3.class);

  @Override
  public void doRun() throws JobInterruptException {

    JobContext context = getJobContext();

    String valueAsString = context.get("MyParam");
    logger.info("valueAsString = " + valueAsString);

    Integer valueAsInt = Integer.valueOf(valueAsString);
    logger.info("valueAsInt = " + valueAsInt);

    context.put("MyValue", new Integer(123));

    new SampleJobAction().run();
  }
}
