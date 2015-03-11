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

import com.google.gson.Gson;

/**
 * Servlet implementation class AdminEventList
 */
@WebServlet("/zhs/admin/zonghe-baogao")
public class ReportMain extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReportMain() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		___Session s = new ___Session(request);
		s.iniSession();
		
		___SessionUserStatus sus = new ___SessionUserStatus(request,s);
		request = sus.getUpdateRequest();

		HttpServletRequest r = null;

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();
		
		String type_report = request.getParameter("type");
		
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

				r = getTypeReports(con, request, type_report);
	
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/admin/report_main.jsp");
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


	private HttpServletRequest getTypeReports(Connection con, HttpServletRequest request, String type) throws SQLException{
		
		// get general report
		request = getGeneralReport(con, request);
		
		String sql_report_type = "";

		if(type.equals("day_user")){
			sql_report_type = "select CONCAT(MONTHNAME(CreatedTime), ' ', DAY(CreatedTime), ', ', YEAR(CreatedTime)) AS createdtimes, Day_Add_post from (select * from hunyin.Report ORDER BY CreatedTime desc) as t GROUP BY YEAR(t.createdtime), MONTH(t.createdtime), DAY(t.createdtime)";
			//sql_report_type = "select CONCAT(MONTHNAME(CreatedTime), ' ', DAY(CreatedTime), ', ', YEAR(CreatedTime)) AS createdtimes, Day_Add_user from (select * from hunyin.Report ORDER BY CreatedTime desc) as t GROUP BY YEAR(t.createdtime), MONTH(t.createdtime), DAY(t.createdtime)";
		}else if(type.equals("day_post")){
			sql_report_type = "select CreatedTime, Day_Add_post from (select * from hunyin.Report ORDER BY CreatedTime desc) as t GROUP BY YEAR(t.createdtime), MONTH(t.createdtime), DAY(t.createdtime)";
		
		}else if(type.equals("day_comment")){
			//request.setAttribute("g", "s");
			//request.setAttribute("jiele","no");
			sql_report_type = "select CreatedTime, Day_Add_comment from (select * from hunyin.Report ORDER BY CreatedTime desc) as t GROUP BY YEAR(t.createdtime), MONTH(t.createdtime), DAY(t.createdtime)";
		}

		PreparedStatement sql_report = con.prepareStatement(sql_report_type , ResultSet.TYPE_SCROLL_INSENSITIVE);
		ResultSet rm = sql_report.executeQuery();

		boolean isLast = true;

		List<__Reports> reportList = new ArrayList<__Reports>();

		if(rm.first()){
			rm.beforeFirst();

			while(isLast) {

				if(rm.next()){

					__Reports report = new __Reports();
					report.setCreatedDate(rm.getString(1));
					report.setValue(rm.getInt(2));

					reportList.add(report);

				}else if(rm.last()){
					isLast = false;
				}
			}
		}

		//Gson gson = new Gson();
		//String gsonArticle = gson.toJson(articalList);
		//request.setAttribute("gsonArticle", gsonArticle);

		request.setAttribute("reportList", reportList);

		return request;
	}
	
	
	private HttpServletRequest getGeneralReport(Connection con, HttpServletRequest request) throws SQLException{
		
		String sql_report_type = "SELECT total_add_user, total_add_post, total_add_comment, createdtime FROM hunyin.Report ORDER BY reportid DESC LIMIT 1";
		
		PreparedStatement sql_report = con.prepareStatement(sql_report_type);
		ResultSet result = sql_report.executeQuery();

		__Reports report = new __Reports();
		
		if (result.next()){
			report.setTotalAddUser(result.getInt(1));
			report.setTotalAddPost(result.getInt(2));
			report.setTotalAddComment(result.getInt(3));
			report.setCreatedDate(result.getString(4));
		}

		//Gson gson = new Gson();
		//String gsonArticle = gson.toJson(articalList);
		//request.setAttribute("gsonArticle", gsonArticle);

		request.setAttribute("report", report);

		return request;
	}

}
