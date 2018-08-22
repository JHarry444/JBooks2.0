package booksTest;

import static org.junit.Assert.assertEquals;

import java.sql.Timestamp;

import org.junit.Test;

import books.Review;

public class ReviewTest {
	Review review = new Review(4, 44, 3, "test2", new Timestamp(0), "test");
	
	@Test
	public void testGetId() {
		assertEquals("Incorrect value for id.", 4, review.getId());
	}
	@Test
	public void testGetIsbn() {
		assertEquals("Incorrect value for isbn.", 44, review.getIsbn());
	}
	@Test
	public void testGetRating() {
		assertEquals("Incorrect value for rating.", 3, review.getRating());
	}
	@Test
	public void testGetReview() {
		assertEquals("Incorrect value for review.", "test2", review.getReview());
	}
	@Test
	public void testGetTimestamp() {
		assertEquals("Incorrect value for timestamp.", new Timestamp(0), review.getTimestamp());
	}
	@Test
	public void testGetUsername() {
		assertEquals("Incorrect value for username.", "test", review.getUsername());
	}

	@Test
	public void testSetId() {
		review.setId(44);
		assertEquals("Incorrect value for id.", 44, review.getId());
	}
	@Test
	public void testSetIsbn() {
		review.setIsbn(88);
		assertEquals("Incorrect value for isbn.", 88, review.getIsbn());
	}
	@Test
	public void testSetRating() {
		review.setRating(33);
		assertEquals("Incorrect value for rating.", 33, review.getRating());
	}
	@Test
	public void testSetReview() {
		review.setReview("test3");
		assertEquals("Incorrect value for review.", "test3", review.getReview());
	}
	@Test
	public void testSetTimestamp() {
		review.setTimestamp(new Timestamp(1000));
		assertEquals("Incorrect value for timestamp.", new Timestamp(1000), review.getTimestamp());
	}
	@Test
	public void testSetUsername() {
		review.setUsername("test5");
		assertEquals("Incorrect value for username.", "test5", review.getUsername());
	}
}
