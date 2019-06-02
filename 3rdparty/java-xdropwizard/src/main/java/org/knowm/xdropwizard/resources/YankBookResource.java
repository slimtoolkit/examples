package org.knowm.xdropwizard.resources;

import java.util.List;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import org.knowm.xdropwizard.business.Book;
import org.knowm.xdropwizard.business.BooksDAO;

/** @author timmolter */
@Path("book")
@Produces(MediaType.APPLICATION_JSON)
public class YankBookResource {

  @GET
  @Path("random")
  public Book getRandomBook() {

    return BooksDAO.selectRandomBook();
  }

  @GET
  @Path("all")
  public List<Book> getAllBooks() {

    return BooksDAO.selectAllBooks();
  }
}
