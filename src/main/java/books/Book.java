package books;

import java.sql.Date;
import java.util.List;

public class Book {

	public static class BookBuilder {

		private int ISBN;
		private String title;
		private String author;
		private String synopsis = "";
		private Date releaseDate;
		private boolean eBook;
		private int quantity;
		private double price;
		private Genre genre;
		private String edition;
		private Fictional fictional;
		private List<Review> reviews;

		public BookBuilder Author(String author) {
			this.author = author;
			return this;
		}

		public Book buildBook() {
			return new Book(this.ISBN, this.title, this.author, this.synopsis, this.releaseDate, this.eBook,
					this.quantity, this.price, this.genre, this.edition, this.fictional, this.reviews);
		}

		public BookBuilder eBook(boolean eBook) {
			this.eBook = eBook;
			return this;
		}

		public BookBuilder Edition(String edition) {
			this.edition = edition;
			return this;
		}

		public BookBuilder Fictional(Fictional fictional) {
			this.fictional = fictional;
			return this;
		}

		public BookBuilder Genre(Genre genre) {
			this.genre = genre;
			return this;
		}

		public BookBuilder ISBN(int iSBN) {
			ISBN = iSBN;
			return this;
		}

		public BookBuilder Price(double price) {
			this.price = price;
			return this;
		}

		public BookBuilder Quantity(int quantity) {
			this.quantity = quantity;
			return this;
		}

		public BookBuilder ReleaseDate(Date releaseDate) {
			this.releaseDate = releaseDate;
			return this;
		}

		public BookBuilder Reviews(List<Review> reviews) {
			this.reviews = reviews;
			return this;
		}

		public BookBuilder Synopsis(String synopsis) {
			this.synopsis = synopsis;
			return this;
		}

		public BookBuilder Title(String title) {
			this.title = title;
			return this;
		}
	}

	private int ISBN;
	private String title;
	private String author;
	private String synopsis;
	private Date releaseDate;
	private boolean eBook;
	private int quantity;
	private double price;
	private Genre genre;
	private String edition;
	private Fictional fictional;
	private List<Review> reviews;
	
	public Book() {}

	public Book(int iSBN, String title, String author, String synopsis, Date releaseDate, boolean eBook,
			int quantity, double price, Genre genre, String edition, Fictional fictional, List<Review> reviews) {
		ISBN = iSBN;
		this.title = title;
		this.author = author;
		this.synopsis = synopsis;
		this.releaseDate = releaseDate;
		this.eBook = eBook;
		this.quantity = quantity;
		this.price = price;
		this.genre = genre;
		this.edition = edition;
		this.fictional = fictional;
		this.reviews = reviews;
	}

	public String getAuthor() {
		return author;
	}

	public String getEdition() {
		return edition;
	}

	public Fictional getFictional() {
		return fictional;
	}

	public Genre getGenre() {
		return genre;
	}

	public int getISBN() {
		return ISBN;
	}

	public double getPrice() {
		return price;
	}

	public int getQuantity() {
		return quantity;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public String getSynopsis() {
		return synopsis;
	}

	public String getTitle() {
		return title;
	}

	public boolean isEBook() {
		return eBook;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public void seteBook(boolean eBook) {
		this.eBook = eBook;
	}

	public void setEdition(String edition) {
		this.edition = edition;
	}

	public void setFictional(Fictional fictional) {
		this.fictional = fictional;
	}

	public void setGenre(Genre genre) {
		this.genre = genre;
	}

	public void setISBN(int iSBN) {
		ISBN = iSBN;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}

	public void setTitle(String title) {
		this.title = title;
	}
}
