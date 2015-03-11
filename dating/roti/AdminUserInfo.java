package roti;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.joda.time.LocalDate;
import org.joda.time.Years;

/**
 * Servlet implementation class AdminUserInfo
 */

@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50)   // 50MB
@WebServlet("/zhs/admin/yonghuxinxi")
public class AdminUserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String PASS_SECRET_KEY = "gjfsa#()*;LDSFA;0sdfj3409asdef0FjsdJ=3SD";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminUserInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String type = request.getParameter("bianji");
		String target_user = request.getParameter("hao");
		System.out.println(target_user+" test");

		___Session s = new ___Session(request);
		s.iniSession();

		___SessionUserStatus sus = new ___SessionUserStatus(request,s);
		request = sus.getUpdateRequest();

		//HttpServletRequest r = null;

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();
		boolean isAdmin = false;


		try{

			//String t_uid = s.getUserID();
			//String t_name = s.getUsername();
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

				int tid = Integer.parseInt(target_user);

				request = getUserInfo(con, request, tid);
				
				request.setAttribute("type", type);
				request.setAttribute("update_success", "-1");
				request.setAttribute("pass_not_match", "-1");
				request.setAttribute("not_valid_email", "-1");

				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/admin/admin_user_info_edit.jsp");
				dispatcher.forward(request, response);

			}else{
				response.sendRedirect("../login");
			}


		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("../index");
		} catch(java.lang.NullPointerException e){
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

		request.setCharacterEncoding("UTF-8");

		___Session s = new ___Session(request);
		s.iniSession();

		___SessionUserStatus sus = new ___SessionUserStatus(request,s);
		request = sus.getUpdateRequest();

		HttpServletRequest r = null;

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();
		___IniDB db1 = new ___IniDB("ajliuyan");
		Connection con1 = db1.getConnection();

		boolean isAdmin = false;

		String useridstr = request.getParameter("userid1");
		int userid = Integer.parseInt(useridstr);
		String username = request.getParameter("name");
		String useremail = request.getParameter("email");
		String usertitle = request.getParameter("title");
		String[] g = request.getParameterValues("gender");
		String[] m = request.getParameterValues("month");
		String[] y = request.getParameterValues("year");
		String pass1 = request.getParameter("n_pass1");
		String pass2 = request.getParameter("n_pass2");
		String gender = "";
		String month = "";
		String year = "";
		String sql_user_with_pass = "update user set name = ?, email = ?, title = ?, gender = ?, month = ?, year = ?, age = ?, password = ?, photo = ?, updateuserdate = ? where userid = ?";
		String sql_user_without_pass = "update user set name = ?, email = ?, title = ?, gender = ?, month = ?, year = ?, age = ?, photo = ?, updateuserdate = ? where userid = ?";
		String sql_user_st = sql_user_with_pass;
		String imgUserPath = request.getParameter("default-img-path");
		boolean isEmail = false;
		boolean changePassword = true;
		boolean right_pass = false;
		java.util.Date today = new java.util.Date();

		for(String tg: g)
			gender = tg;

		for(String tm: m)
			month = tm;

		for(String ty: y)
			year = ty;


		// to avoid updating the password if pass1 and pass2 equals to ""
		// it means no change of password
		if(pass1.equals(pass2)){
			if(pass1.equals("") && pass2.equals("")){
				request.setAttribute("password_change", "0");
				changePassword = false;
				sql_user_st = sql_user_without_pass;
			}
			right_pass = true;
		}

		
		// check the format of the email address
		String pattern = "[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,6}$";
		// Create a Pattern object
		Pattern p = Pattern.compile(pattern);
		// Now create matcher object.
		Matcher match = p.matcher(useremail);
		if((match.find())){
			isEmail = true;
			request.setAttribute("not_valid_email", "-1");
		}else{
			request.setAttribute("not_valid_email", "1");
		}

		
		try{

			if(right_pass && isEmail){

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

					___S3 s3 = new ___S3();
					String b64 = request.getParameter("profileImage");			

					// prevent upload a bitmap
					if(!(b64.equals(""))){
						byte[] decoded = Base64.decode(b64);
						InputStream filecontent = new ByteArrayInputStream(decoded); 
						int profile_img_size = filecontent.available();

						imgUserPath = userid + "/p/zhuyao__profile.jpg";
						s3.upload_single_stream("aiju-cloudfront-bucket", imgUserPath, filecontent, profile_img_size);
					}

					//update user set name = ?, email = ?, title = ?, gender = ?, month = ?, year = ?, age = ?, password = ?, photo = ?, updateuserdate = ? where userid = ?
					PreparedStatement update_user_sql = con.prepareStatement(sql_user_st);
					update_user_sql.setString(1, username);
					update_user_sql.setString(2, useremail);
					update_user_sql.setString(3, usertitle);
					update_user_sql.setString(4, gender);
					update_user_sql.setString(5, month);
					update_user_sql.setString(6, year);

					// get the age 
					if(month.equals("0"))
						month = "1";

					int tage = 0;

					if(!year.equals("0")){
						LocalDate birthdate = new LocalDate (Integer.parseInt(year), Integer.parseInt(month), 1);
						LocalDate now = new LocalDate();
						Years age = Years.yearsBetween(birthdate, now);
						tage = age.getYears();
						update_user_sql.setInt(7, age.getYears());
					}else{
						update_user_sql.setInt(7, 0);
					}


					if(changePassword){
						String en_pwd = EncryptionBytes.toBaoMi(PASS_SECRET_KEY, pass1);
						update_user_sql.setString(8, en_pwd);
						update_user_sql.setString(9, imgUserPath);
						update_user_sql.setTimestamp(10, new java.sql.Timestamp(today.getTime()));
						update_user_sql.setInt(11, userid);
					}else{
						update_user_sql.setString(8, imgUserPath);
						update_user_sql.setTimestamp(9, new java.sql.Timestamp(today.getTime()));
						update_user_sql.setInt(10, userid);
					}

					
					
					update_user_sql.executeUpdate();
					
					
					
					//update name(author) in post
					PreparedStatement update_post_author_sql = con.prepareStatement("update post set author = ? where userid = ?");
					update_post_author_sql.setString(1, username);
					update_post_author_sql.setInt(2, userid);
					update_post_author_sql.executeUpdate();
					

					//update name and userpicture in ajliuyan
					PreparedStatement update_ajname_sql = con1.prepareStatement("update article_comment set username = ?, userpicture = ? where userid = ?");
					update_ajname_sql.setString(1, username);
					update_ajname_sql.setString(2, imgUserPath);
					update_ajname_sql.setInt(3, userid);
					update_ajname_sql.executeUpdate();
					
					
					request = getUserInfo(con, request, userid);
					
					
					//overwrite the session information
					if(t_uid.equals(userid+"")){
						s.setUsername(username);
						___SessionUserStatus newsus = new ___SessionUserStatus(request,s);
						request = newsus.getUpdateRequest();
					}
					
					/**
					 * 1 - bianji
					 * 0 - no bianji (edit)
					 */
					
					request.setAttribute("type", "0");
					request.setAttribute("update_success", "1");
					request.setAttribute("pass_not_match", "-1");

					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/admin/admin_user_info_edit.jsp");
					dispatcher.forward(request, response);

				}

			//end right pass
			}else{
				
				
				request = getUserInfo(con, request, userid);
				
				/**
				 * 1 - bianji
				 * 0 - no bianji (edit)
				 */
				request.setAttribute("type", "1");
				request.setAttribute("update_success", "-1");
				request.setAttribute("pass_not_match", "1");

				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/admin/admin_user_info_edit.jsp");
				dispatcher.forward(request, response);
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("../index");
		} catch(java.lang.NullPointerException e){
			//System.out.println("main page");
			e.printStackTrace();
			response.sendRedirect("../index");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("../index");
		} finally{
			db.setClose();
			db1.setClose();
		}


	}
	
	private HttpServletRequest getUserInfo(Connection con, HttpServletRequest request, int userid) throws SQLException{

		__User user = new __User();

		PreparedStatement sql_user_account = con.prepareStatement("select userid, name, title, age, gender, month, year, photo, email from user where userid = ?");
		sql_user_account.setInt(1, userid);

		ResultSet r = sql_user_account.executeQuery();

		if (r.next()){

			user.setUserID(r.getInt("userid"));
			user.setName(r.getString("name"));
			user.setTitle((r.getString("title") != null) ? r.getString("title") : "");
			user.setAge(r.getInt("age"));
			user.setGender(r.getString("gender"));
			user.setMonth(r.getString("month"));
			user.setYear(r.getString("year"));
			user.setProfileImagePath(r.getString("photo"));
			user.setEmail(r.getString("email"));

		}
		
		request.setAttribute("user", user);
		
		return request;
	}

}
