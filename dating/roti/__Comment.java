package roti;

public class __Comment {
	private int cID;
	private int userID;
	private String username;
	private String userPic;
	private String comment;
	private int articleID;
	private String commentTime;
	private int totalLike;
	
	public __Comment(){
		cID = -1;
		userID = -1;
		username = "";
		userPic = "";
		comment = "";
		articleID = -1;
		commentTime = "";
		totalLike = 0;
	}
	
	public void setCID(int cid){
		cID = cid;
	}
	public void setUserID(int userID){
		this.userID = userID;
	}
	public void setUsername(String username){
		this.username = username;
	}
	public void setUserPic(String userPic){
		this.userPic = "https://s3.amazonaws.com/aiju-cloudfront-bucket/" + userPic;
	}
	public void setComment(String comment){
		this.comment = comment;
	}
	public void setArticleID(int aid){
		this.articleID = aid;
	}
	public void setCommentTime(String commentTime){
		this.commentTime = commentTime;
	}
	public void setTotalLike(int totalLike){
		this.totalLike = totalLike;
	}
	
	public int getCID(){
		return cID;
	}
	public int getUserID(){
		return userID;
	}
	public String getUsername(){
		return username;
	}
	public String getUserPic(){
		return userPic;
	}
	public String getComment(){
		return comment;
	}
	public int getArticleID(){
		return articleID;
	}
	public String getCommentTime(){
		return commentTime;
	}
	public int getTotalLike(){
		return totalLike;
	}
}
