package roti;

import java.util.Calendar;

public class __Article {
	
	private int postID;
	private int postType;
	private String title;
	private String author;
	private String userID;
	private String content;
	private String short_desc;
	private String coverImage;
	private String postDate;
	private String postUpdatedDate;
	private String eventDate;
	private String disEventDate;
	private String geoLocation;
	private String lat;
	private String long1;
	private String address;
	private String city;
	private String state;
	private String country;
	private int z;
	private String zipcode;
	private String purchaseLink;
	private String tag;
	private int viewCount;
	private int commentCount;
	private int genre;
	private int geshi;
	private String eventPlaceName;
	private String postImageGroupID;
	private String day_of_week;
	private String stime;
	private String etime;
	private int verify;
	
	public __Article(){
		postID = -1;
		postType = -1;
		title = "";
		author = "";
		userID = ""; //post userID;
		content = "";
		short_desc = "";
		coverImage = "";
		postDate = "";
		postUpdatedDate = "";
		eventDate = "";
		disEventDate = "";
		geoLocation = "";
		lat = "";
		long1 = "";
		address = "";
		city = "";
		state = "";
		country = "";
		z = -1;
		zipcode = "";
		purchaseLink = "n";
		tag = "";
		viewCount = 0;
		commentCount = 0;
		genre = 0;
		geshi = 0;
		eventPlaceName = "";
		postImageGroupID = "";
		day_of_week = "-1";
		stime = "";
		etime = "";
		verify = 0;
	}
	
	public void setPostID(int postID){
		this.postID = postID;
	}
	public void setPostType(int postType){
		this.postType = postType;
	}
	public void setTitle(String title){
		this.title = title;
	}
	public void setAuthor(String author){
		this.author = author;
	}
	public void setUserID(String userID){
		this.userID = userID;
	}
	public void setContent(String content){
		this.content = content;
	}
	public void setShortDesc(String short_desc){
		this.short_desc = short_desc;
	}
	public void setCoverImage(String coverImage){
		this.coverImage = coverImage;
	}
	public void setPostDate(String postDate){
		this.postDate = postDate;
	}
	public void setPostUpdatedDate(String postUpdatedDate){
		this.postUpdatedDate = postUpdatedDate;
	}
	public void setEventDate(String eventDate){
		this.eventDate = eventDate;
	}
	public void setDisEventDate(String disEventDate){
		this.disEventDate = disEventDate;
	}
	public void setGeoLocation(String geo){
		
		if(geo != null){
			if(!geo.equals("0") && !geo.equals("")){
				String[] longlat = geo.split(",");
				this.lat = longlat[0];
				this.long1 = longlat[1];
			}else{
				this.lat = "40.7569068";
				this.long1 = "-73.9845519";
			}
		}else{
			//this.lat = "40.7569068";
			//this.long1 = "-73.9845519";
			this.lat = "0";
			this.long1 = "";
		}
	}
	public void setGeoLocation4Edit(String geo){
		
		if(geo != null){
			if(!geo.equals("0") && !geo.equals("")){
				String[] longlat = geo.split(",");
				this.lat = longlat[0];
				this.long1 = longlat[1];
			}else{
				this.lat = "-1";
				this.long1 = "-1";
			}
		}else{
			//this.lat = "40.7569068";
			//this.long1 = "-73.9845519";
			this.lat = "0";
			this.long1 = "";
		}
	}
	public void setLat(String lat){
		this.lat = lat;
	}
	public void setLong1(String long1){
		this.long1 = long1;
	}
	public void setAddress(String address){
		this.address = address;
	}
	public void setCity(String city){
		this.city = city;
	}
	public void setState(String state){
		this.state = state;
	}
	public void setCountry(String country){
		this.country = country;
	}
	public void setZ(int z){
		this.z = z;
	}
	public void setZipcode(String zipcode){
		this.zipcode = zipcode;
	}
	public void setPurchaseLink(String purchaseLink){
		this.purchaseLink = purchaseLink;
	}
	public void setTag(String tag){
		this.tag = tag;
	}
	public void setViewCount(int viewCount){
		this.viewCount = viewCount;
	}
	public void setCommentCount(int commentCount){
		this.commentCount = commentCount;
	}
	public void setGenre(int genre){
		this.genre = genre;
	}
	public void setGeshi(int geshi){
		this.geshi = geshi;
	}
	public void setEventPlaceName(String eventPlaceName){
		this.eventPlaceName = eventPlaceName;
	}
	public void setPostImageGroupID(String postImageGroupID){
		this.postImageGroupID = postImageGroupID;
	}
	public void setDayOfWeek(String day_of_week){
		this.day_of_week = day_of_week;
	}
	public void setSTime(String stime){
		this.stime = stime;
	}
	public void setETime(String etime){
		this.etime = etime;
	}
	public void setVerify(int verify){
		this.verify = verify;
	}
	
	public int getPostID(){
		return postID;
	}
	public int getPostType(){
		return postType;
	}
	public String getTitle(){
		return title;
	}
	public String getAuthor(){
		return author;
	}
	public String getUserID(){
		return userID;
	}
	public String getContent(){
		return content;
	}
	public String getShortDesc(){
		return short_desc;
	}
	public String getCoverImage(){
		return coverImage;
	}
	public String getPostDate(){
		return postDate;
	}
	public String getPostUpdatedDate(){
		return postUpdatedDate;
	}
	public String getEventDate(){
		return eventDate;
	}
	public String getDisEventDate(){
		return disEventDate;
	}
	public String getGeoLocation(){
		return geoLocation;
	}
	public String getLat(){
		return lat;
	}
	public String getLong(){
		return long1;
	}
	public String getAddress(){
		return address;
	}
	public String getCity(){
		return city;
	}
	public String getState(){
		return state;
	}
	public String getCountry(){
		return country;
	}
	public int getZ(){
		return z;
	}
	public String getZipcode(){
		return zipcode;
	}
	public String getPurchaseLink(){
		return purchaseLink;
	}
	public String getTag(){
		return tag;
	}
	public int getViewCount(){
		return viewCount;
	}
	public int getCommentCount(){
		return commentCount;
	}
	public int getGenre(){
		return genre;
	}
	public int getGeshi(){
		return geshi;
	}
	public String getEventPlaceName(){
		return eventPlaceName;
	}
	public String getPostImageGroupID(){
		return postImageGroupID;
	}
	public String getDayOfWeek(){
		return day_of_week;
	}
	public String getSTime(){
		return stime;
	}
	public String getETime(){
		return etime;
	}
	public int getVerify(){
		return verify;
	}
	/*
	public class GeoLocation{
		private String lat;
		private String long1;
		
		public GeoLocation(){
			lat = "";
			long1 = "";
		}
		
		public void setLat(String lat){
			this.lat = lat;
		}
		public void setLong1(String long1){
			this.long1 = long1;
		}
		
		public String getLat(){
			return lat;
		}
		public String getLong(){
			return long1;
		}
		
		
	}*/

}


