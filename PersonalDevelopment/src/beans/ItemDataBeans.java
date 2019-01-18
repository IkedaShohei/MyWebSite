package beans;

/**商品の情報**/

public class ItemDataBeans {

	private int itemId;
	private String name;
	private String detail;
	private int price;
	private int stock;
	private String fileName;
	private int userId;

	public ItemDataBeans(int itemId,String name,String detail,int price,int stock,String fileName,int userId) {
		this.setItemId(itemId);
		this.setName(name);
		this.setDetail(detail);
		this.setPrice(price);
		this.setStock(stock);
		this.setFileName(fileName);
		this.setUserId(userId);
	}

	public ItemDataBeans() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}

}
