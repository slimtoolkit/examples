package org.knowm.xdropwizard.manager;

import com.fasterxml.jackson.annotation.JsonProperty;

public class YankConfiguration {

  @JsonProperty private String poolName;

  @JsonProperty private String dbPropsFileName;

  @JsonProperty private String sqlPropsFileName;

  public String getPoolName() {
    return poolName;
  }

  public String getDbPropsFileName() {

    return dbPropsFileName;
  }

  public String getSqlPropsFileName() {

    return sqlPropsFileName;
  }
}
