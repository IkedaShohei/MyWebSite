package servlet;

import java.util.ArrayList;

import beans.ItemDataBeans;

public class Helper {
	// 画像のアップロード先のパス
	public static final String IMG_PATH = "/Users/ikedashohei/Documents/GitHub/MyWebSite/PersonalDevelopment/WebContent/image/";

	//欲しい機能の簡略化メソッド倉庫

	/**
	 * 商品の合計金額を算出する
	 *
	 * @param items
	 * @return total
	 */
	public static int getTotalItemPrice(ArrayList<ItemDataBeans> items) {
		int total = 0;
		for (ItemDataBeans item : items) {
			total += item.getPrice();
		}
		return total;
	}
}
