package org.knowm.xdropwizard.business;

/** @author timmolter */
public class User implements java.security.Principal {

  private final String name;

  /**
   * Constructor
   *
   * @param name
   */
  public User(String name) {
    this.name = name;
  }

  @Override
  public String getName() {
    return name;
  }
}
