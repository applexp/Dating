package roti;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
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
import javax.servlet.http.Part;

/**
 * Servlet implementation class AdminEventEdit
 */

@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50)   // 50MB
@WebServlet(name="AdminEventEdit", urlPatterns={"/zhs/admin/bianji"})
public class AdminEventEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminEventEdit() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String postid = request.getParameter("hao");


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

				r = getAllArticles(con, request, Integer.parseInt(postid));
				r.setAttribute("success_upload_event", "-1");

				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/admin/admin_edit_form.jsp");
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

		___Session s = new ___Session(request);
		s.iniSession();

		___SessionUserStatus sus = new ___SessionUserStatus(request,s);
		request = sus.getUpdateRequest();

		String type = request.getParameter("type");
		request.setCharacterEncoding("UTF-8");

		HttpServletRequest r = null;
		
		___S3 s3 = new ___S3();

		if (type.equals("form_submit")) {

			//System.out.println("INSIDE TYPE form submit");
			//System.out.println(type);

			___IniDB db = new ___IniDB();
			Connection con = db.getConnection();
			java.util.Date today = new java.util.Date();

			try{

				String title = request.getParameter("title");
				//System.out.println(title+" test");
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
				String postid = request.getParameter("postid");
				String postDate = request.getParameter("posttime");
				
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
					sdate = postDate;
					String[] tdate = sdate.split(" ");
					sdate = tdate[0];
					stime = "00:00";

				}else{
					//prevent js bug
					if(sdate.contains(":")){
						String[] d = sdate.split("/"); // 12/01/2014 00:00
						String yearTime[] = d[2].split(" ");
						sdate = yearTime[0] + "-" + d[0] + "-" + d[1]; // 2014-12-01 
						stime = yearTime[1]; // 00:00
					}else{
						String[] d = sdate.split("/"); // 12/01/2014 
						String yearTime = d[2].replace(" ", "");
						sdate = yearTime + "-" + d[0] + "-" + d[1]; // 2014-12-01
						stime = "00:00"; // 04:00
					}
				}

				if(edate.equals("") || edate == null){
					//edate = new java.sql.Timestamp(today.getTime()) + "";
					edate = postDate;
					String[] tdate = edate.split(" ");
					edate = tdate[0];
					etime = "00:00";
				}else{
					//prevent js bug
					if(edate.contains(":")){
						String[] d1 = edate.split("/"); // 12/01/2014 00:00
						String yearTime1[] = d1[2].split(" ");
						edate = yearTime1[0] + "-" + d1[0] + "-" + d1[1]; // 2014-12-01
						etime = yearTime1[1]; // 04:00
					}else{
						String[] d1 = edate.split("/"); // 12/01/2014 
						String yearTime1 = d1[2].replace(" ", "");
						edate = yearTime1 + "-" + d1[0] + "-" + d1[1]; // 2014-12-01
						etime = "00:00"; // 04:00
					}
				}
				
				// Get day of week
				String t_sdate = sdate;
				Calendar c = Calendar.getInstance();
				String[] sdates = t_sdate.split("-");
				c.set(Integer.parseInt(sdates[0]), Integer.parseInt(sdates[1])-1, Integer.parseInt(sdates[2]));
				int day_of_week = c.get(Calendar.DAY_OF_WEEK);
				
				String payment_url = request.getParameter("url");
				payment_url = new String (payment_url.getBytes ("iso-8859-1"), "UTF-8");
				String lRegex = "^(http|https|ftp)://.*$";
				Pattern p = Pattern.compile(lRegex);  
			    Matcher m = p.matcher(payment_url); 
				
			    if(!(m.find()))
			    	payment_url = "http://" + payment_url;
				
				String tinyMCE_editor_html = request.getParameter("tinyMCE_event_content");
				tinyMCE_editor_html = new String (tinyMCE_editor_html.getBytes ("iso-8859-1"), "UTF-8");
				String cover_pic_file_size = request.getParameter("cover_pic_file_size");

				/*
				System.out.println(title +" ^^ "+ event_type +" ^^ "+ addr +" ^^ "+ zip +" ^^ "+ city_name +" ^^ "
						+ ""+ city_name_abbr +" ^^ "+ country +" ^^ "+sdate +" ^^ "+ edate +" ^^ "+ " ^^ "+stime +" ^^ "+ etime +" ^^ "+geo + " ^^ "
						+ "" +payment_url +" ^^ "+ tinyMCE_editor_html +" ^^ "+ cover_pic_file_size +" ^^ "+ groupImgID +" ^^ " + eventPlaceName);
				*/


				String b64 = request.getParameter("profileImage");			
				InputStream filecontent = null;
				
				// prevent upload a bitmap
				if(!(b64.equals(""))){
					byte[] decoded = Base64.decode(b64);
					filecontent = new ByteArrayInputStream(decoded); 
					int profile_img_size = filecontent.available();
	
	
	
					String imgGroupIDPath = request.getParameter("imggroupidpath");
					if(!imgGroupIDPath.equals("default_image/ajuploadimg.png")){
						imgGroupIDPath =  imgGroupIDPath + "post_cover.jpg";
						s3.upload_single_stream("aiju-cloudfront-bucket", imgGroupIDPath, filecontent, profile_img_size);
					}
				}

				// insert event into post table
				//String event_insert_str = "insert into hunyin.post(title, posttype, genre, address, zipcode, city, state, country, eventdate, endeventdate, geolocation, purchaselink, content, coverimage, postcreatedtime, postupdatedtime, shortdesc, eventtime, endeventtime, eventplacename, userid, author, PostImageGroupID) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

				String event_update_str = "UPDATE hunyin.post SET title = ?, shortdesc =?, content = ?, genre = ?,"
						+ " purchaselink = ?, eventplacename = ?, eventdate = ?, endeventdate = ?, eventtime = ?, "
						+ "endeventtime = ?, address = ?, zipcode = ?, city = ?, state = ?, country = ?, geolocation = ?,"
						+ " postupdatedtime = ?, DayOfWeek = ?, tag = ? WHERE userid = ? and postid = ?"; 
				
				
				PreparedStatement sql_event_update = con.prepareStatement(event_update_str);
				sql_event_update.setString(1, title);
				sql_event_update.setString(2, shortdesc);
				sql_event_update.setString(3, tinyMCE_editor_html);
				sql_event_update.setInt(4, Integer.parseInt(event_type));
				sql_event_update.setString(5, payment_url);
				sql_event_update.setString(6, eventPlaceName);
				sql_event_update.setString(7, sdate);
				sql_event_update.setString(8, edate);
				sql_event_update.setString(9, stime);
				sql_event_update.setString(10, etime);
				sql_event_update.setString(11, addr);
				sql_event_update.setString(12, zip);
				sql_event_update.setString(13, city_name);
				sql_event_update.setString(14, city_name_abbr);
				sql_event_update.setString(15, country);
				sql_event_update.setString(16, geo);
				sql_event_update.setTimestamp(17, new java.sql.Timestamp(today.getTime()));
				sql_event_update.setInt(18, day_of_week);
				sql_event_update.setString(19, tag);
				sql_event_update.setInt(20, Integer.parseInt(t_userid));
				sql_event_update.setInt(21, Integer.parseInt(postid));
				
				
				
				sql_event_update.executeUpdate();
				
				if(!(b64.equals(""))){
					filecontent.close();
				}

				r = getAllArticles(con, request, Integer.parseInt(postid));
				r.setAttribute("success_upload_event", "1"); //success

				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/admin/admin_edit_form.jsp");
				dispatcher.forward(r, response);

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
			System.out.println("uploadify photo");
			Part filePart = request.getPart("Filedata");

			if (filePart == null) 
			{
				System.out.println("NULL@@");
			}
			else {
				String filename = getFilename(filePart);
				InputStream filecontent = filePart.getInputStream();
				String filesize = request.getParameter("filesize");

				System.out.println("file size is " + filesize);
				System.out.println("in uploadify " + filename);

				s3.upload_single_stream("aiju-cloudfront-bucket", imageGroupIDPath + "" + filename, filecontent, Integer.parseInt(filesize));

				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(filename);

			}
		}


	}

	private HttpServletRequest getAllArticles(Connection con, HttpServletRequest request, int id) throws SQLException{


		String sql_article_st = "select * from post where postid = ?";

		PreparedStatement sql_article = con.prepareStatement(sql_article_st);
		sql_article.setInt(1, id);
		ResultSet rm = sql_article.executeQuery();

		__Article article = new __Article();

		if (rm.next()){

			article.setPostID(id);
			//article.setPostType(posttype);
			article.setTitle(rm.getString("title"));
			article.setShortDesc(rm.getString("ShortDesc"));
			article.setCoverImage(rm.getString("CoverImage"));
			article.setContent(rm.getString("Content"));
			article.setGenre(rm.getInt("Genre"));
			article.setPurchaseLink(rm.getString("PurchaseLink"));
			article.setZipcode(rm.getString("zipcode"));
			article.setGeoLocation4Edit(rm.getString("GeoLocation"));
			article.setPostImageGroupID(rm.getString("PostImageGroupID"));
			article.setAuthor(rm.getString("author"));
			article.setUserID(rm.getString("userid"));
			article.setPostDate(rm.getString("PostCreatedTime"));
			article.setTag(rm.getString("tag"));
			article.setGeshi(rm.getInt("geshi"));

			if(!(rm.getString("GeoLocation").equals("0"))){

				article.setEventPlaceName(rm.getString("EventPlaceName"));
				article.setEventDate(rm.getString("eventdate"));
				article.setCity(rm.getString("city"));
				article.setState(rm.getString("state"));
				article.setCountry(rm.getString("country"));
				String eventDate = rm.getString("eventdate");
				String endEventDate = rm.getString("endeventdate");
				String eventTime = rm.getString("eventtime");
				String endEventTime = rm.getString("endeventtime");
				
				//11/19/2014 00:00 <-- 2014-11-21
				String[] s_divided_date = eventDate.split("-"); 
				String m = s_divided_date[1];
				String d = s_divided_date[2];
				String y = s_divided_date[0];
				String start_date_event = m + "/" + d + "/" + y;
				
				//article.setEventDate(eventDate.replace("-", "/") + " " + eventTime); 
				article.setEventDate(start_date_event + " " + eventTime);
				
				//System.out.println(eventDate);
				
				if(endEventDate != null){
					//11/19/2014 00:00 <-- 2014-11-21
					String[] e_divided_date = endEventDate.split("-"); 
					String em = e_divided_date[1];
					String ed = e_divided_date[2];
					String ey = e_divided_date[0];
					String end_date_event = em + "/" + ed + "/" + ey;
					
					article.setDisEventDate(end_date_event + " " + endEventTime);
					//article.setDisEventDate(endEventDate.replace("-", "/") + " " + endEventTime);
				}else{
					article.setDisEventDate(start_date_event + " 00:00");
					//article.setDisEventDate(eventDate.replace("-", "/") + " 00:00");
				}

				article.setAddress(rm.getString("address"));

				request.setAttribute("displayTimeLocation", "true");

			}else{
				request.setAttribute("displayTimeLocation", "false");
			}


		}

		request.setAttribute("article", article);



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
