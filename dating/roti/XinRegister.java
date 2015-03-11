package roti;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.joda.time.LocalDate;
import org.joda.time.Years;

import com.amazonaws.util.json.JSONObject;

/**
 * Servlet implementation class Login
 */
@WebServlet(name="XinRegister", urlPatterns={"/zhs/register"})
public class XinRegister extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static final String PASS_SECRET_KEY = "gjfsa#()*;LDSFA;0sdfj3409asdef0FjsdJ=3SD";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XinRegister() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setAttribute("register_email_warning", "0");
		request.setAttribute("register_warning", "0");
		request.setAttribute("register_pass_warning", "0");
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/xin_register.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String clietip = getClientIpAddr(request);
		__IpLocation ip = new __IpLocation(clietip);
		String city = ip.getCity();
		String state = ip.getState();
		String country = ip.getCountry();
		String postcode = ip.getPostcode();
		String geolocation = ip.getGeoLocation();

		String[] t = request.getParameterValues("type");
		String[] s = request.getParameterValues("sexes");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String password1 = request.getParameter("cpassword");
		String organization = request.getParameter("organization");
		String subscribe = request.getParameter("subscribe");
		String[] is = request.getParameterValues("interests");


		String type = "";
		String sex = ""; 

		//String subscribe = "";
		String interest_st = "";
		String user_school_st = "insert into hunyin.user(Name, Email, Password, CreatedDate, Role, typeuser, gender, school, city, state, country, postcode, geolocation, LastIPAddresses, Interest_survey, isSubscribe, point) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		String user_organiztion_st = "insert into hunyin.user(Name, Email, Password, CreatedDate, Role, typeuser, gender, organization, city, state, country, postcode, geolocation, LastIPAddresses, Interest_survey, isSubscribe, point) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		String user_st = "";

		for(String types : t)
			type = types;

		for(String sexes : s)
			sex = sexes;

		if(subscribe == null)
			subscribe = "0";

		if(is == null){
			interest_st = "-1,";
		}else{
			System.out.print(is);
			for(String interest : is){

				if(interest == null)
					interest_st += "-1,";
				else
					interest_st += interest +",";
			}
		}
		interest_st += "@";

		if(type.equals("1")){
			user_st = user_school_st;
		}else if(type.equals("2")){
			user_st = user_organiztion_st;
		}

		System.out.println(subscribe+" $$ "+ interest_st);

		String g1 = "", g2 = "";

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();
		java.util.Date today = new java.util.Date();

		boolean isEmailExist = false;
		boolean isPassMatch = false;
		boolean isValidEmail = false;

		// check the format of the email address
		String pattern = "[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,6}$";
		// Create a Pattern object
		Pattern p = Pattern.compile(pattern);
		// Now create matcher object.
		Matcher match = p.matcher(email);
		if(!(match.find())){
			isValidEmail = true;
		}

		try {

			//System.out.println(name + " " + month + " " + year + " " + country + " " + postcode + " " + password + " " + g1 + " " + g2 + " " + email);

			PreparedStatement sql_check_email = con.prepareStatement("select email from user where email = ?");
			sql_check_email.setString(1, email);

			ResultSet result = sql_check_email.executeQuery();

			if (result.next())
				isEmailExist = true;

			if(password.equals(password1))
				isPassMatch = true;

			if(isValidEmail){
				request.setAttribute("register_email_warning", "1");
				request.setAttribute("register_warning", "0");
				request.setAttribute("register_pass_warning", "0");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/xin_register.jsp");
				dispatcher.forward(request, response);

			}else if(isEmailExist){

				request.setAttribute("register_email_warning", "0");
				request.setAttribute("register_warning", "1");
				request.setAttribute("register_pass_warning", "0");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/xin_register.jsp");
				dispatcher.forward(request, response);

			}else if(!isPassMatch){

				request.setAttribute("register_email_warning", "0");
				request.setAttribute("register_warning", "0");
				request.setAttribute("register_pass_warning", "1");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/xin_register.jsp");
				dispatcher.forward(request, response);

			}else{

				// insert new user information
				PreparedStatement sql_register_user = con.prepareStatement(user_st);
				sql_register_user.setString(1, name);
				sql_register_user.setString(2, email);
				String en_pwd = EncryptionBytes.toBaoMi(PASS_SECRET_KEY, password);
				sql_register_user.setString(3, en_pwd);
				sql_register_user.setTimestamp(4, new java.sql.Timestamp(today.getTime()));
				sql_register_user.setString(5, "unconfirmedEmail");
				sql_register_user.setInt(6, Integer.parseInt(type));
				sql_register_user.setString(7, sex);
				sql_register_user.setString(8, organization);
				sql_register_user.setString(9, city);
				sql_register_user.setString(10, state);
				sql_register_user.setString(11, country);
				sql_register_user.setString(12, postcode);
				sql_register_user.setString(13, geolocation);
				sql_register_user.setString(14, clietip);
				sql_register_user.setString(15, interest_st);
				sql_register_user.setInt(16, Integer.parseInt(subscribe));
				sql_register_user.setInt(17, 5);

				sql_register_user.executeUpdate();




				//generate a random password
				Random rnd = new Random();
				int random_pass = 100000 + rnd.nextInt(900000);

				// send email verification
				String update_sql = "update user set VerificationEmailCode = ?, WeiXinComfirmationCode = ? where Email = ?";

				PreparedStatement update_user_sql = con.prepareStatement(update_sql);
				update_user_sql.setString(1, random_pass+"");
				update_user_sql.setString(2, random_pass+"");
				update_user_sql.setString(3, email);

				update_user_sql.executeUpdate();

				String host = "smtp.gmail.com";
				String from = "aijunyc";
				String pass = "cynuj1A2014";
				Properties props = System.getProperties();
				props.put("mail.smtp.starttls.enable", "true"); // added this line
				props.put("mail.smtp.host", host);
				props.put("mail.smtp.user", from);
				props.put("mail.smtp.password", pass);
				props.put("mail.smtp.port", "587");
				props.put("mail.smtp.auth", "true");

				String[] to = {email}; // added this line

				Session session = Session.getDefaultInstance(props, null);
				MimeMessage message = new MimeMessage(session);


				message.setFrom(new InternetAddress(from));
				message.setHeader("Content-Type", "text/html; charset=utf-8");

				InternetAddress[] toAddress = new InternetAddress[to.length];

				// To get the array of addresses
				for( int i=0; i < to.length; i++ ) { // changed from a while loop
					toAddress[i] = new InternetAddress(to[i]);
				}
				//System.out.println(Message.RecipientType.TO);

				for( int i=0; i < toAddress.length; i++) { // changed from a while loop
					message.addRecipient(Message.RecipientType.TO, toAddress[i]);
				}
				message.setSubject("\u7535\u5B50\u90AE\u4EF6\u5730\u5740\u9A8C\u8BC1\u7A0B\u5E8F - \u7231\u805A\u7EBD\u7EA6","utf-16");
				message.setContent("<html><body><head></head>\u4F60\u597D, "+new String(name.getBytes("ISO-8859-1"), "UTF-8")+"<br /><br />\u6B22\u8FCE\u60A8\u52A0\u5165\u7231\u805A\u7EBD\u7EA6<br /><br />\u4F60\u7684\u7535\u5B50\u90AE\u4EF6\u9A8C\u8BC1\u7801 <b><span style=\"color: #D35858; font-size: 18px;\">"+ random_pass +"</span></b><br /><br />"
						+ "\u4e0e\u6b64\u540c\u65f6\uff0c\u5728\u6211\u4eec\u7231\u805a\u5fae\u4fe1\u516c\u4f17\u5e73\u8f93\u5165\u9a8c\u8bc1\u7801 <b><span style=\"color: #D35858; font-size: 18px;\">"+ random_pass +"</span></b> "
						+ "\uff0c\u4f60\u7684\u90ae\u4ef6\u548c\u5fae\u4fe1\u53f7\u8d26\u53f7\u53ef\u4ee5\u540c\u65f6\u88ab\u786e\u8ba4\u3002<br/><br/>"
						+ "\u8fd9\u6837\u6539\u5929\u60a8\u53ef\u4ee5\u5728\u6211\u4eec\u7684\u5fae\u4fe1\u516c\u4f17\u5e73\u53f0\u548c\u7231\u805a\u7f51\u7ad9\u4e0a\u4f20\u53ca\u4fee\u6539\u56fe\u7247\u3002\u786e\u4fdd\u4e0a\u4f20\u7684\u7167\u7247\u662f\u5f52\u4e8e\u4f60\u6240\u62e5\u6709\u7684\u3002<br /><br />"
						+ "<small><a href=\"www.aijunyc.com\">\u7231\u805A\u7EBD\u7EA6</a>\u0020\u00B7\u0020\u7248\u6743\u6240\u6709</small></body></html>","text/html; charset=utf-8");
				Transport transport = session.getTransport("smtp");
				transport.connect(host, from, pass);
				transport.sendMessage(message, message.getAllRecipients());
				transport.close();

				/**
				 * 1 - if the person makes a subscribe to our news
				 */
				if(subscribe.equals("1"))
					mailChimp(email);


				//response.sendRedirect("email-verification?type=0&name=" + URLEncoder.encode(name, "utf-8") + "&g1=" + g1 + "&g2=" + g2 + "&email=" + email);
				response.sendRedirect("email-verification?type=0&name=" + URLEncoder.encode(name, "utf-8") + "&g1=" + g1 + "&g2=" + g2 + "&email=" + email);

			}

		} catch (AddressException e) {
			e.printStackTrace();
			System.out.println("1");
			response.sendRedirect("index");
		} catch (MessagingException e) {
			e.printStackTrace();
			System.out.println("2");
			response.sendRedirect("index");
		} catch(java.lang.NullPointerException e){
			e.printStackTrace();
			System.out.println("2");
			response.sendRedirect("index");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("4");
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

	public void mailChimp(String email){

		//HttpClient httpClient = new DefaultHttpClient();
		HttpClient httpClient = HttpClientBuilder.create().build();
		try {

			
			String url = "https://us8.api.mailchimp.com/2.0/lists/subscribe.json";

			JSONObject json = new JSONObject();
			json.put("apikey", "ec65f94622a245959c9291431f45eaf9-us8");   
			json.put("id", "d35257a290");
			
			JSONObject email_json = new JSONObject();
			email_json.put("email", email);
			json.put("email", email_json);

			HttpPost request = new HttpPost(url);
			StringEntity params =new StringEntity(json.toString());
			request.addHeader("content-type", "application/json");
			request.setEntity(params);
			HttpResponse response = httpClient.execute(request);

			
			//response = httpClient.execute(url);

			System.out.println("\nSending 'POST' request to URL : " + url);
			//System.out.println("Post parameters : " + post.getEntity());
			System.out.println("Response Code : " + 
					response.getStatusLine().getStatusCode());

			BufferedReader rd = new BufferedReader(
					new InputStreamReader(response.getEntity().getContent()));

			StringBuffer result = new StringBuffer();
			String line = "";
			while ((line = rd.readLine()) != null) {
				result.append(line);
			}

			//System.out.println(result.toString());
			
			
			// handle response here...
		}catch (Exception ex) {
			// handle exception here
		} finally {
			httpClient.getConnectionManager().shutdown();
		}

		/*
		String url = "https://us8.api.mailchimp.com/2.0/subscribe.json?apikey=ec65f94622a245959c9291431f45eaf9-us8&id=AJ_Dating&email[email]=larebils@gmail.com";

		HttpClient client = new DefaultHttpClient();
		HttpPost post = new HttpPost(url);
		// add header
		//post.setHeader("User-Agent", USER_AGENT);

		List<NameValuePair> urlParameters = new ArrayList<NameValuePair>();
		urlParameters.add(new BasicNameValuePair("apikey", "ec65f94622a245959c9291431f45eaf9-us8"));
		urlParameters.add(new BasicNameValuePair("id", "AJ_Dating"));
		urlParameters.add(new BasicNameValuePair("email[email]", email));

		try {

			post.setEntity(new UrlEncodedFormEntity(urlParameters));

			HttpResponse response;
			response = client.execute(post);

			System.out.println("\nSending 'POST' request to URL : " + url);
			System.out.println("Post parameters : " + post.getEntity());
			System.out.println("Response Code : " + 
					response.getStatusLine().getStatusCode());

			BufferedReader rd = new BufferedReader(
					new InputStreamReader(response.getEntity().getContent()));

			StringBuffer result = new StringBuffer();
			String line = "";
			while ((line = rd.readLine()) != null) {
				result.append(line);
			}

			System.out.println(result.toString());

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 */
	}

}
