package roti;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
 * Servlet implementation class Login
 */
@WebServlet(name="XinLostPassword", urlPatterns={"/zhs/lost-password"})
public class XinLostPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String PASS_SECRET_KEY = "gjfsa#()*;LDSFA;0sdfj3409asdef0FjsdJ=3SD";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XinLostPassword() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setAttribute("no_email_inDB", "0");
		request.setAttribute("message", "0");
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/xin_lost_password.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		
		String email = request.getParameter("email");

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();

		boolean isEmailExist = false;
		int userid = -1;


		try{

			PreparedStatement slq_check_email_exist = con.prepareStatement("select userid from user where email = ?");
			slq_check_email_exist.setString(1, email);

			ResultSet result = slq_check_email_exist.executeQuery();

			if (result.next()){
				userid = result.getInt("userid");
				isEmailExist = true;
			}

			if(isEmailExist){
//				//generate a random password
//				Random rnd = new Random();
//				int random_pass = 1000 + rnd.nextInt(9000);
//
//				Random rnd1 = new Random();
//				char c1 = (char)(rnd1.nextInt(26) + 'a');
//
//				Random rnd2 = new Random();
//				char c2 = (char)(rnd2.nextInt(26) + 'A');
//
//				Random rnd3 = new Random();
//				char c3 = (char)(rnd2.nextInt(4) + '#');
//
//				Random rnd4 = new Random();
//				int random_pass1 = 100 + rnd4.nextInt(900);
//
//				String newpass = random_pass + "" + c1 +""+ c3 + "" + random_pass1 + c2;
				
				__GenerateRandomWords grw = new __GenerateRandomWords();
				String newpass1 = grw.getNRandomWords(16);
				//System.out.println(newpass1);
				
				String[] np1 = newpass1.split("1II1");
				String newpass = np1[1];
				
				// send email verification
				String update_sql = "update user set reset_password = ? where Email = ?";

				PreparedStatement update_user_sql = con.prepareStatement(update_sql);

				String en_pwd = EncryptionBytes.toBaoMi(PASS_SECRET_KEY, newpass);
				update_user_sql.setString(1, en_pwd);
				update_user_sql.setString(2, email);

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

				message.setSubject("\u66F4\u65B0\u7231\u805A\u8D26\u6237\u5BC6\u7801 - \u7231\u805A\u7EBD\u7EA6","utf-8");
				message.setContent("<html><body><head></head>\u8BF7\u70B9\u51FB\u6B64\u94FE\u63A5\u66F4\u65B0\u7231\u805A\u8D26\u6237\u5BC6\u7801\uFF1A\u0020 <a href=\"http://localhost:8080/Dating/zhs/lost-reset-password?sp="+ newpass1 + userid +" \"> www.aijunyc.com/zhs/lost-reset-password?sp="+ newpass1 + userid +"</a><br /><br /><small><a href=\"www.aijunyc.com\">\u7231\u805A\u7EBD\u7EA6</a>\u0020\u00B7\u0020\u7248\u6743\u6240\u6709</small></body></html>","text/html; charset=utf-8");
				Transport transport = session.getTransport("smtp");
				transport.connect(host, from, pass);
				transport.sendMessage(message, message.getAllRecipients());
				transport.close();

				request.setAttribute("message", "1");
				request.setAttribute("no_email_inDB", "0");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/xin_lost_password.jsp");
				dispatcher.forward(request, response);

			}else{
				
				request.setAttribute("message", "0");
				request.setAttribute("no_email_inDB", "1");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/xin_lost_password.jsp");
				dispatcher.forward(request, response);

			}

		} catch (AddressException e) {
			// TODO Auto-generated catch block
			response.sendRedirect("index");
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			response.sendRedirect("index");
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

}
