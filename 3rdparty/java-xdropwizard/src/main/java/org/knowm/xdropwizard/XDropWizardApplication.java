package org.knowm.xdropwizard;

import io.dropwizard.Application;
import io.dropwizard.assets.AssetsBundle;
import io.dropwizard.auth.AuthDynamicFeature;
import io.dropwizard.auth.AuthValueFactoryProvider;
import io.dropwizard.auth.basic.BasicCredentialAuthFilter;
import io.dropwizard.forms.MultiPartBundle;
import io.dropwizard.lifecycle.ServerLifecycleListener;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;
import io.dropwizard.views.ViewBundle;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.jetty.server.Server;
import org.glassfish.jersey.server.filter.RolesAllowedDynamicFeature;
import org.knowm.dropwizard.sundial.SundialBundle;
import org.knowm.dropwizard.sundial.SundialConfiguration;
import org.knowm.xdropwizard.business.Book;
import org.knowm.xdropwizard.business.BooksDAO;
import org.knowm.xdropwizard.business.User;
import org.knowm.xdropwizard.health.TemplateHealthCheck;
import org.knowm.xdropwizard.manager.YankManager;
import org.knowm.xdropwizard.resources.AuthenticatorExample;
import org.knowm.xdropwizard.resources.HelloWorldResource;
import org.knowm.xdropwizard.resources.YankBookResource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/** @author timmolter */
public class XDropWizardApplication extends Application<XDropWizardApplicationConfiguration> {

  private final Logger logger = LoggerFactory.getLogger(XDropWizardApplication.class);

  public static void main(String[] args) throws Exception {

    new XDropWizardApplication().run(args);
  }

  @Override
  public void initialize(Bootstrap<XDropWizardApplicationConfiguration> bootstrap) {

    bootstrap.addBundle(new AssetsBundle("/assets/", "/"));
    bootstrap.addBundle(new ViewBundle<XDropWizardApplicationConfiguration>());

    bootstrap.addBundle(
        new SundialBundle<XDropWizardApplicationConfiguration>() {

          @Override
          public SundialConfiguration getSundialConfiguration(
              XDropWizardApplicationConfiguration configuration) {
            return configuration.getSundialConfiguration();
          }
        });

    // for use with `dropwizard-forms`
    bootstrap.addBundle(new MultiPartBundle());
  }

  @Override
  public void run(XDropWizardApplicationConfiguration configuration, Environment environment)
      throws Exception {

    logger.info("running DropWizard!");

    // Add object to ServletContext for accessing from Sundial Jobs
    environment.getApplicationContext().setAttribute("MyKey", "MyObject");

    final String template = configuration.getTemplate();
    final String defaultName = configuration.getDefaultName();
    environment.jersey().register(new HelloWorldResource(template, defaultName));
    environment.healthChecks().register("TemplateHealth", new TemplateHealthCheck(template));

    // MANAGERS /////////////////////////

    // Yank
    YankManager ym =
        new YankManager(configuration.getYankConfiguration()); // A DropWizard Managed Object
    environment.lifecycle().manage(ym); // Assign the management of the object to the Service
    environment.jersey().register(new YankBookResource());

    // TASKS ////////////////////////////
    // tasks are things that should run triggered by a POST, but don't need to respond
    // none

    // RESOURCES ////////////////////////////

    //    environment.jersey().register(new XChartResource());
    //    environment.jersey().register(new ViewBookResource());
    //    environment.jersey().register(new ViewMarkdownResource());
    //    environment.jersey().register(new RandomNumberResource());

    environment.jersey().packages("org.knowm.xdropwizard.resources");

    // AUTHENTICATION /////////////////////////

    environment
        .jersey()
        .register(
            new AuthDynamicFeature(
                new BasicCredentialAuthFilter.Builder<User>()
                    .setAuthenticator(new AuthenticatorExample())
                    .setRealm("SUPER SECRET STUFF")
                    .buildAuthFilter()));
    environment.jersey().register(RolesAllowedDynamicFeature.class);
    // If you want to use @Auth to inject a custom Principal type into your resource
    environment.jersey().register(new AuthValueFactoryProvider.Binder<>(User.class));

    // DO THIS AFTER THE WEBAPP HAS BEEN STARTED UP!!!
    environment
        .lifecycle()
        .addServerLifecycleListener(
            new ServerLifecycleListener() {
              @Override
              public void serverStarted(Server server) {

                /// The below code is just to create some dummy data in an in-memory DB for use
                // later by the REST API. See YankBookResource.

                // put some data in DB
                BooksDAO.createBooksTable();

                List<Book> books = new ArrayList<Book>();

                Book book = new Book();
                book.setTitle("Cryptonomicon");
                book.setAuthor("Neal Stephenson");
                book.setPrice(23.99);
                books.add(book);

                book = new Book();
                book.setTitle("Harry Potter");
                book.setAuthor("Joanne K. Rowling");
                book.setPrice(11.99);
                books.add(book);

                book = new Book();
                book.setTitle("Don Quijote");
                book.setAuthor("Cervantes");
                book.setPrice(21.99);
                books.add(book);

                BooksDAO.insertBatch(books);
              }
            });
  }
}
