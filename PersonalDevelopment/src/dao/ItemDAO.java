package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
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

			//もしsearchWordに文字が入っていたらitemのnameとdetailから部分一致検索
			if (searchWord.length() != 0) {
				sql += " WHERE name LIKE '%"+searchWord+"%' OR detail LIKE '%"+searchWord+"%'";
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
			String sql ="SELECT * FROM item"
								+ " JOIN user"
								+ " ON item.add_user_id = user.user_id"
								+ " WHERE item.item_id = ?;";

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
			Date addDate = rs.getDate("add_time");
			String addUserName = rs.getString("user_name");



			idb = new ItemDataBeans(item_id, name, detail, price, stock, fileName, userId, addDate, addUserName);

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



	public static void insertItem(String itemName,String itemDetail,int itemPrice,int itemStock, String fileName,int userId) {
		Connection conn= null;

		try {
			conn = DBmanager.getConnection();

			String sql = "INSERT INTO item(name,detail,price,stock,file_name,add_user_id,add_time)"
			+ " VALUE(?,?,?,?,?,?,now());";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, itemName);
			ps.setString(2, itemDetail);
			ps.setInt(3, itemPrice);
			ps.setInt(4, itemStock);
			ps.setString(5, fileName);
			ps.setInt(6,userId);
			ps.executeUpdate();

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
	}

	public static ArrayList<ItemDataBeans> getitemDataBeansListByUserId(int userId) {
		// TODO 自動生成されたメソッド・スタブ
		Connection conn = null;
		ArrayList<ItemDataBeans> itemDataBeansList = null;

		try {
			conn = DBmanager.getConnection();

			String sql = "SELECT * FROM item WHERE add_user_id = ?"
					+ " ORDER BY add_time DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();

			itemDataBeansList = new ArrayList<ItemDataBeans>();

			while (rs.next()) {
				ItemDataBeans idb = new ItemDataBeans();
				idb.setItemId(rs.getInt("item_id"));
				idb.setAddDate(rs.getDate("add_time"));

				itemDataBeansList.add(idb);
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
		return itemDataBeansList;
	}

	public static ArrayList<ItemDataBeans> selectAllItem() {
		// TODO 自動生成されたメソッド・スタブ
		Connection conn = null;
		ArrayList<ItemDataBeans> allItemBeansList = new ArrayList<ItemDataBeans>();

		try {
			conn = DBmanager.getConnection();

			String sql ="SELECT * FROM item"
								+ " JOIN user"
								+ " ON item.add_user_id = user.user_id";

			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int item_id = rs.getInt("item_id");
				String name = rs.getString("name");
				String detail = rs.getString("detail");
				int price = rs.getInt("price");
				int stock = rs.getInt("stock");
				String fileName = rs.getString("file_name");
				int userId = rs.getInt("add_user_id");
				Date addDate = rs.getDate("add_time");
				String addUserName = rs.getString("user_name");

				ItemDataBeans idb = new ItemDataBeans(item_id, name, detail, price, stock, fileName, userId, addDate, addUserName);
				allItemBeansList.add(idb);
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
		return allItemBeansList;
	}

	public static void updateItem(String itemName, String itemDetail, int itemPrice, int userId, String name, int itemId) {
		// TODO 自動生成されたメソッド・スタブ
		Connection conn = null;

		try {
			conn= DBmanager.getConnection();

			String sql ="UPDATE item SET name = ?,detail = ?,price = ?,userId = ?,file_name = ? WHERE item_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, itemName);
			ps.setString(2, itemDetail);
			ps.setInt(3, itemPrice);
			ps.setInt(4, userId);
			ps.setString(5, name);
			ps.setInt(6, itemId);
			ps.executeUpdate();


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
	}

	public static void deleteItemByItemId(int itemId) {
		// TODO 自動生成されたメソッド・スタブ
		Connection conn = null;

		try {
			String sql = "DELETE FROM item WHERE item_id = ?";

			conn = DBmanager.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, itemId);
			ps.executeUpdate();

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
	}

	public static double getItemCount(String searchWord) throws SQLException {
		Connection conn = null;
		double coung = 0.0;
		PreparedStatement st = null;
		try {
			conn = DBmanager.getConnection();
			st = conn.prepareStatement("select count(*) as cnt from item where name LIKE ? OR detail LIKE ?");
			st.setString(1, "%" + searchWord + "%");
			st.setString(2, "%" + searchWord + "%");
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				coung = Double.parseDouble(rs.getString("cnt"));
			}
			return coung;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (conn != null) {
				conn.close();
			}
		}
		return coung;
}

	//購入した商品の在庫数を減らす
	public static void reduceStock(int itemId) {
		Connection conn = null;

		try {
			conn = DBmanager.getConnection();

			String sql = "UPDATE item SET stock = stock-1 WHERE item_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, itemId);
			ps.executeUpdate();

			System.out.println("Item stock reduce OK!!");

		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO 自動生成された catch ブロック
					e.printStackTrace();
				}
			}
		}
	}

	public static List<ItemDataBeans> defaultSearch() {
		Connection conn = null;
		List<ItemDataBeans> DefaultItemList = new ArrayList<>();

		try {
			conn = DBmanager.getConnection();

			String sql ="SELECT * FROM item";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int itemId = rs.getInt("item_id");
				String name = rs.getString("name");
				String detail = rs.getString("detail");
				int price = rs.getInt("price");
				int stock = rs.getInt("stock");
				String fileName = rs.getString("file_name");
				int userId = rs.getInt("add_user_id");

				ItemDataBeans idb = new ItemDataBeans(itemId, name, detail, price, stock, fileName, userId);
				DefaultItemList.add(idb);
			}

		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO 自動生成された catch ブロック
					e.printStackTrace();
				}
			}
		}


		return DefaultItemList;
	}
}
