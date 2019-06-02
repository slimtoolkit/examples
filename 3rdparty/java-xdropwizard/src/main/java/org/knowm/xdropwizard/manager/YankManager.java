package org.knowm.xdropwizard.manager;

import io.dropwizard.lifecycle.Managed;
import java.util.List;
import org.knowm.yank.PropertiesUtils;
import org.knowm.yank.Yank;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * This is where Yank is bound to the main DropWizard thread.
 *
 * @author timmolter
 */
public class YankManager implements Managed {

  private final Logger logger = LoggerFactory.getLogger(YankManager.class);

  private final List<YankConfiguration> yankConfigurations;

  /** Constructor */
  public YankManager(List<YankConfiguration> yankConfigurations) {

    this.yankConfigurations = yankConfigurations;
  }

  @Override
  public void start() throws Exception {

    logger.info("initializing Yank...");

    for (YankConfiguration yankConfiguration : yankConfigurations) {

      // setup connection pool
      if (yankConfiguration.getDbPropsFileName() == null
          || yankConfiguration.getSqlPropsFileName().trim().length() == 0) {
        if (yankConfiguration.getPoolName() != null) {
          Yank.setupConnectionPool(
              yankConfiguration.getPoolName(),
              PropertiesUtils.getPropertiesFromClasspath("DB.properties"));
        } else {
          Yank.setupDefaultConnectionPool(
              PropertiesUtils.getPropertiesFromClasspath("DB.properties"));
        }
      } else {
        if (yankConfiguration.getPoolName() != null) {
          Yank.setupConnectionPool(
              yankConfiguration.getPoolName(),
              PropertiesUtils.getPropertiesFromClasspath(yankConfiguration.getDbPropsFileName()));
        } else {
          Yank.setupDefaultConnectionPool(
              PropertiesUtils.getPropertiesFromClasspath(yankConfiguration.getDbPropsFileName()));
        }
      }

      // setup sql statements
      if (yankConfiguration.getSqlPropsFileName() != null
          && yankConfiguration.getSqlPropsFileName().trim().length() > 0) {
        Yank.addSQLStatements(
            PropertiesUtils.getPropertiesFromClasspath(yankConfiguration.getSqlPropsFileName()));
      }

      logger.info("Yank started successfully.");
    }
  }

  @Override
  public void stop() throws Exception {

    logger.info("shutting down Yank...");

    Yank.releaseAllConnectionPools();

    logger.info("Yank shutdown successfully.");
  }
}
