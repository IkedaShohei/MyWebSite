package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UserDataBeans;
import dao.UserDAO;

/**
 * Servlet implementation class ManagerUserUpdate
 */
@WebServlet("/ManagerUserUpdate")
public class ManagerUserUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerUserUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String userIdStr = request.getParameter("userId");
		int userId = Integer.parseInt(userIdStr);

		UserDAO userDao = new UserDAO();
		UserDataBeans udb =userDao.getDetailById(userId);

		request.setAttribute("udb", udb);

		//managerUserUpdate.jspにフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/managerUserUpdate.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");

		String loginId = request.getParameter("loginId");
		String name = request.getParameter("name");
		String adress = request.getParameter("adress");
		String password = request.getParameter("password");
		String passwordConfirm = request.getParameter("passwordConfirm");

		UserDAO userDao = new UserDAO();
		userDao.userUpDate(loginId, name, adress, password);

		//パスワードとパスワード（確認）が一致しなかった時
			if(!(password.equals(passwordConfirm))) {
				request.setAttribute("errMsgPass", "入力されたパスワードが一致していません。");

				doGet(request, response);
				return;
			}


		response.sendRedirect("http://localhost:8080/PersonalDevelopment/ManagementUser");



	}

}
