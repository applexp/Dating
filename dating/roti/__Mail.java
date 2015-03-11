package roti;

public class __Mail {
	
	private int mailID;
	private String coupleID;
	private int userID;
	private String userName;
	private String userPicture;
	private int loverID;
	private String loverName;
	private String loverPicture;
	private int totalReply;
	private int isViewReplyA;
	private int isViewReplyB;
	private String createdTimeStamp;
	private String latestTimeStamp;
	private int notViewTotalReplyA;
	private int notViewTotalReplyB;
	
	private __MailMsg mailMsg;
	
	public __Mail(){
		mailID = -1;
		coupleID = "";
		userID = -1;
		userName = "";
		userPicture ="";
		loverID = -1;
		loverName = "";
		loverPicture = "";
		totalReply = 0;
		isViewReplyA = 0;
		isViewReplyB = 0;
		createdTimeStamp = "";
		latestTimeStamp = "";
		notViewTotalReplyA = 0;
		notViewTotalReplyB = 0;
	}

	public void setMailMsg(__MailMsg mailMsg){
		this.mailMsg = mailMsg;
	}
	public void setMailID(int mailID){
		this.mailID = mailID;
	}
	public void setCoupleID(String coupleID){
		this.coupleID = coupleID;
	}
	public void setUserID(int userID){
		this.userID = userID;
	}
	public void setUserName(String name){
		userName = name;
	}
	public void setUserPicture(String pic){
		userPicture = pic;
	}
	public void setLoverID(int loverID){
		this.loverID = loverID;
	}
	public void setLoverName(String name){
		this.loverName = name;
	}
	public void setLoverPicture(String pic){
		this.loverPicture = pic;
	}
	public void setTotalReply(int total){
		this.totalReply = total;
	}
	public void setIsViewReplyA(int a){
		this.isViewReplyA = a;
	}
	public void setIsViewReplyB(int b){
		this.isViewReplyB = b;
	}
	public void setCreatedTimeStamp(String time){
		this.createdTimeStamp = time;
	}
	public void setLatestTimeStamp(String time){
		this.latestTimeStamp = time;
	}
	public void setNotViewTotalReplyA(int a){
		notViewTotalReplyA = a;
	}
	public void setNotViewTotalReplyB(int b){
		notViewTotalReplyB = b;
	}
	
	
	
	public int getMailID(){
		return mailID;
	}
	public String getCoupleID(){
		return coupleID;
	}
	public int getUserID(){
		return userID;
	}
	public String getUserName(){
		return userName;
	}
	public String getUserPicture(){
		return userPicture;
	}
	public int getLoverID(){
		return loverID;
	}
	public String getLoverName(){
		return loverName;
	}
	public String getLoverPicture(){
		return loverPicture;
	}
	public int getTotalReply(){
		return totalReply;
	}
	public int getIsViewReplyA(){
		return isViewReplyA;
	}
	public int getIsViewReplyB(){
		return isViewReplyB;
	}
	public String getCreatedTimeStamp(){
		return createdTimeStamp;
	}
	public String getLatestTimeStamp(){
		return latestTimeStamp;
	}
	public int getNotViewTotalReplyA(){
		return notViewTotalReplyA;
	}
	public int getNotViewTotalReplyB(){
		return notViewTotalReplyB;
	}
	
	public __MailMsg getMailMsg(){
		return mailMsg;
	}
	
}


