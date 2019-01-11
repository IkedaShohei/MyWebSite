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
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		//login.jspにフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
        dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//文字化け防止
		request.setCharacterEncoding("UTF-8");

		//login.jspのformからの情報をゲットパラメーター
		String loginId = request.getParameter("login_id");
		String password = request.getParameter("password");

		//DAOのインスタンスを呼び出し、ログイン用のメソッドを呼び出す。
		//結果帰ってきたインスタンスを変数udbに保存
		UserDAO userDao = new UserDAO();
		UserDataBeans udb = userDao.loginByLIAndPWGetIDAndName(loginId, password);


		//DAOのメソッドを実行して入力されたデータが見つからなかった場合(ログイン失敗時)
		if(udb == null) {
			request.setAttribute("errMsg", "ログインに失敗しました。");

		//login.jspにフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
			dispatcher.forward(request, response);
			return;
		}

		//ログイン情報をセッションスコープに保存
		HttpSession session = request.getSession();
		session.setAttribute("udb", udb);

		//indexサーブレットにリダイレクト
		response.sendRedirect("http://localhost:8080/PersonalDevelopment/index");

	}

}
