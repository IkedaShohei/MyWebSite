package beans;

/**ユーザー情報**/

public class UserDataBeans {

	private int userId;
	private String name;
	private String adress;
	private String loginId;
	private String password;
	private String createDate;
	private String updateDate;

	//ログイン時に使用するコンストラクタ
	public UserDataBeans(int userId,String name) {
		this.setUserId(userId);
		this.setName(name);
	}

	public UserDataBeans(String name,String adress,String loginId,String password) {
		this.setName(name);
		this.setAdress(adress);
		this.setLoginId(loginId);
		this.setPassword(password);
	}

	public UserDataBeans(int userId,String name,String adress,String loginId,String password) {
		this.setUserId(userId);
		this.setName(name);
		this.setAdress(adress);
		this.setLoginId(loginId);
		this.setPassword(password);
	}

	//ユーザー情報の更新や詳細の表示などに使う全情報を取得するコンストラクタ
	public UserDataBeans(int userId,String name,String adress,String loginId,String password,String createDate,String updateDate) {
		this.setUserId(userId);
		this.setName(name);
		this.setAdress(adress);
		this.setLoginId(loginId);
		this.setPassword(password);
		this.setCreateDate(createDate);
		this.setUpdateDate(updateDate);
	}

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate2) {
		this.createDate = createDate2;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}


}
