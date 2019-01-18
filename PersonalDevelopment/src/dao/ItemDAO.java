package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import base.DBmanager;
import beans.ItemDataBeans;

public class ItemDAO {
	public List<ItemDataBeans> searchItemsBySearchWord(String searchWord) {

		Connection conn = null;
		List<ItemDataBeans> itemList = new ArrayList<ItemDataBeans>();

		try {
			conn = DBmanager.getConnection();

			//全てのアイテムを取ってくるsql文
			String sql = "SELECT * FROM item";

			//もしsearchWordに文字が入っていたら
			if (searchWord.length() != 0) {
				sql += " WHERE name LIKE '%"+searchWord+"%'";
			}

			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);

			while(rs.next()) {
				int itemId = rs.getInt("item_id");
				String name = rs.getString("name");
				String detail = rs.getString("detail");
				int price = rs.getInt("price");
				int stock = rs.getInt("stock");
				String fileName = rs.getString("file_name");
				int userId = rs.getInt("add_user_id");

				ItemDataBeans idb = new ItemDataBeans(itemId, name, detail, price, stock, fileName, userId);
				itemList.add(idb);
			}
		} catch (SQLException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
		}finally {
			//closeメソッドでデータベースを切断する
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
		}
		return itemList;
	}

	public ItemDataBeans selectByItemId(int itemId) {

		Connection conn = null;
		ItemDataBeans idb = new ItemDataBeans();

		try {
			conn = DBmanager.getConnection();
			String sql ="SELECT * FROM item WHERE item_id = ?";

			PreparedStatement ps;
			ps = conn.prepareStatement(sql);
			ps.setInt(1, itemId);
			ResultSet rs = ps.executeQuery();

			if(!rs.next()) {
				return null;
			}

			int item_id = rs.getInt("item_id");
			String name = rs.getString("name");
			String detail = rs.getString("detail");
			int price = rs.getInt("price");
			int stock = rs.getInt("stock");
			String fileName = rs.getString("file_name");
			int userId = rs.getInt("add_user_id");

			idb = new ItemDataBeans(item_id, name, detail, price, stock, fileName, userId);

		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}finally {
			//closeメソッドでデータベースを切断する
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
		}
		return idb;
	}
}
