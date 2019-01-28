package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import beans.ItemDataBeans;
import dao.ItemDAO;

/**
 * Servlet implementation class ItemDataDetail
 */
@WebServlet("/ManagerItemUpdate")
public class ManagerItemUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerItemUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String itemIdStr = request.getParameter("itemId");
		int itemId = Integer.parseInt(itemIdStr);

		ItemDAO itemDao = new ItemDAO();
		ItemDataBeans idb = itemDao.selectByItemId(itemId);

		request.setAttribute("idb", idb);

		//managerItemUpdate.jsp（管理者用商品情報更新ページ）にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/managerItemUpdate.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		String itemIdStr = request.getParameter("itemId");
		int itemId = Integer.parseInt(itemIdStr);
		String itemName = request.getParameter("itemName");
		String itemDetail = request.getParameter("itemDetail");
		String itemPriceStr = request.getParameter("itemPrice");
		int itemPrice = Integer.parseInt(itemPriceStr);
		String userIdStr = request.getParameter("userId");
		int userId = Integer.parseInt(userIdStr);

		//ファイルデータだけ方法が違う jspの画像アップロードについて参照
		Part part = request.getPart("fileName");
		String name = this.getFileName(part);
		part.write(Helper.IMG_PATH + name);

		ItemDAO.updateItem(itemName,itemDetail,itemPrice,userId,name,itemId);

		//商品の管理画面にリダイレクト
		response.sendRedirect("http://localhost:8080/PersonalDevelopment/ManagementItem");
	}
	private String getFileName(Part part) {
		// TODO 自動生成されたメソッド・スタブ
		String name = null;
        for(String dispotion : part.getHeader("Content-Disposition").split(";")){
            if(dispotion.trim().startsWith("filename")){
                name = dispotion.substring(dispotion.indexOf("=") + 1).replace("\"","").trim();
                name = name.substring(name.lastIndexOf("\\") + 1 );
                break;
            }
        }
		return name;
	}
}
