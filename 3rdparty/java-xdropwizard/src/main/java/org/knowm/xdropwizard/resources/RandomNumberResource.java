package org.knowm.xdropwizard.resources;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import org.knowm.xdropwizard.api.RandomNumber;

/** @author timmolter */
@Path("random")
@Produces(MediaType.APPLICATION_JSON)
public class RandomNumberResource {

  @GET
  public RandomNumber getRandom() {

    return new RandomNumber();
  }
}
