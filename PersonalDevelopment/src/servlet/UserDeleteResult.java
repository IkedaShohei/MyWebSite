package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

/**
 * Servlet implementation class UserDeleteResult
 */
@WebServlet("/UserDeleteResult")
public class UserDeleteResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDeleteResult() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");

		String userId1 = request.getParameter("userId");
		int userId = Integer.parseInt(userId1);
		String userName = request.getParameter("user_name");
		String adress = request.getParameter("adress");
		String password = request.getParameter("password");
		//パスが確認用と一致するか確認する際に使用
		String passwordConfirmation = request.getParameter("passwordConfirmation");

		//パスワードとパスワード（確認）が一致しなかった時
		if(!(password.equals(passwordConfirmation))) {
			request.setAttribute("errMsg", "入力された内容は正しくありません。");

		//UserDataにフォワード
			doGet(request, response);
			return;
		}

		UserDAO userDao = new UserDAO();
		//userDao.userUpDate(userId, userName, adress, password);

//		userDataUpdateResult.jsp（ユーザー情報更新結果）にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userDataUpdateResult.jsp");
        dispatcher.forward(request, response);
	}

}
