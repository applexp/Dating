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
@WebServlet(name="EmailVerification", urlPatterns={"/zhs/email_verification"})
public class EmailVerification extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmailVerification() {
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

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/verify_email.jsp");
			dispatcher.forward(request, response);

			// resend verification code
		}else if(type.equals("1")){

			try{

				//generate a random password
				Random rnd = new Random();
				int random_pass = 100000 + rnd.nextInt(900000);

				// send email verification
				String update_sql = "update user set VerificationEmailCode = ? where Email = ?";

				PreparedStatement update_user_sql = con.prepareStatement(update_sql);
				update_user_sql.setString(1, random_pass+"");
				update_user_sql.setString(2, email);

				update_user_sql.executeUpdate();

				String host = "smtp.gmail.com";
				String from = "lov4egg";
				String pass = "move4Faregg";
				Properties props = System.getProperties();
				props.put("mail.smtp.starttls.enable", "true"); // added this line
				props.put("mail.smtp.host", host);
				props.put("mail.smtp.user", from);
				props.put("mail.smtp.password", pass);
				props.put("mail.smtp.port", "587");
				props.put("mail.smtp.auth", "true");

				String[] to = {"lov4egg@gmail.com"}; // added this line

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
				message.setSubject("\u7535\u5B50\u90AE\u4EF6\u5730\u5740\u9A8C\u8BC1\u7A0B\u5E8F - \u7231\u5728\u0035\u0032\u0030", "utf-8");
				message.setContent("<html><body><head></head>\u4F60\u597D, <br /><br />\u6B22\u8FCE\u4F60\u52A0\u5165\u7231\u5728\u0035\u0032\u0030\u5A5A\u59FB\u4EA4\u53CB\u7F51<br /><br />\u4F60\u7684\u7535\u5B50\u90AE\u4EF6\u9A8C\u8BC1\u7801 <b><span style=\"color: #D35858; font-size: 18px;\">"+ random_pass +"</span></b><br /><br /><small>\u7231\u5728\u0035\u0032\u0030\u5A5A\u59FB\u4EA4\u53CB\u7F51</small></body></html>","text/html; charset=utf-8");
				Transport transport = session.getTransport("smtp");
				transport.connect(host, from, pass);
				transport.sendMessage(message, message.getAllRecipients());
				transport.close();
				
				response.sendRedirect("email_verification?type=3&name=" + name + "&g1=" + g1 + "&g2=" + g2 + "&email=" + email); 
				


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

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/verify_email.jsp");
			dispatcher.forward(request, response);
			
			// avoid duplicate re-send email verification code
		}else if(type.equals("3")){
			
			request.setAttribute("name", new String(name.getBytes("ISO-8859-1"), "UTF-8"));
			request.setAttribute("g1", g1);
			request.setAttribute("g2", g2);
			request.setAttribute("email", email);
			request.setAttribute("notify_email", "true");
			request.setAttribute("notify_invalid_code", "false");
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/verify_email.jsp");
			dispatcher.forward(request, response);
			
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String code = request.getParameter("verifyemailcode");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String g1 = request.getParameter("g1");
		String g2 = request.getParameter("g2");
		
		boolean isRight = false;
		int temp_userID = -1;
		

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();
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
				s.setUsername(name);
				s.setUUID(uuid);
				s.setEmail(email);
				s.setStatus("zaixian");
				s.setRole("unpaid_Member");
				s.setTargetGender(g1, g2);
				
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
				PreparedStatement insert_userabout_sql = con.prepareStatement("insert into hunyin.userabout(userid) VALUES (?)");
				insert_userabout_sql.setInt(1, temp_userID);
				insert_userabout_sql.executeUpdate();
				
				
				response.sendRedirect("main?z=0&type=0");
				
			}else{
				response.sendRedirect("email_verification?type=2&name=" + URLEncoder.encode(name, "UTF-8") + "&g1=" + g1 + "&g2=" + g2 + "&email=" + email);
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
		}


	}

}
