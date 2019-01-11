package base;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBmanager {
	private static String url = "jdbc:mysql://localhost/";
	private static String dbName = "PDdb?useUnicode=true&characterEncoding=utf8";
	private static String user = "root";
	private static String pass ="password";

	//スライド3-6-5,3-6-12参照
	//Connection型の変数conを用意
	//DriverManager.getConnectionでコネクションを取得してconに代入
	//それをリターン

	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url+dbName,user,pass);
		} catch (SQLException | ClassNotFoundException e) {
			// TODO: handle exception
			 e.printStackTrace();
		}
		return con;

	}
}
