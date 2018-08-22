package basketTest;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import basket.BasketItem;

public class BasketItemTest {

	@Test
	public void testGetISBN() {
		BasketItem basketItem = new BasketItem("", 444);
		assertEquals("Incorrect value for ISBN", 444, basketItem.getISBN());
	}

	@Test
	public void testGetUsername() {
		BasketItem basketItem = new BasketItem("Test", 0);
		assertEquals("Incorrect value for userName.", "Test", basketItem.getUserName());
	}

	@Test
	public void testSetISBN() {
		BasketItem basketItem = new BasketItem();
		basketItem.setISBN(4444);
		assertEquals("Incorrect value for ISBN", 4444, basketItem.getISBN());
	}

	@Test
	public void testSetUserName() {
		BasketItem basketItem = new BasketItem();
		basketItem.setUserName("Test");
		assertEquals("Incorrect value for userName.", "Test", basketItem.getUserName());
	}

}
