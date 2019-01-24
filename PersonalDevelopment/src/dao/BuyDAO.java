package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import base.DBmanager;
import beans.BuyDataBeans;

public class BuyDAO {

	public static int insurtBuy(BuyDataBeans bdb) {
		// TODO 自動生成されたメソッド・スタブ
		Connection conn = null;
		int autoIncrementKey =-1;

		try {
			conn = DBmanager.getConnection();

			String sql = "INSERT INTO buy(user_id,total_price,delivery_method_id,create_date) VALUE(?,?,?,now())";

			//お気に入りのステートメントの自動生成キーの取り出しを参照
			//Statement.RETURN_GENERATED_KEYS 生成されたキーを検索可能にすることを示す定数。（第二引数に設置、第一引数はsql）
			PreparedStatement ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, bdb.getUserId());
			ps.setInt(2, bdb.getTotalPrice());
			ps.setInt(3, bdb.getDeliveryMethodId());
			ps.executeUpdate();

			ResultSet rs = ps.getGeneratedKeys();

			if(rs.next()) {
				//このResultSetオブジェクトの現在行にある指定された列の値を、Javaプログラミング言語のintとして取得します。
				//columnIndex - 最初の列は1、2番目の列は2となる。列は１つしかないため（）内には１を入れる。
				autoIncrementKey = rs.getInt(1);
			}

			//確認用
			System.out.println("buy INSERT OK!!!");

		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}finally{
			//データベースを切断する
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
		}
		return autoIncrementKey;
	}

	public static BuyDataBeans getBuyDataBeansByBuyId(int buyId) {
		// TODO 自動生成されたメソッド・スタブ
		Connection conn = null;
		BuyDataBeans bdb = null;

		try {
			conn = DBmanager.getConnection();

			String sql = "SELECT * FROM buy"
					+ " JOIN delivery_method"
					+ " ON buy.delivery_method_id = delivery_method.delivery_method_id"
					+ " WHERE buy.buy_id = ?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, buyId);
			ResultSet rs = ps.executeQuery();

			bdb = new BuyDataBeans();
			if(rs.next()) {
				bdb.setBuyId(rs.getInt("buy_id"));
				bdb.setUserId(rs.getInt("user_id"));
				bdb.setTotalPrice(rs.getInt("total_price"));
				bdb.setDeliveryMethodId(rs.getInt("delivery_method_id"));
				bdb.setCreateDate(rs.getDate("create_date"));
				bdb.setDeliveryMethodName(rs.getString("name"));
				bdb.setDeliveryMethodPrice(rs.getInt("price"));
			}

			System.out.println("SELECT BuyDataBeans by buyID OK!!!");

		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}finally{
			//データベースを切断する
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
		}
		return bdb;
	}

	public static ArrayList<BuyDataBeans> getBuyDataBeansListByUserId(int userId) {
		// TODO 自動生成されたメソッド・スタブ
		Connection conn = null;
		ArrayList<BuyDataBeans> buyDataBeansList = null;

		try {
			conn= DBmanager.getConnection();

			String sql = "SELECT * FROM buy"
								+ " JOIN delivery_method"
								+ " ON buy.delivery_method_id = delivery_method.delivery_method_id"
								+ " WHERE buy.user_id = ?"
								+ " ORDER BY buy.create_date DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();

			buyDataBeansList = new ArrayList<BuyDataBeans>();

			while (rs.next()) {
				BuyDataBeans bdb = new BuyDataBeans();
				bdb.setBuyId(rs.getInt("buy_id"));
				bdb.setUserId(rs.getInt("user_id"));
				bdb.setTotalPrice(rs.getInt("total_price"));
				bdb.setDeliveryMethodId(rs.getInt("delivery_method_id"));
				bdb.setCreateDate(rs.getDate("create_date"));
				bdb.setDeliveryMethodName(rs.getString("name"));
				bdb.setDeliveryMethodPrice(rs.getInt("price"));

				buyDataBeansList.add(bdb);
			}

			//セレクトができたまでの確認
			System.out.println("SELECT BuyDataBeans by buyID OK!!!");

		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}finally{
			//データベースを切断する
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
		}
		return buyDataBeansList;
	}

}
