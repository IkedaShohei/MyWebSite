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
 * Servlet implementation class RegistConfirm
 */
@WebServlet("/RegistConfirm")
public class RegistConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistConfirm() {
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

		String loginId = request.getParameter("loginId");
		String name = request.getParameter("name");
		String adress = request.getParameter("adress");
		String password = request.getParameter("password");
		String submit = request.getParameter("submit");


//		登録ボタンを押したら
//		登録のDAOを動かしてregistResult.jspにフォワード
		if(submit.equals("登録")) {
			UserDAO userDao = new UserDAO();
			int result = userDao.regist(name, adress, loginId, password);

			if(result == 0) {
				//登録できない

				response.sendRedirect("http://localhost:8080/PersonalDevelopment/Regist");

				return;
			}else {
				//登録できる
				UserDataBeans udb = userDao.getDetailByloginId(loginId);

				request.setAttribute("udb", udb);

				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/registResult.jsp");
				dispatcher.forward(request, response);

				return;
			}

		}

		if(submit.equals("修正")) {
			response.sendRedirect("http://localhost:8080/PersonalDevelopment/Regist");
		}

	}

}
