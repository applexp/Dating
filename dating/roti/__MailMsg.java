package roti;

public class __MailMsg {

	private int mailMsgID;
	private int replyUserID;
	private int mailID;
	private String message;
	private int isReadA;
	private int isReadB;
	private String isLeftRight;
	private String replyTime;
	
	public __MailMsg(){
		mailMsgID = -1;
		replyUserID = -1;
		mailID = -1;
		message = "";
		isReadA = 0;
		isReadB = 0;
		isLeftRight = "";
		replyTime = "";
	}
	
	public void setMailMsgID(int mailMsgID){
		this.mailMsgID = mailMsgID;
	}
	public void setReplyUserID(int replyUserID){
		this.replyUserID = replyUserID;
	}
	public void setMailID(int mailID){
		this.mailID = mailID;
	}
	public void setMessage(String msg){
		this.message = msg;
	}
	public void setIsReadA(int a){
		this.isReadA = a;
	}
	public void setIsReadB(int b){
		this.isReadB = b;
	}
	public void setIsLeftRight(String lr){
		this.isLeftRight = lr;
	}
	public void setReplyTime(String replyTime){
		this.replyTime = replyTime;
	}
	
	public int getMailMsgID(){
		return mailMsgID;
	}
	public int getReplyUserID(){
		return replyUserID;
	}
	public int getMailID(){
		return mailID;
	}
	public String getMessage(){
		return message;
	}
	public int getIsReadA(){
		return isReadA;
	}
	public int getIsReadB(){
		return isReadB;
	}
	public String getIsLeftRight(){
		return isLeftRight;
	}
	public String getReplyTime(){
		return replyTime;
	}
}
