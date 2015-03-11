package roti;

public class __UserAbout {
	
	private __User user;
	
	private int userAboutID;
	private int userID;
	private int status;
	private String race;
	private String nationality;
	private String religion;
	private String hometown;
	private int livingHowLong;
	private double w;
	private double h;
	private String sign;
	private String bloodType;
	private String language;
	private String profession;
	private String profession_etc;
	private String educationLevel;
	private String highSchool;
	private int totalCol;
	private String col1, maj1, deg1; 
	private String col2, maj2, deg2; 
	private String col3, maj3, deg3; 
	private String col4, maj4, deg4; 
	private String col5, maj5, deg5; 
	private String interest;
	
	private int t_size;
	private double t_minHeight;
	private int t_minAge;
	private int t_maxAge;
	private String t_eduLevel;
	private String t_profession;
	private String t_profession_etc;
	private String t_desc;
	
	public __UserAbout(){
		
		userAboutID = -1;
		userID = -1;
		status = -1;
		race = "";
		nationality = "";
		religion = "";
		hometown = "";
		livingHowLong = -1;
		w = 0.0;
		h = 0.0;
		sign = "";
		bloodType = "";
		language = "";
		profession = "";
		profession_etc = "";
		educationLevel = "";
		highSchool = "";
		totalCol = -1;
		col1 = ""; maj1 = ""; deg1 = ""; 
		col2 = ""; maj2 = ""; deg2 = ""; 
		col3 = ""; maj3 = ""; deg3 = ""; 
		col4 = ""; maj4 = ""; deg4 = ""; 
		col5 = ""; maj5 = ""; deg5 = ""; 
		interest = "";
		
		t_size = 0;
		t_minHeight = 0.0;
		t_minAge = 0;
		t_maxAge = 0;
		t_eduLevel = "";
		t_profession = "";
		t_profession_etc = "";
		t_desc = "";

	}
	
	// __User object
	public void setUser(__User user){
		this.user = user;
	}
	
	public void setUserAboutID(int userAboutID){
		this.userAboutID = userAboutID;
	}
	public void setUserID(int userID){
		this.userID = userID;
	}
	public void setStatus(int status){
		this.status = status;
	}
	public void setRace(String race){
		this.race = race;
	}
	public void setNationality(String nat){
		nationality = nat;
	}
	public void setReligion(String religion){
		this.religion = religion;
	}
	public void setHometown(String hometown){
		this.hometown = hometown;
	}
	public void setLivingHowLong(int num){
		livingHowLong = num;
	}
	public void setW(double w){
		this.w = w;
	}
	public void setH(double h){
		this.h = h;
	}
	public void setSign(String sign){
		this.sign = sign;
	}
	public void setBloodType(String bloodType){
		this.bloodType = bloodType;
	}
	public void setLanguage(String language){
		this.language = language;
	}
	public void setProfession(String profession){
		this.profession = profession;
	}
	public void setProfessionETC(String profession_etc){
		this.profession_etc = profession_etc;
	}
	public void setEducationLevel(String educationLevel){
		this.educationLevel = educationLevel;
	}
	public void setHighSchool(String highSchool){
		this.highSchool = highSchool;
	}
	public void setTotalColleges(int total){
		this.totalCol = total;
	}
	public void setCol1(String c1){
		col1 = c1;
	}
	public void setMaj1(String m1){
		maj1 = m1;
	}
	public void setDeg1(String d1){
		deg1 = d1;
	}
	
	public void setCol2(String c2){
		col2 = c2;
	}
	public void setMaj2(String m2){
		maj2 = m2;
	}
	public void setDeg2(String d2){
		deg2 = d2;
	}
	
	public void setCol3(String c3){
		col3 = c3;
	}
	public void setMaj3(String m3){
		maj3 = m3;
	}
	public void setDeg3(String d3){
		deg3 = d3;
	}
	
	public void setCol4(String c4){
		col4 = c4;
	}
	public void setMaj4(String m4){
		maj4 = m4;
	}
	public void setDeg4(String d4){
		deg4 = d4;
	}
	public void setCol5(String c5){
		col5 = c5;
	}
	public void setMaj5(String m5){
		maj5 = m5;
	}
	public void setDeg5(String d5){
		deg5 = d5;
	}
	public void setInterests(String interest){
		this.interest = interest;
	}
	public void setTSize(int size){
		t_size = size;
	}
	public void setTMinHeight(double minHeight){
		t_minHeight = minHeight;
	}
	public void setTMinAge(int n){
		t_minAge = n;
	}
	public void setTMaxAge(int n){
		t_maxAge = n;
	}
	public void setTEduLevel(String lvl){
		t_eduLevel = lvl;
	}
	public void setTProfession(String pro){
		t_profession = pro;
	}
	public void setTProfessionETC(String t_profession_etc){
		this.t_profession_etc = t_profession_etc;
	}
	public void setTDesc(String desc){
		t_desc = desc;
	}

	
	// __User object
	public __User getUser(){
		return user;
	}
	
	public int getUserAboutID(){
		return userAboutID;
	}
	public int getUserID(){
		return userID;
	}
	public int getStatus(){
		return status;
	}
	public String getRace(){
		return race;
	}
	public String getNationality(){
		return nationality;
	}
	public String getReligion(){
		return religion;
	}
	public String getHometown(){
		return hometown;
	}
	public int getLivingHowLong(){
		return livingHowLong;
	}
	public double getW(){
		return w;
	}
	public double getH(){
		return h;
	}
	public String getSign(){
		return sign;
	}
	public String getBloodType(){
		return bloodType;
	}
	public String getLanguage(){
		return language;
	}
	public String getProfession(){
		return profession;
	}
	public String getProfessionETC(){
		return profession_etc;
	}
	public String getEducationLevel(){
		return educationLevel;
	}
	public String getHighSchool(){
		return highSchool;
	}
	public int getTotalColleges(){
		return totalCol;
	}
	public String getCol1(){
		return col1;
	}
	public String getMaj1(){
		return maj1;
	}
	public String getDeg1(){
		return deg1;
	}
	
	public String getCol2(){
		return col2;
	}
	public String getMaj2(){
		return maj2;
	}
	public String getDeg2(){
		return deg2;
	}
	
	public String getCol3(){
		return col3;
	}
	public String getMaj3(){
		return maj3;
	}
	public String getDeg3(){
		return deg3;
	}
	public String getCol4(){
		return col4;
	}
	public String getMaj4(){
		return maj4;
	}
	public String getDeg4(){
		return deg4;
	}
	public String getCol5(){
		return col5;
	}
	public String getMaj5(){
		return maj5;
	}
	public String getDeg5(){
		return deg5;
	}
	public String getInterests(){
		return interest;
	}
	public int getTSize(){
		return t_size;
	}
	public double getTMinHeight(){
		return t_minHeight;
	}
	public int getTMinAge(){
		return t_minAge;
	}
	public int getTMaxAge(){
		return t_maxAge;
	}
	public String getTEduLevel(){
		return t_eduLevel;
	}
	public String getTProfession(){
		return t_profession;
	}
	public String getTProfessionETC(){
		return t_profession_etc;
	}
	public String getTDesc(){
		return t_desc;
	}
	
	
//	user.setName("");
//	user.setTitle("");
//	user.setDesc("");
//	user.setTGender("");
//	user.setCity("");
//	user.setState("");
//	user.setCountry("");
//	user.setPostcode("");
}
