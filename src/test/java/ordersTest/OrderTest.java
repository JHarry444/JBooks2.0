package ordersTest;

import java.sql.Timestamp;
import java.util.Arrays;

import orders.Order;
import orders.OrderStatus;

public class OrderTest {

	private Order order = new Order(4, "test", 44.44, new Timestamp(0), OrderStatus.COMPLETE, Arrays.asList(4, 14, 24, 24, 44, 54, 64, 74, 84, 94));

}
