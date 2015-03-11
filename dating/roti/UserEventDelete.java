package roti;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminEventDelete
 */
@WebServlet("/zhs/yonghu/shanchu")
public class UserEventDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserEventDelete() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String target_postid = request.getParameter("hao");
		String delete_type = request.getParameter("lei");

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();
		
		try{
			
			
			if(delete_type.equals("yige")){
				/**
				 * 
				 * 0 - hide from event list
				 * 1 - display on event list
				 * 
				 */
				String update_poststatus_str = "update post set poststatus = ? where postid = ?";
	
				PreparedStatement update_article_poststatus = con.prepareStatement(update_poststatus_str);
				update_article_poststatus.setInt(1, 0); 
				update_article_poststatus.setInt(2, Integer.parseInt(target_postid));
				update_article_poststatus.executeUpdate();
				
			}
			
			response.sendRedirect("liebiao");

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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {




	}

}
