package roti;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IniPage
 */
@WebServlet(name="Convertor", urlPatterns={"/zhs/convertor"})
public class Convertor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String PASS_SECRET_KEY = "gjfsa#()*;LDSFA;0sdfj3409asdef0FjsdJ=3SD";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Convertor() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		request.setCharacterEncoding("UTF-8");
//		//String gshi = request.getParameter("gshi");
//		
//		___IniDB db = new ___IniDB();
//		Connection con = db.getConnection();
//
//		try{
//			
//			//EncryptionBytes.toJieKai(PASS_SECRET_KEY, temp_password);
//			
//			
//			String sql_update_pass = "select userid, name, password from user";
//
//			PreparedStatement sql_pass = con.prepareStatement(sql_update_pass , ResultSet.TYPE_SCROLL_INSENSITIVE);
//
//			ResultSet rm = sql_pass.executeQuery();
//
//			boolean isLast = true;
//
//
//			//List<__Article> articalList = new ArrayList<__Article>();
//			String update_user_role = "update user set password = ? where userid = ?";
//			
//			if(rm.first()){
//				rm.beforeFirst();
//
//				while(isLast){
//					if(rm.next()){
//						
//						String pass = EncryptionBytes.toBaoMi(PASS_SECRET_KEY, rm.getString("password"));
//						int id = rm.getInt("userid");
//						System.out.println(id + "  " + rm.getString("name") + "  " + rm.getString("password") + " " + pass);
//						
//						
//						
//						PreparedStatement update_user_info_sql = con.prepareStatement(update_user_role);
//						update_user_info_sql.setString(1, pass);
//						update_user_info_sql.setInt(2, id);
//						int isUpdate = update_user_info_sql.executeUpdate();
//						
//
//					}else if(rm.last()){
//						isLast = false;
//					}
//				}
//			}
//			
//			
//			/*
//			String update_user_role = "update user set UUID = ?, Status = ?, LastLoginTime = ?, city = ?, state = ?, country = ?, postcode = ?, geolocation = ?, LastIPAddresses = ? where Email = ?";
//
//			PreparedStatement update_user_info_sql = con.prepareStatement(update_user_role);
//			update_user_info_sql.setString(1, uuid);
//			update_user_info_sql.setString(2, "zaixian");
//			update_user_info_sql.setTimestamp(3, new java.sql.Timestamp(today.getTime()));
//
//			update_user_info_sql.executeUpdate();
//*/
//		} catch (SQLException e) {
//			e.printStackTrace();
//			response.sendRedirect("index");
//		} catch(java.lang.NullPointerException e){
//			e.printStackTrace();
//			response.sendRedirect("index");
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			response.sendRedirect("index");
//		} finally{
//			db.setClose();
//		}

	}


	//System.out.println("convertor");

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
