package roti;

public class __Reports {
	
	private int reportID;
	
	private int dayAddUser;
	private int totalAddUser;
	
	private int dayAddPost;
	private int totalAddPost;
	
	private int dayAddComment;
	private int totalAddComment;
	
	private String createdDate;
	
	private int value;
	
	public __Reports(){
		reportID = -1;
		dayAddUser = 0;
		totalAddUser = 0;
		dayAddPost = 0;
		totalAddPost = 0;
		dayAddComment = 0;
		totalAddComment = 0;
		createdDate = "";
		value = 0;
	}
	
	public void setReportID(int reportID){
		this.reportID = reportID;
	}
	public void setDayAddUser(int dayAddUser){
		this.dayAddUser = dayAddUser;
	}
	public void setTotalAddUser(int totalAddUser){
		this.totalAddUser = totalAddUser;
	}
	public void setDayAddPost(int dayAddPost){
		this.dayAddPost = dayAddPost;
	}
	public void setTotalAddPost(int totalAddPost){
		this.totalAddPost = totalAddPost;
	}
	public void setDayAddComment(int dayAddComment){
		this.dayAddComment = dayAddComment;
	}
	public void setTotalAddComment(int totalAddComment){
		this.totalAddComment = totalAddComment;
	}
	public void setCreatedDate(String createdDate){
		this.createdDate = createdDate;
	}
	public void setValue(int value){
		this.value = value;
	}
	
	public int getReportID(){
		return reportID;
	}
	public int getDayAddUser(){
		return dayAddUser;
	}
	public int getTotalAddUser(){
		return totalAddUser;
	}
	public int getDayAddPost(){
		return dayAddPost;
	}
	public int getTotalAddPost(){
		return totalAddPost;
	}
	public int getDayAddComment(){
		return dayAddComment;
	}
	public int getTotalAddComment(){
		return totalAddComment;
	}
	public String getCreatedDate(){
		return createdDate;
	}
	public int getValue(){
		return value;
	}
}
