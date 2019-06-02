package org.knowm.xdropwizard.business;

import java.util.List;
import org.knowm.yank.Yank;

/**
 * DAO (Data Access Object) Class for BOOKS table. <br>
 * This is where you create your own methods for SQL interaction with a database table.<br>
 * Each table in your database should have it's own DAO Class.<br>
 *
 * @author timmolter
 */
public class BooksDAO {

  /**
   * This method demonstrates:
   *
   * <ul>
   *   <li>executing an SQL statement with DBProxy.executeSQL
   *   <li>using a prepared statement with corresponding params
   * </ul>
   */
  public static int insertBook(Book book) {

    Object[] params = new Object[] {book.getTitle(), book.getAuthor(), book.getPrice()};
    String SQL = "INSERT INTO BOOKS  (TITLE, AUTHOR, PRICE) VALUES (?, ?, ?)";
    return Yank.execute(SQL, params);
  }

  /**
   * This method demonstrates:
   *
   * <ul>
   *   <li>querying a table for a list of Objects, in this case Book objects, using
   *       DBProxy.queryObjectListSQL
   *   <li>using a non-prepared statement with null params
   * </ul>
   */
  public static List<Book> selectAllBooks() {

    String SQL = "SELECT * FROM BOOKS";
    return Yank.queryBeanList(SQL, Book.class, null);
  }

  /**
   * This method demonstrates:
   *
   * <ul>
   *   <li>querying a table for a list of Strings, in this case Book titles, using
   *       DBProxy.queryObjectListSQL
   *   <li>using a non-prepared statement with null params
   * </ul>
   */
  public static List<String> selectAllBookTitles() {

    String SQL = "SELECT TITLE FROM BOOKS";
    String columnName = "title";
    return Yank.queryColumn(SQL, columnName, String.class, null);
  }

  /**
   * This method demonstrates:
   *
   * <ul>
   *   <li>executing a batch insert statement using DBProxy.executeBatchSQL
   *   <li>using a prepared statement with corresponding params
   * </ul>
   */
  public static int[] insertBatch(List<Book> books) {

    Object[][] params = new Object[books.size()][];

    for (int i = 0; i < books.size(); i++) {
      Book book = books.get(i);
      params[i] = new Object[] {book.getTitle(), book.getAuthor(), book.getPrice()};
    }

    String SQL = "INSERT INTO BOOKS  (TITLE, AUTHOR, PRICE) VALUES (?, ?, ?)";
    return Yank.executeBatch(SQL, params);
  }

  /**
   * This method demonstrates:
   *
   * <ul>
   *   <li>the advanced feature of using an SQL Key corresponding to an actual SQL statement stored
   *       in a Properties file using DBProxy.executeSQLKey
   *   <li>using a non-prepared statement with null params
   * </ul>
   */
  public static int createBooksTable() {

    String sqlKey = "BOOKS_CREATE_TABLE";
    return Yank.executeSQLKey(sqlKey, null);
  }

  /**
   * This method demonstrates:
   *
   * <ul>
   *   <li>the advanced feature of using an SQL Key corresponding to an actual SQL statement stored
   *       in a Properties file using DBProxy.querySingleObjectSQLKey
   *   <li>using a prepared statement with corresponding params
   * </ul>
   */
  public static Book selectBook(String title) {

    Object[] params = new Object[] {title};

    String sqlKey = "BOOKS_SELECT_BY_TITLE";
    return Yank.queryBeanSQLKey(sqlKey, Book.class, params);
  }

  /**
   * This method demonstrates:
   *
   * <ul>
   *   <li>the advanced feature of using an SQL Key corresponding to an actual SQL statement stored
   *       in a Properties file using DBProxy.queryGenericObjectArrayListSQLKey
   *   <li>using a non-prepared statement with null params
   *   <li>querying for a List of Objects representing all columns in a table
   * </ul>
   */
  public static List<Object[]> getTableStatus() {

    String sqlKey = "BOOKS_SELECT_TABLE_STATUS";
    return Yank.queryObjectArraysSQLKey(sqlKey, null);
  }

  /**
   * This method demonstrates:
   *
   * <ul>
   *   <li>using a non-prepared statement with null params
   *   <li>querying for a Scalar value the row count of a table
   * </ul>
   */
  public static long getNumBooks() {

    String SQL = "SELECT COUNT(*) FROM BOOKS";
    return Yank.queryScalar(SQL, Long.class, null);
  }

  public static Book selectRandomBook() {

    String sqlKey = "BOOKS_SELECT_RANDOM_BOOK";
    return Yank.queryBeanSQLKey(sqlKey, Book.class, null);
  }
}
