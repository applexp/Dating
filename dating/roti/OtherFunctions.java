package roti;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OtherFunctions
 */
@WebServlet(name="OtherFunctions", urlPatterns={"/zhs/others"})
public class OtherFunctions extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OtherFunctions() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String type = request.getParameter("type");
		String input1 = request.getParameter("input1");
		String input2 = request.getParameter("input2");

		//System.out.println(type + input1 + input2);

		if(type.equals("address")){
			System.out.println(type + input1 + input2);
			__ZipLocation geo = new __ZipLocation(input1, input2);

			String address = geo.getCity() +"||"+geo.getState();

			response.setContentType("text/plain");  
			response.setCharacterEncoding("UTF-8"); 
			response.getWriter().write(address); 

		}else if(type.equals("updateMailBoxTotal")){

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String input1 = request.getParameter("input1");
		String input2 = request.getParameter("input2");

		//System.out.println(type + input1 + input2);

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();
		boolean correctUser = false;
		int temp_userID = -1;

		try{


			___Session session = new ___Session(request);
			String sname = session.getUsername();
			String uuid = session.getUUID();
			String email = session.getEmail();
			String sstatus = session.getStatus();
			String role = session.getRole();

			PreparedStatement sql_user_account = con.prepareStatement("select userid, email from user where email = ? and UUID = ? and status = ?");
			sql_user_account.setString(1, email);
			sql_user_account.setString(2, uuid);
			sql_user_account.setString(3, sstatus);

			ResultSet result = sql_user_account.executeQuery();

			if (result.next()){
				if(email.equals(result.getString("email"))){
					temp_userID = result.getInt("userid");
					//temp_photo = result.getString("photo");

					//if(input1.equals(temp_userID+""))
					correctUser = true;
				}
			}

			if(correctUser){

				int notViewTotalReplyA = 0;
				int notViewTotalReplyB = 0;

				if(type.equals("updateMailBoxTotal")){

					String updatemailbox_sql = "SELECT sum(NotViewTotalReplyA) AS TotalReplyA, sum(NotViewTotalReplyB) AS TotalReplyB FROM hunyin.mail where userid = ? or loverid = ?"; 

					PreparedStatement get_total_update = con.prepareStatement(updatemailbox_sql);
					get_total_update.setInt(1, temp_userID);
					get_total_update.setInt(2, temp_userID);


					ResultSet rs = get_total_update.executeQuery();

					if (rs.next()){
						notViewTotalReplyA = rs.getInt("TotalReplyA");
						notViewTotalReplyB = rs.getInt("TotalReplyB");
					}

					System.out.println(notViewTotalReplyA + " "+notViewTotalReplyB);
				}
				
				


			}


		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("index");
		} catch(java.lang.NullPointerException e){
			System.out.println("main page");
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
