package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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

			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int deliveryMethodId = rs.getInt("delivery_method_id");
				String name = rs.getNString("name");
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



}
