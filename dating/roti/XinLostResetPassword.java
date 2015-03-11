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
@WebServlet(name="XinLostResetPassword", urlPatterns={"/zhs/lost-reset-password"})
public class XinLostResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String PASS_SECRET_KEY = "gjfsa#()*;LDSFA;0sdfj3409asdef0FjsdJ=3SD";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XinLostResetPassword() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();


		try {

			String s = request.getParameter("sp");

			// get temporary password
			String[] np1 = s.split("1II1");
			String newpass = np1[1];

			newpass = EncryptionBytes.toBaoMi(PASS_SECRET_KEY, newpass);

			// get user id
			String[] np2 = s.split("fqq");
			int userid = Integer.parseInt(np2[1]);

			boolean isResetExist = false;


			PreparedStatement sql_user_account = con.prepareStatement("select userid from user where userid = ? and reset_password = ?");
			sql_user_account.setInt(1, userid);
			sql_user_account.setString(2, newpass);

			ResultSet result = sql_user_account.executeQuery();

			if (result.next())
				isResetExist = true;

			if(isResetExist){

				request.setAttribute("userid", userid);
				request.setAttribute("not_match_warning", "0");
				request.setAttribute("success", "0");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/xin_lost_reset_password.jsp");
				dispatcher.forward(request, response);

			}else{ 
				response.sendRedirect("index");
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String pass = request.getParameter("password");
		String pass1 = request.getParameter("password1");
		String userid = request.getParameter("userid");

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();

		try{

			if(pass.equals(pass1)){
				
				String update_user_pass = "update user set password = ?, reset_password = ? where userid = ?";

				PreparedStatement update_user_pass_sql = con.prepareStatement(update_user_pass);
				String en_pwd = EncryptionBytes.toBaoMi(PASS_SECRET_KEY, pass);
				update_user_pass_sql.setString(1, en_pwd);
				update_user_pass_sql.setString(2, ""); // reset to ""
				update_user_pass_sql.setInt(3, Integer.parseInt(userid));

				update_user_pass_sql.executeUpdate();
				
				request.setAttribute("userid", userid);
				request.setAttribute("not_match_warning", "0");
				request.setAttribute("success", "1");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/xin_lost_reset_password.jsp");
				dispatcher.forward(request, response);

			}else{

				request.setAttribute("userid", userid);
				request.setAttribute("not_match_warning", "1");
				request.setAttribute("success", "0");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/xin_lost_reset_password.jsp");
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

}
