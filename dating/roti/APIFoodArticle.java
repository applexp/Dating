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
 * Servlet implementation class MainPage
 */
@WebServlet(name="APIFoodArticle", urlPatterns={"/zhs/food-article"})
public class APIFoodArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public APIFoodArticle() {
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

		String target = request.getParameter("type");
		String genre = request.getParameter("g"); // g = genre

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();

		HttpServletRequest r = null;

		try{

			if(target.equals("event")){

				r = getAllEvents(con, request);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/xin_event.jsp");
				dispatcher.forward(r, response);


			}else if(target.equals("food")){

				r = getAllFoods(con, request);

				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/xin_event.jsp");
				dispatcher.forward(r, response);

			}


		} catch (SQLException e) {
			e.printStackTrace();
			//response.sendRedirect("index");
		} catch(java.lang.NullPointerException e){
			System.out.println("main page");
			e.printStackTrace();
			//response.sendRedirect("index");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//response.sendRedirect("index");
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

	private HttpServletRequest getAllEvents(Connection con, HttpServletRequest request) throws SQLException{

		String sql_event_genre = "select * from post where poststatus = 1 and geshi = 2 and verify = 1 ORDER BY PostCreatedTime DESC";

		request.setAttribute("g", "a");
		request.setAttribute("jiele","no");


		PreparedStatement sql_article = con.prepareStatement(sql_event_genre , ResultSet.TYPE_SCROLL_INSENSITIVE);
		//sql_article.setInt(1, posttype);
		ResultSet rm = sql_article.executeQuery();

		boolean isLast = true;


		List<__Article> articalList = new ArrayList<__Article>();

		if(rm.first()){
			rm.beforeFirst();

			while(isLast) {
				if(rm.next()){

					__Article article = new __Article();
					article.setPostID(rm.getInt("postid"));
					//article.setPostType(posttype);
					article.setTitle(rm.getString("title"));
					article.setAuthor(rm.getString("author"));
					article.setEventDate(rm.getString("eventdate"));
					String[] aed = rm.getString("eventdate").split("-");
					String getDayOfWeek = rm.getString("DayOfWeek");

					if(getDayOfWeek.equals("-1"))
						article.setDayOfWeek("");
					else
						article.setDayOfWeek(getDayInChinese(getDayOfWeek));

					String disEventDate = aed[1] + "\u6708" + aed[2]+ "\u65E5";
					article.setDisEventDate(disEventDate);

					String eventtime = rm.getString("eventtime");
					String[] ets = eventtime.split(":");
					if(Integer.parseInt(ets[0]) < 12)
						eventtime = ets[0] + ":" + ets[1] +"\u4E0A\u5348";
					else
						eventtime = ets[0] + ":" + ets[1] +"\u4E0B\u5348";

					article.setSTime(eventtime);
					article.setCoverImage(rm.getString("coverimage"));
					article.setContent(rm.getString("ShortDesc"));
					article.setGeshi(rm.getInt("geshi"));
					article.setPurchaseLink(rm.getString("PurchaseLink"));

					articalList.add(article);

				}else if(rm.last()){
					isLast = false;
				}
			}
		}

		Gson gson = new Gson();
		String gsonArticle = gson.toJson(articalList);
		request.setAttribute("gsonArticle", gsonArticle);

		//request.setAttribute("articleList", articalList);

		return request;
	}

	
	private HttpServletRequest getAllFoods(Connection con, HttpServletRequest request) throws SQLException{

		String sql_article_genre = "select * from post where poststatus = 1 and verify = 1 and genre = 12 ORDER BY PostCreatedTime DESC";

		request.setAttribute("g", "food");
		request.setAttribute("jiele","no");
		
		PreparedStatement sql_article = con.prepareStatement(sql_article_genre , ResultSet.TYPE_SCROLL_INSENSITIVE);
		//sql_article.setInt(1, posttype);
		ResultSet rm = sql_article.executeQuery();

		boolean isLast = true;


		List<__Article> articalList = new ArrayList<__Article>();

		if(rm.first()){
			rm.beforeFirst();

			while(isLast) {

				if(rm.next()){

					__Article article = new __Article();
					article.setPostID(rm.getInt("postid"));
					//article.setPostType(posttype);
					article.setTitle(rm.getString("title"));
					article.setAuthor(rm.getString("author"));
					article.setEventDate(rm.getString("eventdate"));
					String[] aed = rm.getString("eventdate").split("-");
					String getDayOfWeek = rm.getString("DayOfWeek");

					if(getDayOfWeek.equals("-1"))
						article.setDayOfWeek("");
					else
						article.setDayOfWeek(getDayInChinese(getDayOfWeek));

					String disEventDate = aed[1] + "\u6708" + aed[2]+ "\u65E5";
					article.setDisEventDate(disEventDate);

					String eventtime = rm.getString("eventtime");
					String[] ets = eventtime.split(":");
					if(Integer.parseInt(ets[0]) < 12)
						eventtime = ets[0] + ":" + ets[1] +"\u4E0A\u5348";
					else
						eventtime = ets[0] + ":" + ets[1] +"\u4E0B\u5348";

					article.setSTime(eventtime);
					article.setCoverImage(rm.getString("coverimage"));
					article.setContent(rm.getString("ShortDesc"));
					article.setGeshi(rm.getInt("geshi"));
					article.setPurchaseLink(rm.getString("PurchaseLink"));

					articalList.add(article);

				}else if(rm.last()){
					isLast = false;
				}
			}
		}

		Gson gson = new Gson();
		String gsonArticle = gson.toJson(articalList);
		request.setAttribute("gsonArticle", gsonArticle);

		//request.setAttribute("articleList", articalList);

		return request;
	}



	private String getDayInChinese(String day){

		String day_in_chn = "";

		if(day.equals("1"))
			day_in_chn = "\u661F\u671F\u65E5"; // Sunday
		else if(day.equals("2"))
			day_in_chn = "\u661F\u671F\u4E00";
		else if(day.equals("3"))
			day_in_chn = "\u661F\u671F\u4E8C";
		else if(day.equals("4"))
			day_in_chn = "\u661F\u671F\u4E09";
		else if(day.equals("5"))
			day_in_chn = "\u661F\u671F\u56DB";
		else if(day.equals("6"))
			day_in_chn = "\u661F\u671F\u4E94";
		else if(day.equals("7"))
			day_in_chn = "\u661F\u671F\u516D"; // Saturday

		return day_in_chn;
	}
}

