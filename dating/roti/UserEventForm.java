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
@WebServlet(name="UserEventForm", urlPatterns={"/zhs/yonghu/shangchuan"})
public class UserEventForm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserEventForm() {
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
		
		request.setAttribute("bad_pic", "display:none");
		request.setAttribute("bad_pic_msg", "");

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
				//System.out.println("yes");
				
				java.util.Date today = new java.util.Date();
				request.setAttribute("userid", t_uid);
				request.setAttribute("username", t_name);
				request.setAttribute("photogroupid", new java.sql.Timestamp(today.getTime()) + "");
				request.setAttribute("success_upload_event", "-1"); //default value
				
				//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/admin/admin_index.jsp");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/yonghu/user_post_form.jsp");
				dispatcher.forward(request, response);
			}else{
				//System.out.println("fail");
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
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		___Session s = new ___Session(request);
		s.iniSession();

		___SessionUserStatus sus = new ___SessionUserStatus(request,s);
		request = sus.getUpdateRequest();
		
		String type = request.getParameter("type");
		request.setCharacterEncoding("UTF-8");

		___S3 s3 = new ___S3();

		if (type.equals("form_submit")) {

			//System.out.println("INSIDE TYPE form submit");
			//System.out.println(type);
			
			___IniDB db = new ___IniDB();
			Connection con = db.getConnection();
			java.util.Date today = new java.util.Date();

			try{
				// get form values
				String geshi = request.getParameter("geshi");
				String title = request.getParameter("title");
				title = new String (title.getBytes ("iso-8859-1"), "UTF-8");
				String shortdesc = request.getParameter("shortdesc");
				shortdesc = new String (shortdesc.getBytes ("iso-8859-1"), "UTF-8");
				String tag = request.getParameter("tag");
				tag = new String (tag.getBytes ("iso-8859-1"), "UTF-8");
				String event_type = request.getParameter("event_type");
				String addr = request.getParameter("Address");
				String zip = request.getParameter("zip");
				String city_name = request.getParameter("city_name");
				String city_name_abbr = request.getParameter("city_abbr");
				String country = request.getParameter("country");
				String lat = request.getParameter("latitude");
				String long1 = request.getParameter("longitude");
				String groupImgID = request.getParameter("imggroupid");
				String eventPlaceName = request.getParameter("eventplacename");
				eventPlaceName = new String (eventPlaceName.getBytes ("iso-8859-1"), "UTF-8");
				String t_userid = request.getParameter("userid");
				String t_name = request.getParameter("username");
				//System.out.println("before: "+t_name);
				t_name = new String (t_name.getBytes ("iso-8859-1"), "UTF-8");
				//System.out.println("after: "+t_name);
				
				String geo = "";
				//System.out.println(lat +" || "+ long1);
				if(lat.equals("-1") || long1.equals("-1")){
					geo = "0";
				}else{
					geo = lat + ","+ long1;
				}
				
				String sdate = request.getParameter("datetime_start");
				String edate = request.getParameter("datetime_end");
				String stime = "";
				String etime = "";
				
				if(sdate.equals("") || sdate == null){
					sdate = new java.sql.Timestamp(today.getTime()) + "";
					String[] tdate = sdate.split(" ");
					sdate = tdate[0];
					stime = "00:00";
					
				}else{
					String[] d = sdate.split("/"); // 12/01/2014 00:00
					String yearTime[] = d[2].split(" ");
					sdate = yearTime[0] + "-" + d[0] + "-" + d[1]; // 2014-12-01 
					stime = yearTime[1]; // 00:00
				}
				
				if(edate.equals("") || edate == null){
					edate = new java.sql.Timestamp(today.getTime()) + "";
					String[] tdate = edate.split(" ");
					edate = tdate[0];
					etime = "00:00";
				}else{
					String[] d1 = edate.split("/"); // 12/01/2014 00:00
					String yearTime1[] = d1[2].split(" ");
					edate = yearTime1[0] + "-" + d1[0] + "-" + d1[1]; // 2014-12-01
					etime = yearTime1[1]; // 04:00
				}
				
				// Get day of week
				String t_sdate = sdate;
				Calendar c = Calendar.getInstance();
				String[] sdates = t_sdate.split("-");
				c.set(Integer.parseInt(sdates[0]), Integer.parseInt(sdates[1])-1, Integer.parseInt(sdates[2]));
				int day_of_week = c.get(Calendar.DAY_OF_WEEK);
				
				
				String payment_url = request.getParameter("url");
				String lRegex = "^(http|https|ftp)://.*$";
				Pattern p = Pattern.compile(lRegex);  
			    Matcher m = p.matcher(payment_url); 
				
			    if(!(m.find()))
			    	payment_url = "http://" + payment_url;
				
				//System.out.println(payment_url + "  hhh: " + geshi);
				//System.out.println(payment_url);
				
				String tinyMCE_editor_html = request.getParameter("tinyMCE_event_content");
				tinyMCE_editor_html = new String (tinyMCE_editor_html.getBytes ("iso-8859-1"), "UTF-8");
				String cover_pic_file_size = request.getParameter("cover_pic_file_size");

				System.out.println(title +" ^^ "+ event_type +" ^^ "+ addr +" ^^ "+ zip +" ^^ "+ city_name +" ^^ "
						+ ""+ city_name_abbr +" ^^ "+ country +" ^^ "+sdate +" ^^ "+ edate +" ^^ "+ " ^^ "+stime +" ^^ "+ etime +" ^^ "+geo + " ^^ "
								+ "" +payment_url +" ^^ "+ tinyMCE_editor_html +" ^^ "+ cover_pic_file_size +" ^^ "+ groupImgID +" ^^ " + eventPlaceName);

				
				String b64 = request.getParameter("profileImage");			

				byte[] decoded = Base64.decode(b64);
				InputStream filecontent = new ByteArrayInputStream(decoded); 
				int profile_img_size = filecontent.available();

				
				String imgGroupIDPath = request.getParameter("imggroupidpath");
				if(!imgGroupIDPath.equals("default_image/ajuploadimg.png")){
					imgGroupIDPath =  imgGroupIDPath + "post_cover.jpg";
					s3.upload_single_stream("aiju-cloudfront-bucket", imgGroupIDPath, filecontent, profile_img_size);
				}

					//title +" ^^ "+ event_type +" ^^ "+ addr +" ^^ "+ zip +" ^^ "+ city_name +" ^^ "+ city_name_abbr +" ^^ "+ country +" ^^ "
					//+stime +" ^^ "+ etime +" ^^ "+ geo + " ^^ " +payment_url +" ^^ "+ tinyMCE_editor_html +" ^^ "+ cover_pic_file_size 
					
					// insert event into post table
					String event_insert_str = "insert into hunyin.post(title, posttype, genre, address, zipcode, city, state, country, eventdate, endeventdate, geolocation, purchaselink, content, coverimage, postcreatedtime, postupdatedtime, shortdesc, eventtime, endeventtime, eventplacename, userid, author, PostImageGroupID, geshi, tag, DayOfWeek) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					
					PreparedStatement sql_event_insert = con.prepareStatement(event_insert_str);
					sql_event_insert.setString(1, title);
					sql_event_insert.setInt(2, 2); //post by ourself
					sql_event_insert.setInt(3, Integer.parseInt(event_type));
					sql_event_insert.setString(4, addr);
					sql_event_insert.setString(5, zip);
					sql_event_insert.setString(6, city_name);
					sql_event_insert.setString(7, city_name_abbr);
					sql_event_insert.setString(8, country);
					sql_event_insert.setString(9, sdate);
					sql_event_insert.setString(10, edate);
					sql_event_insert.setString(11, geo);
					sql_event_insert.setString(12, payment_url);
					sql_event_insert.setString(13, tinyMCE_editor_html);
					sql_event_insert.setString(14, "https://s3.amazonaws.com/aiju-cloudfront-bucket/" + imgGroupIDPath); //image name
					sql_event_insert.setTimestamp(15, new java.sql.Timestamp(today.getTime()));
					sql_event_insert.setTimestamp(16, new java.sql.Timestamp(today.getTime()));
					sql_event_insert.setString(17, shortdesc);
					sql_event_insert.setString(18, stime);
					sql_event_insert.setString(19, etime);
					sql_event_insert.setString(20, eventPlaceName);
					sql_event_insert.setInt(21, Integer.parseInt(t_userid));
					sql_event_insert.setString(22, t_name);
					sql_event_insert.setString(23, groupImgID);
					sql_event_insert.setInt(24, Integer.parseInt(geshi));
					sql_event_insert.setString(25, tag);
					sql_event_insert.setInt(26, day_of_week);
					
					
					sql_event_insert.executeUpdate();
					filecontent.close();

					
					java.util.Date newToday = new java.util.Date();
					request.setAttribute("userid", t_userid);
					request.setAttribute("username", t_name);
					request.setAttribute("photogroupid", new java.sql.Timestamp(newToday.getTime()) + "");
					request.setAttribute("success_upload_event", "1"); //success

				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/yonghu/user_post_form.jsp");
				dispatcher.forward(request, response);
				
			} catch(java.io.UnsupportedEncodingException e){
				response.sendRedirect("index");
			} catch(java.lang.NullPointerException e){
				e.printStackTrace();
				response.sendRedirect("../index");
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("../index");
			} finally{
				db.setClose();
			}

		} 
		else if (type.equals("uploadify_photos")) {

			String imageGroupIDPath = request.getParameter("imgspath");
			//System.out.println("uploadify photo");
			Part filePart = request.getPart("Filedata");

			if (filePart == null) 
			{
				//System.out.println("NULL@@");
			}
			else {
				String filename = getFilename(filePart);
				InputStream filecontent = filePart.getInputStream();
				String filesize = request.getParameter("filesize");

				//System.out.println("file size is " + filesize);
				//System.out.println("in uploadify " + filename);

				s3.upload_single_stream("aiju-cloudfront-bucket", imageGroupIDPath + "" + filename, filecontent, Integer.parseInt(filesize));

				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(filename);

			}
		}


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
