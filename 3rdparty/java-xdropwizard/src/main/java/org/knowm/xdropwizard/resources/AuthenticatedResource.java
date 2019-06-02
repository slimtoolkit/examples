package org.knowm.xdropwizard.resources;

import io.dropwizard.auth.Auth;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import org.knowm.xdropwizard.api.RandomNumber;
import org.knowm.xdropwizard.business.User;

/** @author timmolter */
@Path("authenticated")
@Produces(MediaType.APPLICATION_JSON)
public class AuthenticatedResource {

  @GET
  public RandomNumber getRandom(@Auth User user) {

    return new RandomNumber();
  }
}
