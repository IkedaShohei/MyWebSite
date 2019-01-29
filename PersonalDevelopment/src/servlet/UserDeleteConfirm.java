package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.UserDataBeans;
import dao.UserDAO;

/**
 * Servlet implementation class UserDeleteConfirm
 */
@WebServlet("/UserDeleteConfirm")
public class UserDeleteConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDeleteConfirm() {
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

		String userIdStr = request.getParameter("userId");
		int userId = Integer.parseInt(userIdStr);

		UserDAO userDao = new UserDAO();
		UserDataBeans udb = userDao.getDetailById(userId);

		request.setAttribute("udb", udb);

		//userDeleteConfirm.jsp（管理者用ユーザー削除確認画面）にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userDeleteConfirm.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
