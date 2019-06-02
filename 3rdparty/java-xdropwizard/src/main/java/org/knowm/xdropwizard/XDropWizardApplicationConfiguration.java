package org.knowm.xdropwizard;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.dropwizard.Configuration;
import java.util.List;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.knowm.dropwizard.sundial.SundialConfiguration;
import org.knowm.xdropwizard.manager.YankConfiguration;

/** @author timmolter */
public class XDropWizardApplicationConfiguration extends Configuration {

  // Hello world
  @NotEmpty @JsonProperty private String template;

  @NotEmpty @JsonProperty private String defaultName = "Stranger";

  public String getTemplate() {

    return template;
  }

  public String getDefaultName() {

    return defaultName;
  }

  // Sundial
  @Valid @NotNull public SundialConfiguration sundialConfiguration = new SundialConfiguration();

  @JsonProperty("sundial")
  public SundialConfiguration getSundialConfiguration() {

    return sundialConfiguration;
  }

  // Yank
  @Valid
  @JsonProperty("yank")
  protected List<YankConfiguration> yankConfigurations;

  public List<YankConfiguration> getYankConfiguration() {

    return yankConfigurations;
  }
}
