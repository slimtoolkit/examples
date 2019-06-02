package org.knowm.xdropwizard.business;

/**
 * A class used to represent rows in the BOOKS table <br>
 * Note: class member naming tip: data type and name must match SQL table!<br>
 * Note: DBUtils uses reflection to match column names to class member names. <br>
 * Class members are matched to columns based on several factors:
 *
 * <ul>
 *   <li>set* methods that match the table's column names (i.e. title <--> setTitle()). The name
 *       comparison is case insensitive.
 *   <li>The columns are matched to the object's class members
 *   <li>If the conversion fails (i.e. the property was an int and the column was a Timestamp) an
 *       SQLException is thrown.
 * </ul>
 *
 * @author timmolter
 */
public class Book {

  private String title;
  private String author;
  private double price;

  /**
   * Pro-tip: In Eclipse, generate all getters and setters after defining class fields: Right-click
   * --> Source --> Generate Getters and Setters...
   */
  public String getTitle() {

    return title;
  }

  public void setTitle(String title) {

    this.title = title;
  }

  public String getAuthor() {

    return author;
  }

  public void setAuthor(String author) {

    this.author = author;
  }

  public double getPrice() {

    return price;
  }

  public void setPrice(double price) {

    this.price = price;
  }

  /**
   * Pro-tip: In Eclipse, generate a toString() method for a class: Right-click --> Source -->
   * Generate toString()...
   */
  @Override
  public String toString() {

    return "Book [title=" + title + ", author=" + author + ", price=" + price + "]";
  }
}
