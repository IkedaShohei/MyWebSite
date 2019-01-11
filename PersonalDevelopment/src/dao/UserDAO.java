package dao;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.xml.bind.DatatypeConverter;

import base.DBmanager;
import beans.UserDataBeans;

public class UserDAO {

	//ログイン用のメソッド
	public UserDataBeans loginByLIAndPWGetIDAndName(String loginId, String password){
		Connection conn = null;

		try {
		conn = DBmanager.getConnection();

		String sql = "SELECT * FROM user WHERE login_id = ? and login_password = ?";

			String passwordCode = encryption(password);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, loginId);
			ps.setString(2, passwordCode);
			ResultSet rs = ps.executeQuery();

			if (!rs.next()) {
	            return null;
	        }

			int userId = rs.getInt("user_id");
			String name = rs.getString("name");

			return  new UserDataBeans(userId,name);

		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
			return null;
		}finally {
			//closeメソッドでデータベースを切断する
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    return null;
                }
            }
		}
	}

	public UserDataBeans getDetailById(int id){
		Connection conn = null;
		UserDataBeans udb = null;

		try {
			//データベースに接続
			conn = DBmanager.getConnection();

			//user_idが一致するを条件にSELECT
			String sql = "SELECT * FROM user WHERE user_id = ?";

			//SELECTを実行して、結果を取得
			//変数rsに取得した行をexecuteQueryメソッドでセット
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, id);
			ResultSet rs = pStmt.executeQuery();

			//結果表に格納されたレコードの内容をwhileを回してそれぞれ変数に入れていく
			//getI~の中身はカラム名
			//これは1人分なのでif文でもいい
			while(rs.next()){
				int userId = rs.getInt("user_id");
				String name = rs.getString("name");
				String adress = rs.getString("adress");
				String loginId = rs.getString("login_id");
				String loginPassword = rs.getString("login_password");
				String createDate = rs.getString("create_date");
				String updateDate = rs.getString("update_date");
				//Beansのインスタンスを生成してコンストラクタ発動
				udb = new UserDataBeans(userId,name,adress,loginId,loginPassword,createDate,updateDate);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}finally{
			//データベースを切断する
			//finallyは例外をキャッチした場合もしてない場合も必ず実行する
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO: handle exception
					e.printStackTrace();
					return null;
				}
			}
		}
		return udb;
		}

	public void userUpDate(int userId,String userName,String adress,String password) {
		Connection conn = null;

		try {
		conn = DBmanager.getConnection();

		String sql = "UPDATE user SET name =?,adress = ?,login_password = ? WHERE user_id = ?";

		String passwordCode = encryption(password);
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, userName);
		ps.setString(2, adress);
		ps.setString(3, passwordCode);
		ps.setInt(4, userId);
		ps.executeUpdate();

		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}finally{
			//データベースを切断する
			//finallyは例外をキャッチした場合もしてない場合も必ず実行する
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO: handle exception
					e.printStackTrace();
					return;
				}
			}
		}
	}

//	暗号化するメソッド
//	・String型の変数を暗号化して戻り値でString型の文字列で返す。
//	・それを登録、更新、ログインの際に呼び出してからそれぞれのメソッドを呼び出す。
//	 @throws NoSuchAlgorithmException

	public String encryption(String password){
		//ハッシュを生成したい元の文字列
		String source = password;
		//ハッシュ生成前にバイト配列に置き換える際のCharset
		Charset charset = StandardCharsets.UTF_8;
		//ハッシュアルゴリズム
		String algorithm = "MD5";

		//ハッシュ生成処理
		byte[] bytes = null;
		try {
			bytes = MessageDigest.getInstance(algorithm).digest(source.getBytes(charset));
		} catch (NoSuchAlgorithmException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		String result = DatatypeConverter.printHexBinary(bytes);
		System.out.println(result);

		return result;

	}
}
