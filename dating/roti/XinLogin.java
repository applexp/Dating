package roti;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet(name="XinLogin", urlPatterns={"/zhs/login"})
public class XinLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String PASS_SECRET_KEY = "gjfsa#()*;LDSFA;0sdfj3409asdef0FjsdJ=3SD";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XinLogin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setAttribute("login_warning", "0");
		request.setAttribute("email", "");
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/xin_login.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String gshi = request.getParameter("gshi");
		
		String clietip = getClientIpAddr(request);
		//System.out.println("ip: "+clietip);
		__IpLocation ip = new __IpLocation(clietip);
		String city = ip.getCity();
		String state = ip.getState();
		String country = ip.getCountry();
		String postcode = ip.getPostcode();
		String geolocation = ip.getGeoLocation();
		
		//System.out.println(city +" "+ postcode+" "+ geolocation);
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();

		boolean isUserExist = false;
		boolean isPasswordCorrect = false;
		String temp_password = "";
		String temp_role = "";
		String t_g1 = "", t_g2 = "";
		String temp_uid = "";
		String temp_name = "";
		String t_photo = "";
		
		java.util.Date today = new java.util.Date();

		try {

			PreparedStatement sql_user_account = con.prepareStatement("select userid, name, password, role, gender, interestedgender, photo from user where email = ?");
			sql_user_account.setString(1, email);

			ResultSet result = sql_user_account.executeQuery();

			if (result.next()){
				temp_uid = result.getString("userid");
				temp_name = result.getString("name");
				temp_password = result.getString("password");
				temp_role = result.getString("role");
				t_g1 = result.getString("gender");
				t_g2 = result.getString("interestedgender");
				t_photo = result.getString("photo");
				
				isUserExist = true;
			}

			if(isUserExist){

				String dec_pwd;

				dec_pwd = EncryptionBytes.toJieKai(PASS_SECRET_KEY, temp_password);

				if(password.equals(dec_pwd))
					isPasswordCorrect = true;
				
				if(isPasswordCorrect && temp_role.equals("unconfirmedEmail")){
					
					//email_verification?type=0&name=" + name + "&g1=" + g1 + "&g2=" + g2 + "&email=" + email
					//response.sendRedirect("email_verification?type=0&email="+ email);
					response.sendRedirect("email-verification?type=0&name=" + URLEncoder.encode(temp_name, "utf-8") + "&g1=" + t_g1 + "&g2=" + t_g2 + "&email=" + email);
				
				}else if(isPasswordCorrect){
					
					String uuid = UUID.randomUUID().toString();
					
					___Session s = new ___Session(request);
					s.iniSession();
					s.setUserID(temp_uid);
					s.setUsername(temp_name);
					s.setUUID(uuid);
					s.setEmail(email);
					s.setStatus("zaixian");
					s.setRole(temp_role);
					s.setPhotoPath(t_photo);

					String update_user_role = "update user set UUID = ?, Status = ?, LastLoginTime = ?, city = ?, state = ?, country = ?, postcode = ?, geolocation = ?, LastIPAddresses = ? where Email = ?";

					PreparedStatement update_user_info_sql = con.prepareStatement(update_user_role);
					update_user_info_sql.setString(1, uuid);
					update_user_info_sql.setString(2, "zaixian");
					update_user_info_sql.setTimestamp(3, new java.sql.Timestamp(today.getTime()));
					update_user_info_sql.setString(4, city);
					update_user_info_sql.setString(5, state);
					update_user_info_sql.setString(6, country);
					update_user_info_sql.setString(7, postcode);
					update_user_info_sql.setString(8, geolocation);
					update_user_info_sql.setString(9, clietip);
					update_user_info_sql.setString(10, email);
					
					update_user_info_sql.executeUpdate();
					
					if(gshi.equals("1") || gshi.equals("2"))
						response.sendRedirect("yonghu/shangchuan");
					else if(gshi.equals("-1"))
						response.sendRedirect("index");
					
				}else{
					
					// if wrong password
					request.setAttribute("login_warning", "1");
					request.setAttribute("email", email);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/xin_login.jsp");
					dispatcher.forward(request, response);
					
				}
				
			}else{ 
				
				// if email is wrong
				request.setAttribute("login_warning", "1");
				request.setAttribute("email", email);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/xin_login.jsp");
				dispatcher.forward(request, response);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("index");
		} catch(java.lang.NullPointerException e){
			e.printStackTrace();
			response.sendRedirect("index");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("index");
		} finally{
			db.setClose();
		}

	}
	
	public static String getClientIpAddr(HttpServletRequest request) {  
        String ip = request.getHeader("X-Forwarded-For");  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("WL-Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_CLIENT_IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getRemoteAddr();  
        }  
        return ip;  
    }  

}
