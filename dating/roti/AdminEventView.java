package roti;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class AdminEventView
 */
@WebServlet("/zhs/admin/kan")
public class AdminEventView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminEventView() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String target = request.getParameter("hao");

		___Session s = new ___Session(request);
		s.iniSession();

		___SessionUserStatus sus = new ___SessionUserStatus(request,s);
		request = sus.getUpdateRequest();

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();

		___IniDB db1 = new ___IniDB("ajliuyan");
		Connection con1 = db1.getConnection();

		boolean isAdmin = false;
		boolean isArticleExist = false;

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

				PreparedStatement sql_article = con.prepareStatement("select * from post where postid = ?");
				sql_article.setInt(1, Integer.parseInt(target));

				ResultSet rs = sql_article.executeQuery();

				if (rs.next())
					isArticleExist = true;

				if(isArticleExist){


					// get article information
					__Article article = new __Article();
					article.setPostID(Integer.parseInt(target));
					article.setCoverImage(rs.getString("CoverImage"));
					article.setTitle(rs.getString("title"));
					article.setAuthor(rs.getString("author"));
					article.setContent(rs.getString("content"));
					article.setShortDesc(rs.getString("ShortDesc"));
					article.setGeoLocation(rs.getString("geolocation"));
					article.setPurchaseLink(rs.getString("purchaselink"));

					article.setGeshi(rs.getInt("geshi"));
					article.setVerify(rs.getInt("verify"));
					article.setPostDate(rs.getString("PostCreatedTime"));
					article.setPostUpdatedDate(rs.getString("PostUpdatedTime"));

					article.setEventPlaceName(rs.getString("EventPlaceName"));
					article.setAddress(rs.getString("address"));
					article.setCity(rs.getString("city"));
					article.setState(rs.getString("state"));
					article.setZipcode(rs.getString("zipcode"));
					article.setEventDate(rs.getString("EventDate"));
					article.setDisEventDate(rs.getString("EndEventDate"));
					article.setSTime(rs.getString("EventTime"));
					article.setETime(rs.getString("EndEventTime"));
					article.setDayOfWeek(rs.getString("DayOfWeek"));


					java.sql.Timestamp sqltime = rs.getTimestamp("PostCreatedTime");
					long time = sqltime.getTime();
					Calendar calendar = Calendar.getInstance();
					calendar.setTimeInMillis(time);
					int month = calendar.get(Calendar.MONTH) + 1;
					article.setPostDate(month + "\u6708" + calendar.get(Calendar.DATE)+ "\u65E5");
					request.setAttribute("article", article);


					request.setAttribute("uid", s.getUserID()+"");

					//get comment
					String sql_comment_str = "select * from article_comment where articleid = ?";
					PreparedStatement sql_comment = con1.prepareStatement(sql_comment_str , ResultSet.TYPE_SCROLL_INSENSITIVE);
					sql_comment.setInt(1, Integer.parseInt(target));
					ResultSet rm = sql_comment.executeQuery();

					boolean isLast = true;
					int countTotalComment = 0;

					List<__Comment> commentList = new ArrayList<__Comment>();

					if(rm.first()){
						rm.beforeFirst();

						while(isLast) {

							if(rm.next()){

								__Comment comment = new __Comment();
								comment.setCID(rm.getInt("cid"));
								comment.setUserID(rm.getInt("userid"));
								comment.setUsername(rm.getString("username"));
								comment.setUserPic(rm.getString("userpicture"));
								comment.setComment(rm.getString("comment").replaceAll("(\r\n|\n)", "<br />"));
								java.sql.Timestamp csqltime = rm.getTimestamp("PostCreatedTime");
								long ctime = csqltime.getTime();
								Calendar ccalendar = Calendar.getInstance();
								ccalendar.setTimeInMillis(ctime);
								int cmonth = ccalendar.get(Calendar.MONTH) + 1;
								comment.setCommentTime(cmonth + "\u6708" + ccalendar.get(Calendar.DATE)+ "\u65E5");

								commentList.add(comment);
								countTotalComment++;

							}else if(rm.last()){
								isLast = false;
							}
						}
					}

					//update countTotalComment in post table
					String update_totalcomment_str = "update post set CommentCount = ? where postid = ?";

					PreparedStatement update_article_commentcount = con.prepareStatement(update_totalcomment_str);
					update_article_commentcount.setInt(1, countTotalComment);
					update_article_commentcount.setInt(2, Integer.parseInt(target));
					update_article_commentcount.executeUpdate();


					request.setAttribute("commentList", commentList);
					request.setAttribute("user_photo_path", s.getPhotoPath());

					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/admin/admin_view_article.jsp");
					dispatcher.forward(request, response);


				}else{
					response.sendRedirect("index");
				}


			}else{
				//System.out.println("fail");
				response.sendRedirect("../index");

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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String select_verify_option = request.getParameter("value");
		String target_post = request.getParameter("postid");

		___Session s = new ___Session(request);
		s.iniSession();

		___SessionUserStatus sus = new ___SessionUserStatus(request,s);
		request = sus.getUpdateRequest();

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
				
				String post_update_str = "UPDATE hunyin.post SET verify = ? WHERE postid = ?";
				
				
				PreparedStatement sql_post_update = con.prepareStatement(post_update_str);
				sql_post_update.setInt(1, Integer.parseInt(select_verify_option));
				sql_post_update.setInt(2, Integer.parseInt(target_post));
				
				sql_post_update.executeUpdate();
				
				Gson gson = new Gson();
				String jobj1 = gson.toJson("done");
				
				response.setContentType("application/json"); 
				response.setCharacterEncoding("utf-8"); 
				//String bothJson = "";
				//System.out.println(jobj1);
				response.getWriter().write(jobj1);
				
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

	}
