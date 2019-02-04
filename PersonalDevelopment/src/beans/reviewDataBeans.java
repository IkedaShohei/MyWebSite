package beans;

import java.util.Date;

public class reviewDataBeans {

	private int reviewId;
	private int reviewerId;
	private int reviewItemId;
	private int rating;
	private String reviewTitle;
	private String reviewContent;
	private Date createDate;

	//レビューリストを表示する際の結合後に使うフィールド
	private String reviewerName;




	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	public int getReviewerId() {
		return reviewerId;
	}
	public void setReviewerId(int reviewerId) {
		this.reviewerId = reviewerId;
	}
	public int getReviewItemId() {
		return reviewItemId;
	}
	public void setReviewItemId(int reviewItemId) {
		this.reviewItemId = reviewItemId;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getReviewerName() {
		return reviewerName;
	}
	public void setReviewerName(String reviewerName) {
		this.reviewerName = reviewerName;
	}


}
