package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ItemDataBeans;
import beans.reviewDataBeans;
import dao.ItemDAO;

/**
 * Servlet implementation class ReviewAdd
 */
@WebServlet("/ReviewAdd")
public class ReviewAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String itemIdStr = request.getParameter("itemId");
		int itemId = Integer.parseInt(itemIdStr);

		ItemDAO itemDao = new ItemDAO();
		ItemDataBeans idb = itemDao.selectByItemId(itemId);

		request.setAttribute("idb", idb);

		//reviewAdd.jspにフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/reviewAdd.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		String reviewerIdStr = request.getParameter("itemId");
		int reviewerId = Integer.parseInt(reviewerIdStr);
		String reviewItemIdStr = request.getParameter("reviewerId");
		int reviewItemId= Integer.parseInt(reviewItemIdStr);
		String ratingStr = request.getParameter("rating");
		int raiting =Integer.parseInt(ratingStr);
		String reviewTitle = request.getParameter("reviewTitle");
		String reviewContent = request.getParameter("reviewContent");

		ReviewDAO.insertReview(reviewerId,reviewItemId,raiting,reviewTitle,reviewContent);

		//レビューを取得してセット
		ArrayList<reviewDataBeans> reviewDataBeansList = ReviewDAO.getReviewDataBeansListByItemId(reviewItemId);
		request.setAttribute("reviewDataBeansList", reviewDataBeansList);

		//アイテム情報を取得してセット
		ItemDAO itemDao = new ItemDAO();
		ItemDataBeans idb = itemDao.selectByItemId(reviewItemId);

		request.setAttribute("idb", idb);

		//アイテム詳細画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/item.jsp");
		dispatcher.forward(request, response);

	}

}
