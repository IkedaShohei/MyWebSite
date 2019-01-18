package beans;

/**配送方法**/

public class DeliveryMethodDataBeans {

	private int deliveryMethodId;
	private String name;
	private int price;


	public DeliveryMethodDataBeans(int deliveryMethodId, String name, int price) {
		this.setDeliveryMethodId(deliveryMethodId);
		this.setName(name);
		this.setPrice(price);
	}



	public int getDeliveryMethodId() {
		return deliveryMethodId;
	}
	public void setDeliveryMethodId(int deliveryMethodId) {
		this.deliveryMethodId = deliveryMethodId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

}
