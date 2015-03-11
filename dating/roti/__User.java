package roti;

public class __User {
	
	private int userID;
	private String name;
	private String gender;
	private int age;
	private String month;
	private String year;
	private String city;
	private String state;
	private String title;
	private String status;
	private String userPicturePath;
	private String role;
	private String email;
	
	private String desc;
	private String t_gender;
	private String country;
	private String postcode;
	private String createdDate;
	
	public __User(){
		userID = -1;
		name = "";
		gender = "";
		age = 0;
		month = "";
		year = "";
		city = "";
		state = "";
		title = "";
		status = "";
		userPicturePath = "default_image/aijulogo.jpg";
		role = "";
		email = "";
		
		desc = "";
		t_gender = "";
		country = "";
		postcode = "";
		createdDate = "";
	}
	
	
	public void setUserID(int id){
		userID = id;
	}
	public void setName(String name){
		this.name = name;
	}
	public void setGender(String gender){
		this.gender = gender;
	}
	public void setAge(int age){
		this.age = age;
	}
	public void setMonth(String month){
		this.month = month;
	}
	public void setYear(String year){
		this.year = year;
	}
	public void setCity(String city){
		this.city = city;
	}
	public void setState(String state){
		this.state = state;
	}
	public void setTitle(String title){
		this.title = title;
	}
	public void setStatus(String status){
		this.status = status;
	}
	public void setProfileImagePath(String path){
		userPicturePath = path;
	}
	public void setRole(String role){
		
		if(role.equals("guanliyuan")){
			this.role = "<b style=\"color:red\">\u7BA1\u7406\u5458</b>";
		}else if(role.equals("unconfirmedEmail")){
			this.role = "\u672A\u786E\u8BA4\u90AE\u4EF6";
		}else if(role.equals("unpaid_Member")){
			this.role = "<b style=\"color:green\">\u4E00\u822C\u7528\u6237</b>";
		}
	}
	public void setEmail(String email){
		this.email = email;
	}
	public void setDesc(String desc){
		this.desc = desc;
	}
	public void setTGender(String tgender){
		t_gender = tgender;
	}
	public void setCountry(String country){
		this.country = country;
	}
	public void setPostcode(String postcode){
		this.postcode = postcode;
	}
	public void setCreatedDate(String createdDate){
		this.createdDate = createdDate;
	}
	
	
	
	public int getUserID(){
		return userID;
	}
	public String getName(){
		return name;
	}
	public String getGender(){
		return gender;
	}
	public int getAge(){
		return age;
	}
	public String getMonth(){
		return month;
	}
	public String getYear(){
		return year;
	}
	public String getCity(){
		return city;
	}
	public String getState(){
		return state;
	}
	public String getTitle(){
		return title;
	}
	public String getStatus(){
		return status;
	}
	public String getProfileImagePath(){
		return userPicturePath;
	}
	public String getRole(){
		return role;
	}
	public String getEmail(){
		return email;
	}
	public String getDesc(){
		return desc;
	}
	public String getTGender(){
		return t_gender;
	}
	public String getCountry(){
		return country;
	}
	public String getPostcode(){
		return postcode;
	}
	public String getCreatedDate(){
		return createdDate;
	}

}
