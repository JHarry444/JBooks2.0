package books;

import java.sql.Timestamp;

public class Review {

	private int id;
	private int isbn;
	private String username;
	private String review;
	private int rating;
	private Timestamp time;

	public Review(int id, int isbn, int rating, String review, Timestamp time, String username) {
		this.id = id;
		this.isbn = isbn;
		this.username = username;
		this.review = review;
		this.rating = rating;
		this.time = time;
	}
	
	public Review() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIsbn() {
		return isbn;
	}

	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public Timestamp getTimestamp() {
		return time;
	}

	public void setTimestamp(Timestamp time) {
		this.time = time;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

}
