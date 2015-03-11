package roti;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;




//import org.apache.commons.codec.binary.Base64;
import org.joda.time.LocalDate;
import org.joda.time.Years;



/**
 * Servlet implementation class Login
 */

@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50)   // 50MB
@WebServlet(name="UserSettingsEdit", urlPatterns={"/zhs/yonghu/shezhi","/zhs/yonghu/"})
public class UserSettingsEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String PASS_SECRET_KEY = "gjfsa#()*;LDSFA;0sdfj3409asdef0FjsdJ=3SD";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserSettingsEdit() {
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

		//HttpServletRequest r = null;

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();
		boolean isOwner = false;


		try{

			int tid = Integer.parseInt(s.getUserID());
			String temail = s.getEmail();
			String tuuid = s.getUUID();
			String tstatus = "zaixian";

			__User user = new __User();

			PreparedStatement sql_user_account = con.prepareStatement("select name, title, age, gender, month, year, photo from user where userid = ? and email = ? and UUID = ? and status = ?");
			sql_user_account.setInt(1, tid);
			sql_user_account.setString(2, temail);
			sql_user_account.setString(3, tuuid);
			sql_user_account.setString(4, tstatus);

			ResultSet r = sql_user_account.executeQuery();

			if (r.next()){

				user.setName(r.getString("name"));
				user.setTitle((r.getString("title") != null) ? r.getString("title") : "");
				user.setAge(r.getInt("age"));
				user.setGender(r.getString("gender"));
				user.setMonth(r.getString("month"));
				user.setYear(r.getString("year"));
				user.setProfileImagePath(r.getString("photo"));

				isOwner = true;

				request.setAttribute("user", user);
			}

			if(isOwner){

				request.setAttribute("update_success", "-1");
				request.setAttribute("update_img_success", "-1");
				request.setAttribute("bumen", "geren"); // default bumen

				//doGet(request, response);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/yonghu/user_settings_main.jsp");
				dispatcher.forward(request, response);

			}else{
				response.sendRedirect("../logout");
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

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();
		___IniDB db1 = new ___IniDB("ajliuyan");
		Connection con1 = db1.getConnection();

		java.util.Date today = new java.util.Date();

		HttpServletRequest r = null;
		boolean correctUser = false;

		try{

			___Session s = new ___Session(request);
			s.iniSession();

			___SessionUserStatus sus = new ___SessionUserStatus(request,s);
			request = sus.getUpdateRequest();

			String bumen = request.getParameter("bumen");

			int t_userid = Integer.parseInt(s.getUserID());
			String t_uuid = s.getUUID();
			String t_status = "zaixian";

			PreparedStatement sql_user_account = con.prepareStatement("select userid from user where userid = ? and UUID = ? and status = ?");
			sql_user_account.setInt(1, t_userid);
			sql_user_account.setString(2, t_uuid);
			sql_user_account.setString(3, t_status);

			ResultSet result = sql_user_account.executeQuery();

			if (result.next())
				correctUser = true;


			if(correctUser){

				if(bumen.equals("geren")){


					String name = request.getParameter("name");
					String title = request.getParameter("title");
					String[] g = request.getParameterValues("gender");
					String[] m = request.getParameterValues("month");
					String[] y = request.getParameterValues("year");
					String gender = "";
					String month = "";
					String year = "";

					for(String tg: g)
						gender = tg;

					for(String tm: m)
						month = tm;

					for(String ty: y)
						year = ty;

					String update_user_st = "update user set name = ?, title = ?, gender = ?, month = ?, year = ?, age = ?, updateuserdate = ? where userid = ?";

					PreparedStatement update_user_sql = con.prepareStatement(update_user_st);
					update_user_sql.setString(1, name);
					update_user_sql.setString(2, title); //unpaid_Member
					update_user_sql.setString(3, gender);
					update_user_sql.setString(4, month);
					update_user_sql.setString(5, year);

					if(month.equals("0"))
						month = "1";

					int tage = 0;

					if(!year.equals("0")){
						LocalDate birthdate = new LocalDate (Integer.parseInt(year), Integer.parseInt(month), 1);
						LocalDate now = new LocalDate();
						Years age = Years.yearsBetween(birthdate, now);
						tage = age.getYears();
						update_user_sql.setInt(6, age.getYears());
					}else{
						update_user_sql.setInt(6, 0);
					}

					update_user_sql.setTimestamp(7, new java.sql.Timestamp(today.getTime()));
					update_user_sql.setInt(8, t_userid);

					update_user_sql.executeUpdate();

					
					
					//update name(author) in post
					PreparedStatement update_post_author_sql = con.prepareStatement("update post set author = ? where userid = ?");
					update_post_author_sql.setString(1, name);
					update_post_author_sql.setInt(2, t_userid);
					update_post_author_sql.executeUpdate();
					
					
					//update name in ajliuyan
					PreparedStatement update_ajname_sql = con1.prepareStatement("update article_comment set username = ? where userid = ?");
					update_ajname_sql.setString(1, name);
					update_ajname_sql.setInt(2, t_userid);
					update_ajname_sql.executeUpdate();


					request.setAttribute("update_success", "1");
					request.setAttribute("update_img_success", "-1");

					//overwrite the session information
					s.setUsername(name);
					___SessionUserStatus newsus = new ___SessionUserStatus(request,s);
					request = newsus.getUpdateRequest();

				}else if(bumen.equals("touxiang")){

					___S3 s3 = new ___S3();

					String b64 = request.getParameter("profileImage");			

					byte[] decoded = Base64.decode(b64);
					InputStream filecontent = new ByteArrayInputStream(decoded); 
					int profile_img_size = filecontent.available();

					//System.out.println(profile_img_size+" mb");
					String imgUserPath = t_userid + "/p/zhuyao__profile.jpg";
					s.setPhotoPath(imgUserPath);

					s3.upload_single_stream("aiju-cloudfront-bucket", imgUserPath, filecontent, profile_img_size);


					String update_user_pro_img_st = "update user set photo = ?, updateuserdate = ? where userid = ?";

					PreparedStatement update_user_proimg_sql = con.prepareStatement(update_user_pro_img_st);
					update_user_proimg_sql.setString(1, imgUserPath);
					update_user_proimg_sql.setTimestamp(2, new java.sql.Timestamp(today.getTime()));
					update_user_proimg_sql.setInt(3, t_userid);

					update_user_proimg_sql.executeUpdate();
					
					
					
					//update user image in ajliuyan
					PreparedStatement update_ajimg_sql = con1.prepareStatement("update article_comment set userpicture = ? where userid = ?");
					update_ajimg_sql.setString(1, imgUserPath);
					update_ajimg_sql.setInt(2, t_userid);
					update_ajimg_sql.executeUpdate();

					

					request.setAttribute("update_success", "-1");
					request.setAttribute("update_img_success", "1");

					filecontent.close();

				}else if(bumen.equals("mima")){

					String pass1 = request.getParameter("n_pass1");
					String pass2 = request.getParameter("n_pass2");
					String pass = request.getParameter("c_pass");

					boolean bothPassCorrect = false;

					if(pass1.equals(pass2))
						bothPassCorrect = true;

					if(bothPassCorrect){

						int tid = Integer.parseInt(s.getUserID());
						//String tstatus = "zaixian";

						String update_pass_st = "update user set password = ?, updateuserdate = ? where userid = ? and password = ?";

						PreparedStatement update_pass_sql = con.prepareStatement(update_pass_st);
						String en_pwd = EncryptionBytes.toBaoMi(PASS_SECRET_KEY, pass1);
						update_pass_sql.setString(1, en_pwd);
						update_pass_sql.setTimestamp(2, new java.sql.Timestamp(today.getTime()));
						update_pass_sql.setInt(3, tid);
						String en_pwd1 = EncryptionBytes.toBaoMi(PASS_SECRET_KEY, pass);
						update_pass_sql.setString(4, en_pwd1);

						int isUpdate = update_pass_sql.executeUpdate();

						if(isUpdate > 0)
							request.setAttribute("update_success", "1");
						else
							request.setAttribute("update_success", "2");
						
						//System.out.println("yes" + isUpdate);
						
						
					}else{
						//System.out.println("no");
						request.setAttribute("update_success", "0");

					}
					
					request.setAttribute("update_img_success", "-1");

				}

				r = retriveUserBasic(con, request, t_userid, bumen);


				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/yonghu/user_settings_main.jsp");
				dispatcher.forward(r, response);

			}else{
				response.sendRedirect("../login");
			}




		} catch(java.lang.NullPointerException e){
			e.printStackTrace();
			response.sendRedirect("../index");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("../index");
		} finally{
			db.setClose();
			db1.setClose();
		}

	}


	private HttpServletRequest retriveUserBasic(Connection con, HttpServletRequest request, int userid, String bumen) throws SQLException{

		__User user = new __User();

		PreparedStatement sql_user_account = con.prepareStatement("select name, title, age, gender, month, year, photo from user where userid = ?");
		sql_user_account.setInt(1, userid);

		ResultSet r = sql_user_account.executeQuery();

		if (r.next()){

			user.setName(r.getString("name"));
			user.setTitle((r.getString("title") != null) ? r.getString("title") : "");
			user.setAge(r.getInt("age"));
			user.setGender(r.getString("gender"));
			user.setMonth(r.getString("month"));
			user.setYear(r.getString("year"));
			user.setProfileImagePath(r.getString("photo"));

		}

		if(bumen.equals("geren")){
			request.setAttribute("bumen", "geren");
		}else if(bumen.equals("touxiang")){
			request.setAttribute("bumen", "touxiang");
		}else if(bumen.equals("mima")){
			request.setAttribute("bumen", "mima");
		}

		request.setAttribute("user", user);

		return request;
	}

	/**
	 * Get file name transfered in from part
	 * @param part part of the posted file
	 * @return name of the file
	 */
	private static String getFilename(Part part) {
		for (String cd : part.getHeader("content-disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				String filename = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
				return filename.substring(filename.lastIndexOf('/') + 1).substring(filename.lastIndexOf('\\') + 1); // MSIE fix.
			}
		}
		return null;
	}

}