package roti;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckAvailableEmail
 */
@WebServlet(name="CheckAvailableEmail", urlPatterns={"/zhs/checkavailableemail"})
public class CheckAvailableEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckAvailableEmail() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String gender = request.getParameter("g1");
		String target_gender = request.getParameter("g2");
		String email = request.getParameter("email");

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();
		
		boolean isEmailExist = false;

		try {
			
			PreparedStatement sql_check_email = con.prepareStatement("select email from user where email = ?");
			sql_check_email.setString(1, email);

			ResultSet result = sql_check_email.executeQuery();
			//System.out.println(gender + target_gender + email + " " + isEmailExist);

			if (result.next())
				isEmailExist = true;
			
			//type 1 means the user is redirected from the 'checkavailableemail' path, not from the index page which is type '0'
			if(isEmailExist)
				response.sendRedirect("login?type=1&email=" + email); 
			else
				response.sendRedirect("register?email=" + email + "&g1=" + gender + "&g2="+ target_gender);
			
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("index");
		} catch(java.lang.NullPointerException e){
			e.printStackTrace();
			response.sendRedirect("index");
		} finally{
			db.setClose();
		}

	}

}
