package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.ItemDataBeans;
import dao.ItemDAO;

/**
 * Servlet implementation class ManagerItemDelete
 */
@WebServlet("/ManagerItemDelete")
public class ManagerItemDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerItemDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		//インスタンスを取得してセッションがあるか比べる準備
		HttpSession session = request.getSession();

		//もしセッションがなかったらログイン画面にリダイレクト
		if(session.getAttribute("udb") == null) {
			response.sendRedirect("http://localhost:8080/PersonalDevelopment/Login");
			return;
		}

		String itemIdStr = request.getParameter("itemId");
		int itemId = Integer.parseInt(itemIdStr);

		ItemDAO itemDao = new ItemDAO();
		ItemDataBeans idb = itemDao.selectByItemId(itemId);

		request.setAttribute("idb", idb);

		//managerItemDelete.jsp（商品情報削除確認ページ）にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/managerItemDelete.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		String itemIdStr = request.getParameter("itemId");
		int itemId = Integer.parseInt(itemIdStr);

		ItemDAO.deleteItemByItemId(itemId);

		//商品管理画面にリダイレクト
		response.sendRedirect("http://localhost:8080/PersonalDevelopment/ManagementItem");

	}

}
