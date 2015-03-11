package roti;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class MainPage
 */
@WebServlet(name="XinTargetArticle", urlPatterns={"/zhs/article"})
public class XinTargetArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XinTargetArticle() {
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
		
		String target = request.getParameter("post");
		
		//System.out.println(target);

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();
		___IniDB db1 = new ___IniDB("ajliuyan");
		Connection con1 = db1.getConnection();
		
		boolean isArticleExist = false;

		try {
			
			PreparedStatement sql_article = con.prepareStatement("select * from post where poststatus = 1 and verify = 1 and postid = ?");
			sql_article.setInt(1, Integer.parseInt(target));

			ResultSet result = sql_article.executeQuery();

			if (result.next())
				isArticleExist = true;
			
			
			
			if(isArticleExist){
				
				//update article count view
				String update_article_viewcount_str = "update post set totalview = totalview + 1 where postid = ?";

				PreparedStatement update_article_viewcount = con.prepareStatement(update_article_viewcount_str);
				update_article_viewcount.setInt(1, Integer.parseInt(target));

				update_article_viewcount.executeUpdate();
				
				
				
				// get article information
				__Article article = new __Article();
				article.setPostID(Integer.parseInt(target));
				article.setCoverImage(result.getString("CoverImage"));
				article.setTitle(result.getString("title"));
				article.setAuthor(result.getString("author"));
				article.setContent(result.getString("content"));
				article.setShortDesc(result.getString("ShortDesc"));
				article.setGeoLocation(result.getString("geolocation"));
				article.setPurchaseLink(result.getString("purchaselink"));
				
				java.sql.Timestamp sqltime = result.getTimestamp("PostCreatedTime");
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
				
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/xin_article.jsp");
				dispatcher.forward(request, response);
				
			}else{
				response.sendRedirect("index");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("index");
		} catch(java.lang.NullPointerException e){
			e.printStackTrace();
			response.sendRedirect("index");
		} finally{
			db.setClose();
			db1.setClose();
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
		
		
		
		
		String uid = request.getParameter("uid");
		String comment = request.getParameter("comment");
		String pid = request.getParameter("postid");
		
		java.util.Date today = new java.util.Date();

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();
		___IniDB db1 = new ___IniDB("ajliuyan");
		Connection con1 = db1.getConnection();
		
		boolean isArticleExist = false;

		try {
			
			//insert this user's record in the comment table
			PreparedStatement insert_liuyan_sql = con1.prepareStatement("insert into ajliuyan.article_comment(userid, username, articleid, comment, postcreatedtime, userpicture) VALUES (?,?,?,?,?,?)");
			insert_liuyan_sql.setInt(1, Integer.parseInt(uid));
			insert_liuyan_sql.setString(2, s.getUsername());
			insert_liuyan_sql.setInt(3, Integer.parseInt(pid));
			insert_liuyan_sql.setString(4, comment);
			insert_liuyan_sql.setTimestamp(5, new java.sql.Timestamp(today.getTime()));
			insert_liuyan_sql.setString(6, s.getPhotoPath());
			insert_liuyan_sql.executeUpdate();
			
			//System.out.println("1");
			
			//go to the article page again
			PreparedStatement sql_article = con.prepareStatement("select * from post where poststatus = 1 and verify = 1 and postid = ?");
			sql_article.setInt(1, Integer.parseInt(pid));

			ResultSet result = sql_article.executeQuery();

			if (result.next())
				isArticleExist = true;
			
			
			
			if(isArticleExist){
				
				__Article article = new __Article();
				article.setPostID(Integer.parseInt(pid));
				article.setTitle(result.getString("title"));
				article.setCoverImage(result.getString("CoverImage"));
				article.setAuthor(result.getString("author"));
				article.setContent(result.getString("content"));
				article.setShortDesc(result.getString("ShortDesc"));
				article.setGeoLocation(result.getString("geolocation"));
				article.setPurchaseLink(result.getString("purchaselink"));
				
				java.sql.Timestamp sqltime = result.getTimestamp("PostCreatedTime");
				long time = sqltime.getTime();
				Calendar calendar = Calendar.getInstance();
				calendar.setTimeInMillis(time);
				int month = calendar.get(Calendar.MONTH) + 1;
				article.setPostDate(month + "\u6708" + calendar.get(Calendar.DATE)+ "\u65E5");
				request.setAttribute("article", article);
				//System.out.println(s.getUserID());
				request.setAttribute("uid", s.getUserID());

				
				//get comment
				String sql_comment_str = "select * from article_comment where articleid = ?";
				PreparedStatement sql_comment = con1.prepareStatement(sql_comment_str , ResultSet.TYPE_SCROLL_INSENSITIVE);
				sql_comment.setInt(1, Integer.parseInt(pid));
				ResultSet rm = sql_comment.executeQuery();

				boolean isLast = true;

				int countTotalComment = 0;
				List<__Comment> commentList = new ArrayList<__Comment>();

				
				if(rm.first()){
					rm.beforeFirst();

					while(isLast) {

						if(rm.next()){

							__Comment comment1 = new __Comment();
							comment1.setCID(rm.getInt("cid"));
							comment1.setUserID(rm.getInt("userid"));
							comment1.setUsername(rm.getString("username"));
							comment1.setUserPic(rm.getString("userpicture"));
							comment1.setComment(rm.getString("comment").replaceAll("(\r\n|\n)", "<br />"));
							java.sql.Timestamp csqltime = rm.getTimestamp("PostCreatedTime");
							long ctime = csqltime.getTime();
							Calendar ccalendar = Calendar.getInstance();
							ccalendar.setTimeInMillis(ctime);
							int cmonth = ccalendar.get(Calendar.MONTH) + 1;
							comment1.setCommentTime(cmonth + "\u6708" + ccalendar.get(Calendar.DATE)+ "\u65E5");
							
							commentList.add(comment1);
							
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
				update_article_commentcount.setInt(2, Integer.parseInt(pid));
				update_article_commentcount.executeUpdate();
				
				
				request.setAttribute("commentList", commentList);
				//request.setAttribute("user_photo_path", s.getPhotoPath());
				
				Gson gson = new Gson();
				
				String jobj1 = gson.toJson(commentList);
				
				response.setContentType("application/json"); 
				response.setCharacterEncoding("utf-8"); 
				//String bothJson = "";
				//System.out.println(jobj1);
				response.getWriter().write(jobj1);
				
			}else{
				response.sendRedirect("index");
			}
			
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("index");
		} catch(java.lang.NullPointerException e){
			e.printStackTrace();
			response.sendRedirect("index");
		} finally{
			db.setClose();
			db1.setClose();
		}

	}

}
