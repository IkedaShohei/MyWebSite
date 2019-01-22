package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import base.DBmanager;
import beans.DeliveryMethodDataBeans;

public class DeliveryMethodDAO {

	public ArrayList<DeliveryMethodDataBeans> getAllDeliveryMethodDataBeans() {
		Connection conn = null;
		ArrayList<DeliveryMethodDataBeans> DeliveryMethodDataBeansList;
		DeliveryMethodDataBeansList = new ArrayList<DeliveryMethodDataBeans>();

		try {
			conn = DBmanager.getConnection();

			String sql = "SELECT * FROM delivery_method";

			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int deliveryMethodId = rs.getInt("delivery_method_id");
				String name = rs.getString("name");
				int price = rs.getInt("price");

				DeliveryMethodDataBeans dmdb = new DeliveryMethodDataBeans(deliveryMethodId,name,price);
				DeliveryMethodDataBeansList.add(dmdb);
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
		return DeliveryMethodDataBeansList;
	}

	public static DeliveryMethodDataBeans getDeliveryMethodDataBeansByID(int delivery_method_id) {
		// TODO 自動生成されたメソッド・スタブ
		Connection conn = null;
		DeliveryMethodDataBeans dmdb = null;

		try {

			conn = DBmanager.getConnection();

			String sql = "SELECT * FROM delivery_method WHERE delivery_method_id = ?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, delivery_method_id);
			ResultSet rs = ps.executeQuery();

			if(!rs.next()) {
				return null;
			}

			int deliveryMethodId = rs.getInt("delivery_method_id");
			String name = rs.getString("name");
			int price = rs.getInt("price");

			dmdb = new DeliveryMethodDataBeans(deliveryMethodId, name, price);

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

		return dmdb;
	}




}
