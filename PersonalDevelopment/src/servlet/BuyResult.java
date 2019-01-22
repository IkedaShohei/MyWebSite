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
import beans.BuyDetailDataBeans;
import beans.ItemDataBeans;
import dao.BuyDAO;
import dao.BuyDetailDAO;

/**
 * Servlet implementation class BuyResult
 */
@WebServlet("/BuyResult")
public class BuyResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyResult() {
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

		//セッションスコープに入ってるcart(カートの中身)を画面表示用で
		//同じくセッションスコープに入ってるbdb(購入データ)をデータベース追加用で取得する
		HttpSession session = request.getSession();

		ArrayList<ItemDataBeans> cart = (ArrayList<ItemDataBeans>)session.getAttribute("cart");
		BuyDataBeans bdb = (BuyDataBeans)session.getAttribute("bdb");

		//購入したデータをインサートしてインサートした購入情報のIDを戻り値で返すDAOを作る
		int buyId = BuyDAO.insurtBuy(bdb);

		//戻ってきたIDを元に購入詳細も登録していく
		for (ItemDataBeans cartInItem : cart){
			BuyDetailDataBeans bddb = new BuyDetailDataBeans();
			bddb.setBuyId(buyId);
			bddb.setItemId(cartInItem.getItemId());
			BuyDetailDAO.insurtBuyDetail(bddb);
		}

		//購入完了ページ表示用の購入データBeans
		BuyDataBeans resultBDB = BuyDAO.getBuyDataBeansByBuyId(buyId);
		request.setAttribute("resultBDB", resultBDB);

		//購入商品情報
		ArrayList<ItemDataBeans> buyIDBList = BuyDetailDAO.getItemDataBeansListByBuyId(buyId);
		request.setAttribute("buyIDBList", buyIDBList);

		//セッションに保存されているインスタンスを削除
		session.removeAttribute("cart");
		session.removeAttribute("bdb");

		//購入完了ページ（buyResult.jsp）に移動にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/buyResult.jsp");
        dispatcher.forward(request, response);

	}

}
