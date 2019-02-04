package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import base.DBmanager;
import beans.reviewDataBeans;

public class ReviewDAO {

	public static void insertReview(int reviewerId, int reviewItemId, int raiting, String reviewTitle,String reviewContent) {
		Connection conn = null;

		try {
			conn= DBmanager.getConnection();

			String sql = "INSERT INTO review(reviewer_id,review_item_id,rating,review_title,review_content,create_date)"
						+" VALUE(?,?,?,?,?,now())";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, reviewerId);
			ps.setInt(2, reviewItemId);
			ps.setInt(3, raiting);
			ps.setString(4, reviewTitle);
			ps.setString(5, reviewContent);
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

	public static ArrayList<reviewDataBeans> getReviewDataBeansListByItemId(int reviewItemId) {
		Connection conn = null;
		ArrayList<reviewDataBeans> reviewDataBeansList = null;

		try {
			conn =DBmanager.getConnection();

			//日付の新しい順がデフォルトの表示
			String sql = "SELECT *"
					+ " FROM review"
					+ " JOIN user"
					+ " ON review.reviewer_id = user.user_id"
					+ " WHERE review.review_item_id = ?"
					+ " ORDER BY review.create_date DESC";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, reviewItemId);
			ResultSet rs = ps.executeQuery();

			reviewDataBeansList = new ArrayList<reviewDataBeans>();

			while (rs.next()) {
				reviewDataBeans rdb = new reviewDataBeans();
				rdb.setReviewId(rs.getInt("review_id"));
				rdb.setReviewerId(rs.getInt("reviewer_id"));
				rdb.setReviewItemId(rs.getInt("review_item_id"));
				rdb.setRating(rs.getInt("rating"));
				rdb.setReviewTitle(rs.getString("review_title"));
				rdb.setReviewContent(rs.getString("review_content"));
				rdb.setCreateDate(rs.getDate("create_date"));
				rdb.setReviewerName(rs.getString("user_name"));

				reviewDataBeansList.add(rdb);

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
		return reviewDataBeansList;
	}

	public static String getItemRatingAverage(int itemId) {
		// TODO 自動生成されたメソッド・スタブ
		Connection conn = null;
		String rayingAvg = null;

		try {
			conn = DBmanager.getConnection();

			String sql ="SELECT AVG(rating) * 20"
					+ " AS avg"
					+ " FROM review"
					+ " WHERE review_item_id = ?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setDouble(1, itemId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				rayingAvg = String.format("%.1f", rs.getDouble("avg"));
			}

			System.out.println("rating avg " + rayingAvg);

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

		return rayingAvg;
	}

	/**選らばれた並び替えの項目に応じて並べ替えをしたレビューのリストを渡すDAO**/

	public static ArrayList<reviewDataBeans> getSortReviewList(int itemId, String sortMenu) {
		Connection conn = null;
		ArrayList<reviewDataBeans> reviewDataBeansList = null;

		try {
			conn = DBmanager.getConnection();

			String sql ="SELECT *"
					+ " FROM review"
					+ " JOIN user"
					+ " ON review.reviewer_id = user.user_id"
					+ " WHERE review.review_item_id = ?";

			//もし選ばれたのがdateNew（日付が新しい順）だったら
			if(sortMenu.equals("dateNew")){
				sql += " ORDER BY review.create_date DESC";
			}

			//もし選ばれたのがdateOld（日付が古い順）だったら
			if(sortMenu.equals("dateOld")){
				sql += " ORDER BY review.create_date ASC";
			}

			//もし選ばれたのがevaluationHigh（評価が高い順）だったら
			if(sortMenu.equals("evaluationHigh")){
				sql += " ORDER BY review.rating DESC";
			}

			//もし選ばれたのがevaluationLow（評価が低い順）だったら
			if(sortMenu.equals("evaluationLow")){
				sql += " ORDER BY review.rating ASC";
			}

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, itemId);

			ResultSet rs = ps.executeQuery();

			reviewDataBeansList = new ArrayList<reviewDataBeans>();

			while(rs.next()) {
				reviewDataBeans rdb = new reviewDataBeans();
				rdb.setReviewId(rs.getInt("review_id"));
				rdb.setReviewerId(rs.getInt("reviewer_id"));
				rdb.setReviewItemId(rs.getInt("review_item_id"));
				rdb.setRating(rs.getInt("rating"));
				rdb.setReviewTitle(rs.getString("review_title"));
				rdb.setReviewContent(rs.getString("review_content"));
				rdb.setCreateDate(rs.getDate("create_date"));
				rdb.setReviewerName(rs.getString("user_name"));

				reviewDataBeansList.add(rdb);
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
		return reviewDataBeansList;
	}


}
