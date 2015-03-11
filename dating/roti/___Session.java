package roti;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class ___Session {

	private static final String SECRET_KEY = "LS%)24LKlsdfOJ*(#VJSisdfj49wSKFFJ120JFSlsdkq[x0";

	private static final String USERNAME_SESSION_KEY = "LKSD39FSJAsdiiSDFASDFs[322";
	private static final String UID_SESSION_KEY = "%ALSDF2039#%FASDF;XZasldfjw23^#J09OFJA";
	private static final String UUID_SESSION_KEY = "DC9ABFD3as34@(#ls)11F4E39E0876343!D";
	private static final String EMAIL_SESSION_KEY = "sdf@&f)2C8F6C29798C535dfg)#*098397";
	private static final String STATUS_SESSION_KEY = "2Edf21563#$%62B9dfg20947A*&fg200B5AdA1";
	private static final String ROLE_SESSION_KEY = "58#85CE0d21d4FdCdf5F9A4C8C8&E)(^34";
	private static final String TARGET_GENDER_KEY = "asd2ASDFJ0JL23$#@SLDFL";
	private static final String TARGET_YEAR_KEY = "ASD234JASDFL#)(FJASDKFJLdk";
	private static final String USER_PROFILE_PHOTO_PATH = "asdfXCVMEG#$asdfaASFAD23F@R";
	
	private static final String STATUS_XIAXIAN_MSG = "f43ASDFJ2P;alsd$#(jf;sdLASFL20";
	private static final String STATUS_ZAIXIAN_MSG = "AS23ldfk02ASDLFJ)@;LAJS-2LSDF";
	
	private static final String STATUS_NON_MEMBER_MSG = "DFGHHF45a#GF3DFDF";
	private static final String STATUS_UPPAID_MEMBER_MSG = "GSE2-*-9087asdfLKSJDF";
	private static final String STATUS_ADMIN_MEMBER_MSG = "lKJ098yf2kjFDLSJ89sdfjapo290";
	private static final String STATUS_MEMBER_MSG = "FGHJ56HDFdfgDFG32%S";
	
	private HttpServletRequest request;
	private HttpSession session;

	public ___Session(HttpServletRequest request){
		this.request = request;
		session = request.getSession(true);
		session.setMaxInactiveInterval(7*12*60*60);
	}

	public void iniSession(){

		try {
			if (session.isNew()){

				session.setAttribute(UID_SESSION_KEY, "-1");
				session.setAttribute(USERNAME_SESSION_KEY, "");
				session.setAttribute(UUID_SESSION_KEY, EncryptionBytes.toBaoMi(SECRET_KEY, ""));
				session.setAttribute(EMAIL_SESSION_KEY, EncryptionBytes.toBaoMi(SECRET_KEY, ""));
				session.setAttribute(STATUS_SESSION_KEY, STATUS_XIAXIAN_MSG);
				session.setAttribute(ROLE_SESSION_KEY, STATUS_NON_MEMBER_MSG);
				session.setAttribute(TARGET_GENDER_KEY, "");
				session.setAttribute(TARGET_YEAR_KEY, "");
				
				//System.out.println("inside session");
			}
			
			//System.out.println("outside session");

		} catch (Exception e) { System.out.println("Encrpytion error");}
	}
	
	public void setUserID(String userID){
		session.setAttribute(UID_SESSION_KEY, userID);
	}
	public void setUsername(String username){
		session.setAttribute(USERNAME_SESSION_KEY, username);
	}
	public void setUUID(String uuid){
		try {
			session.setAttribute(UUID_SESSION_KEY, EncryptionBytes.toBaoMi(SECRET_KEY, uuid));
			
		} catch (Exception e) {e.printStackTrace();}
	}
	public void setEmail(String email){
		try {
			session.setAttribute(EMAIL_SESSION_KEY, EncryptionBytes.toBaoMi(SECRET_KEY, email));
			
		} catch (Exception e) {e.printStackTrace();}
	}
	public void setStatus(String status){
		
		if(status.equals("xiaxian"))
			status = STATUS_XIAXIAN_MSG;
		else if(status.equals("zaixian"))
			status = STATUS_ZAIXIAN_MSG;
		else
			status = "";
		
		session.setAttribute(STATUS_SESSION_KEY, status);
	}
	public void setRole(String role){
		
		if(role.equals("unpaid_Member"))
			role = STATUS_UPPAID_MEMBER_MSG;
		else if(role.equals("guanliyuan"))
			role = STATUS_ADMIN_MEMBER_MSG;
		else
			role = STATUS_NON_MEMBER_MSG;
			
		session.setAttribute(ROLE_SESSION_KEY, role);
	}
	public void setTargetGender(String g1, String g2){
		
		int targetNo = -1;
		
		if(g1.equals("male") && g2.equals("female"))
			targetNo = 0;
		else if(g1.equals("female") && g2.equals("male"))
			targetNo = 1;
		else if(g1.equals("male") && g2.equals("male"))
			targetNo = 2;
		else if(g1.equals("female") && g2.equals("female"))
			targetNo = 3;
		
		session.setAttribute(TARGET_GENDER_KEY, targetNo);
	}
	public void setYear(int year){
		session.setAttribute(TARGET_YEAR_KEY, year+"");
	}
	public void setPhotoPath(String photoPath){
		session.setAttribute(USER_PROFILE_PHOTO_PATH, photoPath+"");
	}
	
	public HttpSession getSession_(){
		return session;
	}
	public String getUserID(){
		return (String) session.getAttribute(UID_SESSION_KEY);
	}
	public String getUsername(){
		return (String) session.getAttribute(USERNAME_SESSION_KEY);
	}
	public String getUUID(){
		String uuid = "";
		try {
			uuid = EncryptionBytes.toJieKai(SECRET_KEY, (String) session.getAttribute(UUID_SESSION_KEY));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return uuid;
	}
	public String getEmail(){
		String email = "";
		try {
			email = EncryptionBytes.toJieKai(SECRET_KEY, (String) session.getAttribute(EMAIL_SESSION_KEY));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return email;
	}
	public String getStatus(){
		
		String status = (String) session.getAttribute(STATUS_SESSION_KEY);
		if(status == null)
			status = "";
		
		if(status.equals(STATUS_XIAXIAN_MSG))
			status = "xiaxian";
		else if(status.equals(STATUS_ZAIXIAN_MSG))
			status = "zaixian";
		
		return status;
	}
	public String getRole(){
		
		String role = (String) session.getAttribute(ROLE_SESSION_KEY);
		
		if(role.equals(STATUS_NON_MEMBER_MSG))
			role = "";
		if(role.equals(STATUS_ADMIN_MEMBER_MSG))
			role = "guanliyuan";
		else if(role.equals(STATUS_UPPAID_MEMBER_MSG))
			role = "unpaid_Member";
		
		return role;
	}
	public int getTargetGender(){
		return (int) session.getAttribute(TARGET_GENDER_KEY);
	}
	public String getGenders(){
		int gIndex = -1;
		String genders = "";
		
		gIndex = (int) session.getAttribute(TARGET_GENDER_KEY);
		
		if(gIndex == 0)
			genders = "male@female";
		else if(gIndex == 1)
			genders = "female@male";
		else if(gIndex == 2)
			genders = "male@male";
		else if(gIndex == 3)
			genders = "female@female";
		
		return genders;
	}
	public String getYear(){
		return (String) session.getAttribute(TARGET_YEAR_KEY);
	}
	public String getPhotoPath(){
		return (String) session.getAttribute(USER_PROFILE_PHOTO_PATH);
	}
}