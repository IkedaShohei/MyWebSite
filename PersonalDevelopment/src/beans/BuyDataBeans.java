package beans;

import java.util.Date;

/**購入データ**/

public class BuyDataBeans {

	private int buyId;
	private int userId;
	private int totalPrice;
	private int deliveryMethod;
	private Date createDate;

	//あとから持たせたい値が出てきたら足す
	private String deliveryMethodName;
	private int deliveryMethodPrice;



	public int getBuyId() {
		return buyId;
	}
	public void setBuyId(int buyId) {
		this.buyId = buyId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getDeliveryMethod() {
		return deliveryMethod;
	}
	public void setDeliveryMethod(int deliveryMethod) {
		this.deliveryMethod = deliveryMethod;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

//	public String getFormatDate() {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日HH時mm分");
//		return sdf.format(buyDate);
//	}

	public String getDeliveryMethodName() {
		return deliveryMethodName;
	}
	public void setDeliveryMethodName(String deliveryMethodName) {
		this.deliveryMethodName = deliveryMethodName;
	}
	public int getDeliveryMethodPrice() {
		return deliveryMethodPrice;
	}
	public void setDeliveryMethodPrice(int deliveryMethodPrice) {
		this.deliveryMethodPrice = deliveryMethodPrice;
	}

}
