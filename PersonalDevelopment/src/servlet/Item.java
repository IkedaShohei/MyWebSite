package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.ItemDataBeans;
import beans.reviewDataBeans;
import dao.ItemDAO;
import dao.ReviewDAO;

/**
 * Servlet implementation class Item
 */
@WebServlet("/Item")
public class Item extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Item() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//文字化け防止
		response.setContentType("text/html; charset=UTF-8");

		//インスタンスを取得してセッションがあるか比べる準備
		HttpSession session = request.getSession();

		//もしセッションがなかったらログイン画面にリダイレクト
		if(session.getAttribute("udb") == null) {
			response.sendRedirect("http://localhost:8080/PersonalDevelopment/Login");
			return;
		}

		String itemId1 = request.getParameter("item_id");
		int itemId = Integer.parseInt(itemId1);

		//アイテム情報を取得してセット
		ItemDAO itemDao = new ItemDAO();
		ItemDataBeans idb = itemDao.selectByItemId(itemId);

		request.setAttribute("idb", idb);

		//アイテムの評価平均を取得してセット
		String itemAvg = ReviewDAO.getItemRatingAverage(itemId);
		request.setAttribute("itemAvg", itemAvg);

		//レビューを取得してセット
		ArrayList<reviewDataBeans> reviewDataBeansList = ReviewDAO.getReviewDataBeansListByItemId(itemId);

		request.setAttribute("reviewDataBeansList", reviewDataBeansList);

		//アイテム詳細画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/item.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//レビューソート機能

		String itemIdStr = request.getParameter("item_id");
		int itemId = Integer.parseInt(itemIdStr);
		String sortMenu = request.getParameter("sort");

		//アイテム情報を取得してセット
		ItemDAO itemDao = new ItemDAO();
		ItemDataBeans idb = itemDao.selectByItemId(itemId);
		request.setAttribute("idb", idb);

		//アイテムの評価平均を取得してセット
		String itemAvg = ReviewDAO.getItemRatingAverage(itemId);
		request.setAttribute("itemAvg", itemAvg);

		//ソートされたレビューリストを取得してセット
		ArrayList<reviewDataBeans> reviewDataBeansList = ReviewDAO.getSortReviewList(itemId, sortMenu);
		request.setAttribute("reviewDataBeansList", reviewDataBeansList);

		//アイテム詳細画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/item.jsp");
		dispatcher.forward(request, response);

	}

}
