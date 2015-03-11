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

import org.joda.time.LocalDate;
import org.joda.time.Years;

/**
 * Servlet implementation class Login
 */
@WebServlet(name="UserSettingsPassword", urlPatterns={"/zhs/yonghu/mima"})
public class UserSettingsPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String PASS_SECRET_KEY = "gjfsa#()*;LDSFA;0sdfj3409asdef0FjsdJ=3SD";
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserSettingsPassword() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	/*
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		request.setCharacterEncoding("UTF-8");

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();
		java.util.Date today = new java.util.Date();

		try{

			___Session s = new ___Session(request);
			s.iniSession();

			___SessionUserStatus sus = new ___SessionUserStatus(request,s);
			request = sus.getUpdateRequest();

			String pass1 = request.getParameter("n_pass1");
			String pass2 = request.getParameter("n_pass2");
			String pass = request.getParameter("c_pass");

			boolean bothPassCorrect = false;

			if(pass1.equals(pass2))
				bothPassCorrect = true;


			
			 * 0 - both passwords are incorrect
			 * 1 - success update the user password
			 * 2 - unsuccessful / wrong password input for current password
			 * 
			 *
			if(bothPassCorrect){
				
				int tid = Integer.parseInt(s.getUserID());
				String temail = s.getEmail();
				String tuuid = s.getUUID();
				//String tstatus = "zaixian";

				String update_pass_st = "update user set password = ?, updateuserdate = ? where userid = ? and email = ? and UUID = ? and password = ?";

				PreparedStatement update_pass_sql = con.prepareStatement(update_pass_st);
				String en_pwd = EncryptionBytes.toBaoMi(PASS_SECRET_KEY, pass1);
				update_pass_sql.setString(1, en_pwd);
				update_pass_sql.setTimestamp(2, new java.sql.Timestamp(today.getTime()));
				update_pass_sql.setInt(3, tid);
				update_pass_sql.setString(4, temail);
				update_pass_sql.setString(5, tuuid);
				String en_pwd1 = EncryptionBytes.toBaoMi(PASS_SECRET_KEY, pass);
				update_pass_sql.setString(6, en_pwd1);

				int isUpdated = update_pass_sql.executeUpdate();
				System.out.println(isUpdated);
				if(isUpdated > 0){
					
					response.setContentType("text/plain");  
					response.setCharacterEncoding("UTF-8"); 
					response.getWriter().write("1"); 

				}else{
					
					response.setContentType("text/plain");  
					response.setCharacterEncoding("UTF-8"); 
					response.getWriter().write("2"); 
				}

			}else{
				
				response.setContentType("text/plain");  
				response.setCharacterEncoding("UTF-8"); 
				response.getWriter().write("0"); 
				
			}



		} catch(java.lang.NullPointerException e){
			e.printStackTrace();
			response.sendRedirect("../index");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("../index");
		} finally{
			db.setClose();
		}

	}
*/
}
