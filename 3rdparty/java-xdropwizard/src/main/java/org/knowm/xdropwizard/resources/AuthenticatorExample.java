package org.knowm.xdropwizard.resources;

import io.dropwizard.auth.AuthenticationException;
import io.dropwizard.auth.Authenticator;
import io.dropwizard.auth.basic.BasicCredentials;
import java.util.Optional;
import org.knowm.xdropwizard.business.User;

/** @author timmolter */
public class AuthenticatorExample implements Authenticator<BasicCredentials, User> {
  @Override
  public Optional<User> authenticate(BasicCredentials credentials) throws AuthenticationException {
    if ("Kgfgusd3450m_88".equals(credentials.getPassword())) {
      return Optional.of(new User(credentials.getUsername()));
    }
    return Optional.empty();
  }
}
