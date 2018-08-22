package booksTest;

import static org.junit.Assert.assertEquals;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import books.Book;
import books.Fictional;
import books.Genre;
import books.Review;

public class BookTest {
	@Test
	public void isEBook() {
		Book book = new Book.BookBuilder().eBook(true).buildBook();
		assertEquals("Incorrect value for is Ebook.", true, book.isEBook());
	}

	@Test
	public void testGetAuthor() {
		Book book = new Book.BookBuilder().Author("Test").buildBook();
		assertEquals("Incorrect author.", "Test", book.getAuthor());
	}

	@Test
	public void testGetEdition() {
		Book book = new Book.BookBuilder().Edition("Test").buildBook();
		assertEquals("Incorrect edition.", "Test", book.getEdition());
	}

	@Test
	public void testGetFictional() {
		Book book = new Book.BookBuilder().Fictional(Fictional.FICTION).buildBook();
		assertEquals("Incorrect value for Fictional.", Fictional.FICTION, book.getFictional());
	}

	@Test
	public void testGetGenre() {
		Book book = new Book.BookBuilder().Genre(Genre.FANTASY).buildBook();
		assertEquals("Incorrect value for genre.", Genre.FANTASY, book.getGenre());
	}

	@Test
	public void testGetISBN() {
		Book book = new Book.BookBuilder().ISBN(4444).buildBook();
		assertEquals("Incorrect ISBN", 4444, book.getISBN());
	}

	@Test
	public void testGetPrice() {
		Book book = new Book.BookBuilder().Price(44.44).buildBook();
		assertEquals("Incorrect price", 44.44, book.getPrice(), 0.1);
	}

	@Test
	public void testGetQuantity() {
		Book book = new Book.BookBuilder().Quantity(4).buildBook();
		assertEquals("Incorrect value for quantity.", 4, book.getQuantity());
	}

	@Test
	public void testGetReleaseDate() {
		Book book = new Book.BookBuilder().ReleaseDate(new Date(0)).buildBook();
		assertEquals("Incorrect date.", new Date(0), book.getReleaseDate());
	}

	@Test
	public void testGetReviews() {
		List<Review> reviews = new ArrayList<>();
		reviews.add(new Review(4, 44, 4, "gfhf", new Timestamp(4), "fr"));
		Book book = new Book.BookBuilder().Reviews(reviews).buildBook();
		assertEquals("Incorrect reviews.", reviews, book.getReviews());
	}
	

	@Test
	public void testGetSynopsis() {
		Book book = new Book.BookBuilder().Synopsis("Test").buildBook();
		assertEquals("Incorrect synopsis.", "Test", book.getSynopsis());
	}

	@Test
	public void testGetTitle() {
		Book book = new Book.BookBuilder().Title("Test").buildBook();
		assertEquals("Incorrect title.", "Test", book.getTitle());
	}

	@Test
	public void testSetAuthor() {
		Book book = new Book();
		book.setAuthor("Test");
		assertEquals("Incorrect author.", "Test", book.getAuthor());
	}

	@Test
	public void testSetEBook() {
		Book book = new Book();
		book.seteBook(true);
		assertEquals("Incorrect value for is Ebook.", true, book.isEBook());
	}

	@Test
	public void testSetEdition() {
		Book book = new Book();
		book.setEdition("first");
		assertEquals("Incorrect edition.", "first", book.getEdition());
	}

	@Test
	public void testSetFictional() {
		Book book = new Book();
		book.setFictional(Fictional.FICTION);
		assertEquals("Incorrect value for fictional.", Fictional.FICTION, book.getFictional());
	}

	@Test
	public void testSetGenre() {
		Book book = new Book();
		book.setGenre(Genre.FANTASY);
		assertEquals("Incorrect genre.", Genre.FANTASY, book.getGenre());
	}

	@Test
	public void testSetISBN() {
		Book book = new Book();
		book.setISBN(4444);
		assertEquals("Incorrect ISBN", 4444, book.getISBN());
	}

	@Test
	public void testSetPrice() {
		Book book = new Book();
		book.setPrice(44.44);
		assertEquals("Incorrect edition.", 44.44, book.getPrice(), 0.1);
	}

	@Test
	public void testSetQuantity() {
		Book book = new Book();
		book.setQuantity(44);
		assertEquals("Incorrect quantity.", 44, book.getQuantity());
	}

	@Test
	public void testSetReleaseDate() {
		Book book = new Book();
		book.setReleaseDate(new Date(0));
		assertEquals("Incorrect date.", new Date(0), book.getReleaseDate());
	}

	@Test
	
	public void testSetReviews() {
		List<Review> reviews = new ArrayList<>();
		reviews.add(new Review(4, 44, 4, "gfhf", new Timestamp(4), "fr"));
		Book book = new Book();
		book.setReviews(reviews);
		assertEquals("Incorrect reviews.", reviews, book.getReviews());
	}

	@Test
	public void testSetSynopsis() {
		Book book = new Book();
		book.setSynopsis("Test");
		assertEquals("Incorrect synopsis.", "Test", book.getSynopsis());
	}

	@Test
	public void testSetTitle() {
		Book book = new Book();
		book.setTitle("Test");
		assertEquals("Incorrect title.", "Test", book.getTitle());
	}

}
