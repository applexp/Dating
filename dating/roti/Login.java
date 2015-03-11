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
@WebServlet(name="Login", urlPatterns={"/zhs/login1"})
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String PASS_SECRET_KEY = "gjfsa#()*;LDSFA;0sdfj3409asdef0FjsdJ=3SD";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String type = request.getParameter("type");
		String email = request.getParameter("email");

		//		___Session session = new ___Session(request);
		//		session.iniSession();

		/**
		 * 1 - normal login
		 * 2 - redirect to login page from index [searching box] because the email is currently registered.
		 * 
		 */
		if(type.equals("0")){

			request.setAttribute("display_login_message", "false");
			request.setAttribute("login_warning", "false");
			
			String e = "";
			
			if(email != null || email != "")
				e = email;

			
			request.setAttribute("email", e);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/login.jsp");
			dispatcher.forward(request, response);

		}else if(type.equals("1")){

			request.setAttribute("display_login_message", "true");
			request.setAttribute("login_warning", "false");
			request.setAttribute("email", email);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/login.jsp");
			dispatcher.forward(request, response);
			
		}else if(type.equals("2")){

			request.setAttribute("display_login_message", "false");
			request.setAttribute("login_warning", "true");
			request.setAttribute("email", email);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/login.jsp");
			dispatcher.forward(request, response);
		}


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();

		boolean isUserExist = false;
		boolean isPasswordCorrect = false;
		String temp_password = "";
		String temp_role = "";
		String t_g1 = "", t_g2 = "";
		
		String temp_name = "";
		
		java.util.Date today = new java.util.Date();

		try {

			PreparedStatement sql_user_account = con.prepareStatement("select name, password, role, gender, interestedgender from user where email = ?");
			sql_user_account.setString(1, email);

			ResultSet result = sql_user_account.executeQuery();

			if (result.next()){
				temp_name = result.getString("name");
				temp_password = result.getString("password");
				temp_role = result.getString("role");
				t_g1 = result.getString("gender");
				t_g2 = result.getString("interestedgender");
				
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
					response.sendRedirect("email_verification?type=0&name=" + URLEncoder.encode(temp_name, "utf-8") + "&g1=" + t_g1 + "&g2=" + t_g2 + "&email=" + email);
				
				}else if(isPasswordCorrect){
					
					String uuid = UUID.randomUUID().toString();
					
					___Session s = new ___Session(request);
					s.iniSession();
					s.setUsername(temp_name);
					s.setUUID(uuid);
					s.setEmail(email);
					s.setStatus("zaixian");
					s.setRole(temp_role);
					s.setTargetGender(t_g1, t_g2);
					
					String update_user_role = "update user set UUID = ?, Status = ?, LastLoginTime = ? where Email = ?";

					PreparedStatement update_user_info_sql = con.prepareStatement(update_user_role);
					update_user_info_sql.setString(1, uuid);
					update_user_info_sql.setString(2, "zaixian");
					update_user_info_sql.setTimestamp(3, new java.sql.Timestamp(today.getTime()));
					update_user_info_sql.setString(4, email);

					update_user_info_sql.executeUpdate();
					
					response.sendRedirect("main?z=0&type=0");
					
				}else{
					
					// if wrong password
					response.sendRedirect("login?type=2&email=" + email); 
				}
				
			}else // if email is wrong
				response.sendRedirect("login?type=2&email=" + email); 

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
