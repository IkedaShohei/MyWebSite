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
 * Servlet implementation class UserData
 */
@WebServlet("/UserData")
public class UserData extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserData() {
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
			//Loginのサーブレットにリダイレクト
			response.sendRedirect("http://localhost:8080/PersonalDevelopment/Login");
			return;
		}

		// URLからGETパラメータとしてIDを受け取る
		String id1 = request.getParameter("userId");
		int id = Integer.parseInt(id1);

		// idを引数にして、idに紐づくユーザ情報を出力する
		UserDAO userDao = new UserDAO();
		UserDataBeans udbAll = userDao.getDetailById(id);

		request.setAttribute("udbAll", udbAll);

		//文字化け防止
		response.setContentType("text/html; charset=UTF-8");
		//UserData.jspにフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userData.jsp");
        dispatcher.forward(request, response);


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
		userDao.userUpDate(userId, userName, adress, password);

//		UserData（ユーザー情報）にリダイレクト
		doGet(request, response);

	}

}
