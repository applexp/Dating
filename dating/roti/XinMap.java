package roti;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
@WebServlet(name="XinMap", urlPatterns={"/zhs/map"})
public class XinMap extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XinMap() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();
		HttpServletRequest r = null;

		try{

			r = getAllArticles(con, request);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/xin_ditu.jsp");
			dispatcher.forward(r, response);



		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("index");
		} catch(java.lang.NullPointerException e){
			System.out.println("main page");
			e.printStackTrace();
			response.sendRedirect("index");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("index");
		} finally{
			db.setClose();
		}


		//		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/new_index.jsp");
		//		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub


	}


	private HttpServletRequest getAllArticles(Connection con, HttpServletRequest request) throws SQLException{
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		
		String sql_marker_events = "select * from hunyin.post where geolocation != 0 and EventDate >= date(?) and poststatus = 1 ORDER BY EventDate DESC;";
		//"select * from post where posttype = ? ORDER BY postid DESC"
		
		PreparedStatement sql_article = con.prepareStatement(sql_marker_events, ResultSet.TYPE_SCROLL_INSENSITIVE);
		sql_article.setString(1, dateFormat.format(date));
		ResultSet rm = sql_article.executeQuery();

		boolean isLast = true;


		int z = 1;
		String a ="[";
		
		if(rm.first()){
			rm.beforeFirst();

			while(isLast) {

				if(rm.next()){

					String[] geo = rm.getString("geolocation").split(",");

					
					a +=  "['"+ rm.getString("title") +" ',"+ geo[0] +","+ geo[1]+","+ z++ +", './../media/event_maker.jpg', 'article?post="+ rm.getInt("postid") + "', '"+rm.getString("ShortDesc")+" '],";

				}else if(rm.last()){
					isLast = false;
				}
				
			}
		}
		a += "];";
		
//		Gson gson = new Gson();
		
//		String gsonArticle = gson.toJson(articalList);
		//System.out.println(a);
		request.setAttribute("gsonArticle", a);

		return request;
	}


}
