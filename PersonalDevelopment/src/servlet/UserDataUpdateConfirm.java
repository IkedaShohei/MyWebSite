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
 * Servlet implementation class UserDataUpdateConfirm
 */
@WebServlet("/UserDataUpdateConfirm")
public class UserDataUpdateConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDataUpdateConfirm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
//		getパラ
		String userId = request.getParameter("userId");
		int userId1 = Integer.parseInt(userId);
		String loginId = request.getParameter("loginId");
		String name = request.getParameter("name");
		String adress = request.getParameter("adress");
		String password = request.getParameter("password");
		String  submit = request.getParameter("submit");

//		更新ボタンを押したら
//		更新のDAOを動かしてアップデートリザルトjspにフォワード
		if(submit.equals("更新")){
			UserDAO userDao = new UserDAO();
			int result = userDao.userUpDate(loginId, name, adress, password);

			if(result == 0) {
//				更新できない。
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userDataUpdateResultError.jsp");
				dispatcher.forward(request, response);

				return;
			}else{
//				更新できる
				UserDataBeans udb = new UserDataBeans(userId1, name);
				request.setAttribute("udb", udb);

				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userDataUpdateResultSuccess.jsp");
				dispatcher.forward(request, response);

				return;
			}


		}

//		修正ボタンを押したら
//		userDataに飛ぶ
		if(submit.equals("修正")){
			response.sendRedirect("http://localhost:8080/PersonalDevelopment/UserData?userId="+ userId);
		}



	}


}
