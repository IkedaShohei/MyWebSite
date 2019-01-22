package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import base.DBmanager;
import beans.BuyDetailDataBeans;
import beans.ItemDataBeans;

public class BuyDetailDAO {


	Connection conn = null;

	/**buy_idとitem_idをINSURTするDAO**/

	public static void insurtBuyDetail(BuyDetailDataBeans bddb) {
		// TODO 自動生成されたメソッド・スタブ
		Connection conn = null;

		try {
			conn = DBmanager.getConnection();

			String sql = "INSERT INTO buy_detail(buy_id,item_id) VALUES(?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bddb.getBuyId());
			ps.setInt(2, bddb.getItemId());
			//何も返さないからリザルトセットはいらない
			ps.executeUpdate();

			//確認用
			System.out.println("buyDetail INSURT OK!!!");

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
	}

	public static ArrayList<ItemDataBeans> getItemDataBeansListByBuyId(int buyId) {
		// TODO 自動生成されたメソッド・スタブ
		Connection conn = null;
		ArrayList<ItemDataBeans> buyDetailItemList = null;

		try {
			conn = DBmanager.getConnection();

			String sql = "SELECT item.item_id,"
					+ " item.name,"
					+ " item.price"
					+ " FROM buy_detail"
					+ " JOIN item"
					+ " ON buy_detail.item_id = item.item_id"
					+ " WHERE buy_detail.buy_id = ?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, buyId);
			ResultSet rs = ps.executeQuery();

			buyDetailItemList = new ArrayList<ItemDataBeans>();

			while (rs.next()) {
				ItemDataBeans idb = new ItemDataBeans();
				idb.setItemId(rs.getInt("item_id"));
				idb.setName(rs.getString("name"));
				idb.setPrice(rs.getInt("price"));

				buyDetailItemList.add(idb);
			}

			System.out.println("SELECT BuyDataBeansList by BuyID OK!!!");


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

		return buyDetailItemList;

	}



}
