package roti;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;

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

/**
 * Servlet implementation class EmailVerification
 */
@WebServlet(name="XinEmailVerification", urlPatterns={"/zhs/email-verification"})
public class XinEmailVerification extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XinEmailVerification() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		
		String type = request.getParameter("type");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String g1 = request.getParameter("g1");
		String g2 = request.getParameter("g2");

//		System.out.println("F "+new String(name.getBytes("ISO-8859-1"), "UTF-8"));
//		String text = java.net.URLDecoder.decode(name, "ISO-8859-1");
//		System.out.println("text "+text);
//		System.out.println("ss "+name);
		
		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();

		if(type.equals("0")){

			request.setAttribute("name", new String(name.getBytes("ISO-8859-1"), "UTF-8"));
			request.setAttribute("g1", g1);
			request.setAttribute("g2", g2);
			request.setAttribute("email", email);
			request.setAttribute("notify_email", "false");
			request.setAttribute("notify_invalid_code", "false");

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/xin_verify_email.jsp");
			dispatcher.forward(request, response);

			// resend verification code
		}else if(type.equals("1")){

			try{

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
				
				response.sendRedirect("email-verification?type=3&name=" + name + "&g1=" + g1 + "&g2=" + g2 + "&email=" + email); 
				


			} catch (AddressException e) {
				// TODO Auto-generated catch block
				response.sendRedirect("index");
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				response.sendRedirect("index");
			} catch(java.lang.NullPointerException e){
				e.printStackTrace();
				response.sendRedirect("index");
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("index");
			} finally{
				db.setClose();
			}
			
			// if the verification email code is invalid
		}else if(type.equals("2")){
			
			request.setAttribute("name", new String(name.getBytes("ISO-8859-1"), "UTF-8"));
			request.setAttribute("g1", g1);
			request.setAttribute("g2", g2);
			request.setAttribute("email", email);
			request.setAttribute("notify_email", "false");
			request.setAttribute("notify_invalid_code", "true");

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/xin_verify_email.jsp");
			dispatcher.forward(request, response);
			
			// avoid duplicate re-send email verification code
		}else if(type.equals("3")){
			
			request.setAttribute("name", new String(name.getBytes("ISO-8859-1"), "UTF-8"));
			request.setAttribute("g1", g1);
			request.setAttribute("g2", g2);
			request.setAttribute("email", email);
			request.setAttribute("notify_email", "true");
			request.setAttribute("notify_invalid_code", "false");
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/xin_verify_email.jsp");
			dispatcher.forward(request, response);
			
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String gshi = request.getParameter("gshi");
		
		String code = request.getParameter("verifyemailcode");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String g1 = request.getParameter("g1");
		String g2 = request.getParameter("g2");
		
		boolean isRight = false;
		int temp_userID = -1;
		

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();
		
//		___IniDB db1 = new ___IniDB("ajliuyan");
//		Connection con1 = db1.getConnection();
		
		java.util.Date today = new java.util.Date();
		
		try{
			
			PreparedStatement sql_check_emailverifycode = con.prepareStatement("select UserID, VerificationEmailCode from user where email = ?");
			sql_check_emailverifycode.setString(1, email);

			ResultSet result = sql_check_emailverifycode.executeQuery();

			if (result.next()){
				temp_userID = result.getInt("UserID");
				String temp_code = result.getString("VerificationEmailCode");
				
				if(temp_code.equals(code))
					isRight = true;
			}
				
			//if verification code is right
			if(isRight){
				
				String uuid = UUID.randomUUID().toString();
				
				___Session s = new ___Session(request);
				s.iniSession();
				s.setUserID(temp_userID+"");
				s.setUsername(name);
				s.setUUID(uuid);
				s.setEmail(email);
				s.setStatus("zaixian");
				s.setRole("unpaid_Member");
				//s.setTargetGender(g1, g2);
				
				String update_user_role = "update user set UUID = ?, Role = ?, VerificationEmailCode = ?, Status = ?, LastLoginTime = ? where Email = ?";

				PreparedStatement update_user_role_sql = con.prepareStatement(update_user_role);
				update_user_role_sql.setString(1, uuid);
				update_user_role_sql.setString(2, "unpaid_Member"); //unpaid_Member
				update_user_role_sql.setString(3, "");
				update_user_role_sql.setString(4, "zaixian");
				update_user_role_sql.setTimestamp(5, new java.sql.Timestamp(today.getTime()));
				update_user_role_sql.setString(6, email);

				update_user_role_sql.executeUpdate();
				
				
				//insert this user's record in the userabout table
//				PreparedStatement insert_liuyan_sql = con1.prepareStatement("insert into ajliuyan.article_comment(userid, username) VALUES (?,?)");
//				insert_liuyan_sql.setInt(1, temp_userID);
//				insert_liuyan_sql.setString(2, name);
//				insert_liuyan_sql.executeUpdate();
				
				if(gshi.equals("1") || gshi.equals("2"))
					response.sendRedirect("yonghu/shangchuan");
				else if(gshi.equals("-1"))
					response.sendRedirect("index");
				
				
			}else{
				response.sendRedirect("email-verification?type=2&name=" + URLEncoder.encode(name, "UTF-8") + "&g1=" + g1 + "&g2=" + g2 + "&email=" + email);
			}
			
			
		} catch(java.lang.NullPointerException e){
			e.printStackTrace();
			System.out.println("email verification");
			response.sendRedirect("index");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("index");
		} finally{
			db.setClose();
//			db1.setClose();
		}


	}

}
