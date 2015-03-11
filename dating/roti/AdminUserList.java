package roti;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminUserList
 */
@WebServlet("/zhs/admin/yonghuliebiao")
public class AdminUserList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int MAX_PER_LIST = 100;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminUserList() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String index = request.getParameter("i");
		
		___Session s = new ___Session(request);
		s.iniSession();

		___SessionUserStatus sus = new ___SessionUserStatus(request,s);
		request = sus.getUpdateRequest();

		HttpServletRequest r = null;

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();

		boolean isAdmin = false;

		try{

			String t_uid = s.getUserID();
			String t_name = s.getUsername();
			String t_email = s.getEmail();
			String t_UUID = s.getUUID();
			String t_role = s.getRole();
			//String t_status = s.getStatus();

			String db_email, db_uuid, db_role, db_status;

			PreparedStatement sql_is_admin = con.prepareStatement("select email, role, uuid, status from hunyin.user where email = ? and uuid = ? and role = ? and status = ?");
			sql_is_admin.setString(1, t_email);
			sql_is_admin.setString(2, t_UUID);
			sql_is_admin.setString(3, t_role);
			sql_is_admin.setString(4, "zaixian");

			ResultSet result = sql_is_admin.executeQuery();

			if (result.next()){
				db_role = result.getString("role");
				db_status = result.getString("status");

				if(db_role.equals("guanliyuan") && db_status.equals("zaixian"))
					isAdmin = true;
			}

			if(isAdmin){

				String sql_count_st = "select count(*) as total from user";
				PreparedStatement sql_count = con.prepareStatement(sql_count_st);
				ResultSet rm = sql_count.executeQuery();
				String total = "";
				if (rm.next()) {
					total = rm.getString("total");
				}
				
				r = getAllUsers(con, request, Integer.parseInt(index));
				r.setAttribute("total", total);
				
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/admin/admin_user_list.jsp");
				dispatcher.forward(r, response);

			}else{
				response.sendRedirect("../login");
			}


		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("../index");
		} catch(java.lang.NullPointerException e){
			System.out.println("main page");
			e.printStackTrace();
			response.sendRedirect("../index");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("../index");
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

	private HttpServletRequest getAllUsers(Connection con, HttpServletRequest request, int index) throws SQLException{

		/**
		 * 1 * 100 = 100
		 * 2 * 100 = 200
		 * 3 * 100 = 300
		 * 4 * 100 = 400
		 * 
		 */
		int max = MAX_PER_LIST * index;
		int min = MAX_PER_LIST * (index - 1);
		
		String sql_user_st = "select * from user ORDER BY createddate DESC limit "+ min +","+max;
		
		PreparedStatement sql_user = con.prepareStatement(sql_user_st , ResultSet.TYPE_SCROLL_INSENSITIVE);

		ResultSet rm = sql_user.executeQuery();

		boolean isLast = true;


		List<__User> userList = new ArrayList<__User>();

		if(rm.first()){
			rm.beforeFirst();

			while(isLast) {

				if(rm.next()){

					__User user = new __User();
					user.setUserID(rm.getInt("userid"));
					user.setProfileImagePath(rm.getString("Photo"));
					user.setName(rm.getString("name"));
					user.setRole(rm.getString("role"));
					user.setEmail(rm.getString("email"));
					String[] date = rm.getString("createdDate").split(" ");
					user.setCreatedDate(date[0]);
					
					userList.add(user);

				}else if(rm.last()){
					isLast = false;
				}
			}
		}

		//Gson gson = new Gson();
		//String gsonArticle = gson.toJson(articalList);
		//request.setAttribute("gsonArticle", gsonArticle);

		request.setAttribute("userList", userList);

		return request;
	}
}

