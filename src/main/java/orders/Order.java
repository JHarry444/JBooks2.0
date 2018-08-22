package orders;

import java.sql.Timestamp;
import java.util.List;

public class Order {

	private int id;
	private String username;
	private double price;
	private Timestamp time;
	private OrderStatus orderStatus;
	private List<Integer> items;

	public Order(int id, String username, double price, Timestamp time, OrderStatus orderStatus, List<Integer> items) {
		this.id = id;
		this.username = username;
		this.price = price;
		this.time = time;
		this.orderStatus = orderStatus;
		this.items = items;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public OrderStatus getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(OrderStatus orderStatus) {
		this.orderStatus = orderStatus;
	}

	public List<Integer> getItems() {
		return items;
	}

	public void setItems(List<Integer> items) {
		this.items = items;
	}

}
