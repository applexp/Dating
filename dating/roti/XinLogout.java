package roti;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class XinLogout
 */
@WebServlet(name="XinLogout", urlPatterns={"/zhs/logout"})
public class XinLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XinLogout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();
		
		java.util.Date today = new java.util.Date();
		
		try{
			
			___Session s = new ___Session(request);
			s.iniSession();
			
			String update_user_info = "update user set UUID = ?, status = ?, LastLoginTime = ? where Email = ?";

			PreparedStatement update_user_info_sql = con.prepareStatement(update_user_info);
			update_user_info_sql.setString(1, "");
			update_user_info_sql.setString(2, "xiaxian"); //unpaid_Member
			update_user_info_sql.setTimestamp(3, new java.sql.Timestamp(today.getTime()));
			update_user_info_sql.setString(4, s.getEmail());

			update_user_info_sql.executeUpdate();

			s.setUserID("-1");
			s.setUsername("");
			s.setUUID("");
			s.setEmail("");
			s.setStatus("xiaxian");
			s.setRole("");
			
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
