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

import beans.BuyDataBeans;
import beans.DeliveryMethodDataBeans;
import beans.ItemDataBeans;
import beans.UserDataBeans;
import dao.DeliveryMethodDAO;

/**
 * Servlet implementation class BuyComfirm
 */
@WebServlet("/BuyComfirm")
public class BuyComfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyComfirm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/buyConfirm.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		//選択した配送方法のIDをint型に変換
		String selectDeliveryMethodId = request.getParameter("delivery_method_id");
		int deliveryMethodId = Integer.parseInt(selectDeliveryMethodId);

		//IDから配送方法の情報を詰めたBeansを取得する
		DeliveryMethodDataBeans userSelectDMB = DeliveryMethodDAO.getDeliveryMethodDataBeansByID(deliveryMethodId);

		//買い物かごのセッションを取得
		HttpSession session = request.getSession();
		ArrayList<ItemDataBeans> cartList = (ArrayList<ItemDataBeans>) session.getAttribute("cart");

		//HelperのstaticメソッドgetTotalItemPrice()を使ってカートの中の商品の合計金額と配送料金を合算
		int totalPrice = Helper.getTotalItemPrice(cartList)+userSelectDMB.getPrice();

		//セッション情報からuserIdを持ってくるためにセッションスコープからインスタンスを取得
		UserDataBeans udb = (UserDataBeans) session.getAttribute("udb");

		BuyDataBeans bdb = new BuyDataBeans();
		bdb.setUserId(udb.getUserId());
		bdb.setTotalPrice(totalPrice);
		bdb.setDeliveryMethodId(deliveryMethodId);
		bdb.setDeliveryMethodName(userSelectDMB.getName());
		bdb.setDeliveryMethodPrice(userSelectDMB.getPrice());


		//購入確定画面でbdbを利用するためセッションスコープにインスタンスをセット
		session.setAttribute("bdb", bdb);

		//購入確認画面にフォワード（buyConfirm.jsp）
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/buyConfirm.jsp");
		dispatcher.forward(request, response);


	}

}
