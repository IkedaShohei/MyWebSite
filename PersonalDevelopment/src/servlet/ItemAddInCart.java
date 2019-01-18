package servlet;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class ItemAddInCart
 */
@WebServlet("/ItemAddInCart")
public class ItemAddInCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemAddInCart() {
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

		String itemId1 = request.getParameter("itemId");
		int itemId = Integer.parseInt(itemId1);

		ItemDAO itemDao = new ItemDAO();
		ItemDataBeans idb = itemDao.selectByItemId(itemId);

		request.setAttribute("idb", idb);

		//入れるアイテムを格納するArrayList型のcartを取得
		HttpSession session = request.getSession();
		ArrayList<ItemDataBeans> cart = (ArrayList<ItemDataBeans>) session.getAttribute("cart");

		//もしセッションにカートがない場合
		if(cart == null) {
			cart = new ArrayList<ItemDataBeans>();
		}

		//カートに上で取得したアイテムのインスタンスを追加
		cart.add(idb);

		//ArrayListに新しいインスタンスを追加したからカート再度セットし直す
		session.setAttribute("cart", cart);
		request.setAttribute("cartActionMessage", "商品を追加しました");

		//cart.jspにフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/cart.jsp");
        dispatcher.forward(request, response);

	}

}
