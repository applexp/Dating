package roti;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Youxi_WanSheng
 */
@WebServlet(name="Youxi_WanSheng", urlPatterns={"/zhs/youxi/wansheng"})
public class Youxi_WanSheng extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Youxi_WanSheng() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("hi");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//String data = request.getParameter("data");

		//System.out.println(data);
		//System.out.println(request.getParameter("timestamp"));
		String timestamp = request.getParameter("timestamp");
		String yourscore = request.getParameter("score");
		String gametime = request.getParameter("game_time");
		//System.out.println(timestamp +" "+ yourscore + " "+gametime);


		___IniDB db = new ___IniDB("youxi");
		Connection con = db.getConnection();

		try{
			
			String clietip = getClientIpAddr(request);
			//System.out.println(clietip);
			
			PreparedStatement sql_update_dagui_fenshu = con.prepareStatement("insert into youxi.danangua(uuid, fenshu,gametime, ip) VALUES (?,?,?,?)");
			sql_update_dagui_fenshu.setString(1, timestamp);
			sql_update_dagui_fenshu.setInt(2, Integer.parseInt(yourscore));
			sql_update_dagui_fenshu.setInt(3, Integer.parseInt(gametime));
			sql_update_dagui_fenshu.setString(4, clietip);
			sql_update_dagui_fenshu.executeUpdate();


			//PreparedStatement sql_dagui_fenshu = con.prepareStatement("SELECT * FROM youxi.danangua order by fenshu desc,gametime asc LIMIT 0,100", ResultSet.TYPE_SCROLL_INSENSITIVE);
			//PreparedStatement sql_dagui_fenshu = con.prepareStatement("SELECT playid, fenshu, gametime, @curRank := @curRank + 1 AS rank FROM youxi.danangua p, (SELECT @curRank := 0) r where uuid = ? ORDER BY fenshu desc,gametime asc", ResultSet.TYPE_SCROLL_INSENSITIVE);
			//PreparedStatement sql_dagui_fenshu = con.prepareStatement("SELECT playid, uuid, fenshu, gametime, FIND_IN_SET( fenshu, (SELECT GROUP_CONCAT(fenshu ORDER BY fenshu desc,gametime asc) FROM youxi.danangua)) AS rank FROM youxi.danangua where uuid = ?");

			PreparedStatement sql_dagui_fenshu = con.prepareStatement("SELECT COUNT(*) as rank FROM youxi.danangua WHERE fenshu >= (SELECT fenshu FROM youxi.danangua WHERE uuid = ?)");
			sql_dagui_fenshu.setString(1, timestamp);

			ResultSet rm = sql_dagui_fenshu.executeQuery();
			String rankno = "";
			if (rm.next())
				rankno = rm.getString("rank");

			System.out.println(rankno);
			response.getWriter().write(rankno);

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
	
	
	public static String getClientIpAddr(HttpServletRequest request) {  
        String ip = request.getHeader("X-Forwarded-For");  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("WL-Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_CLIENT_IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getRemoteAddr();  
        }  
        return ip;  
    }  

}
