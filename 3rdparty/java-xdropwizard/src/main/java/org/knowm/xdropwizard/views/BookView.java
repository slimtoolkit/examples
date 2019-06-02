package org.knowm.xdropwizard.views;

import com.google.common.base.Charsets;
import io.dropwizard.views.View;
import org.knowm.xdropwizard.business.Book;

/** @author timmolter */
public class BookView extends View {

  public BookView() {

    super("ftl/book.ftl", Charsets.UTF_8);
  }

  public Book getBook() {

    Book book = new Book();
    book.setTitle("Cryptonomicon");
    book.setAuthor("Neal Stephenson");
    book.setPrice(23.99);
    return book;
  }
}
