package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UserDataBeans;

/**
 * Servlet implementation class Regist
 */
@WebServlet("/Regist")
public class Regist extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Regist() {
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

		//regist.jspにフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/regist.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");

		String loginID = request.getParameter("loginID");
		String userName = request.getParameter("user_name");
		String userAddress = request.getParameter("user_address");
		String password = request.getParameter("password");
		//確認用パスワード
		String confirmPassword = request.getParameter("confirm_password");

		//パスワードとパスワード（確認）が一致しなかった時
				if(!(password.equals(confirmPassword))) {
					request.setAttribute("errMsg", "入力された内容は正しくありません。");

					request.setAttribute("loginID", loginID);
					request.setAttribute("userName", userName);
					request.setAttribute("userAddress", userAddress);

				//自分のGetにフォワード
					doGet(request, response);
					return;
				}

		//どれか１つでも入力欄が空だった場合(今回はinputにrequiredの属性がついているので使わない)
				if(userName.equals("") || userAddress.equals("") || password.equals("") || confirmPassword.equals("")) {
					request.setAttribute("errMsg", "入力された内容は正しくありません。");

					request.setAttribute("loginID", loginID);
					request.setAttribute("userName", userName);
					request.setAttribute("userAddress", userAddress);


					//自分のGetにフォワード
					doGet(request, response);
					return;
				}

		UserDataBeans udb = new UserDataBeans(userName, userAddress, loginID,password);
		request.setAttribute("udb", udb);

		//registConfirm.jspにフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/registConfirm.jsp");
		dispatcher.forward(request, response);
	}

}
