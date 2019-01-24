package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.ItemDAO;

/**
 * Servlet implementation class ItemAdd
 */
@WebServlet("/ItemAdd")
@MultipartConfig(location="/tmp", maxFileSize=1048576)
public class ItemAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemAdd() {
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
		//index.jspにフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/itemAdd.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

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

		ItemDAO.insertItem(itemName, itemDetail, itemPrice, name, userId);

//		//商品の追加確認画面実装時の画面表示に使用するBeans
//		ItemDataBeans idb = new ItemDataBeans();
//		idb.setName(itemName);
//		idb.setDetail(itemDetail);
//		idb.setPrice(itemPrice);
//		idb.setFileName(fileName);
//		idb.setUserId(userId);
//
//		request.setAttribute("idb", idb);

		//itemAddConfirm.jsp(商品の追加確認画面)にフォワード
		 RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/itemAddResult.jsp");
	     dispatcher.forward(request, response);
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
