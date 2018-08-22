package basket;

public class BasketItem {

	private String userName;
	private int ISBN;

	public BasketItem(String userName, int ISBN) {
		this.userName = userName;
		this.ISBN = ISBN;
	}

	public BasketItem() {}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getISBN() {
		return ISBN;
	}

	public void setISBN(int iSBN) {
		ISBN = iSBN;
	}
}
