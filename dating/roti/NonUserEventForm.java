package roti;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Calendar;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//import com.amazonaws.auth.AWSCredentialsProvider;

/**
 * Servlet implementation class IniPage
 */


@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50)   // 50MB
@WebServlet(name="NonUserEventForm", urlPatterns={"/zhs/chuang-jian"}) 
public class NonUserEventForm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NonUserEventForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String type = request.getParameter("t");


		___Session s = new ___Session(request);
		s.iniSession();

		___SessionUserStatus sus = new ___SessionUserStatus(request,s);
		request = sus.getUpdateRequest();

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();
		boolean isUser = false;

		try{


			String t_uid = s.getUserID();
			String t_name = s.getUsername();
			String t_email = s.getEmail();
			String t_UUID = s.getUUID();
			String t_role = s.getRole();
			//String t_status = s.getStatus();

			//String db_email, db_uuid, db_role, db_status;

			PreparedStatement sql_is_user = con.prepareStatement("select email, role, uuid, status from hunyin.user where email = ? and uuid = ? and role = ? and status = ?");
			sql_is_user.setString(1, t_email);
			sql_is_user.setString(2, t_UUID);
			sql_is_user.setString(3, t_role);
			sql_is_user.setString(4, "zaixian");

			ResultSet result = sql_is_user.executeQuery();

			if (result.next()){
				isUser = true;
			}

			if(isUser){


				response.sendRedirect("yonghu/shangchuan");

			}else{



				if(type.equals("huodong")){

					request.setAttribute("title", "\u6D3B\u52A8");
					request.setAttribute("geshi", "2");

				}else if(type.equals("tuiwen")){

					request.setAttribute("title", "\u63A8\u6587");
					request.setAttribute("geshi", "1");
				}

				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/xin_non_user_post.jsp");
				dispatcher.forward(request, response);
			}




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


		___Session s = new ___Session(request);
		s.iniSession();

		___SessionUserStatus sus = new ___SessionUserStatus(request,s);
		request = sus.getUpdateRequest();

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();
		boolean isUser = false;

		try{


			String t_uid = s.getUserID();
			String t_name = s.getUsername();
			String t_email = s.getEmail();
			String t_UUID = s.getUUID();
			String t_role = s.getRole();
			//String t_status = s.getStatus();

			//String db_email, db_uuid, db_role, db_status;

			PreparedStatement sql_is_user = con.prepareStatement("select email, role, uuid, status from hunyin.user where email = ? and uuid = ? and role = ? and status = ?");
			sql_is_user.setString(1, t_email);
			sql_is_user.setString(2, t_UUID);
			sql_is_user.setString(3, t_role);
			sql_is_user.setString(4, "zaixian");

			ResultSet result = sql_is_user.executeQuery();

			if (result.next()){
				isUser = true;
			}

			if(isUser){

				response.sendRedirect("yonghu/shangchuan");

			}else{
				response.sendRedirect("login");
			}


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

}
