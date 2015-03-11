package roti;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amazonaws.util.json.JSONArray;
import com.amazonaws.util.json.JSONObject;
import com.google.gson.Gson;

/**
 * Servlet implementation class Youxi_WanSheng
 */
@WebServlet(name="Youxi_FenshuBang", urlPatterns={"/zhs/youxi/wansheng_fenshu"})
public class Youxi_FenshuBang extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Youxi_FenshuBang() {
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
		
		___IniDB db = new ___IniDB("youxi");
		Connection con = db.getConnection();

		try{
			
			//PreparedStatement sql_dagui_fenshu = con.prepareStatement("SELECT * FROM youxi.danangua order by fenshu desc,gametime asc LIMIT 0,100", ResultSet.TYPE_SCROLL_INSENSITIVE);
			//PreparedStatement sql_dagui_fenshu = con.prepareStatement("SELECT playid, fenshu, gametime, @curRank := @curRank + 1 AS rank FROM youxi.danangua p, (SELECT @curRank := 0) r where uuid = ? ORDER BY fenshu desc,gametime asc", ResultSet.TYPE_SCROLL_INSENSITIVE);
			
			String st = "SELECT playid, uuid, fenshu, gametime,gameCreatedDate, 1+(SELECT count(*) from youxi.danangua a WHERE a.fenshu > b.fenshu) as RNK FROM youxi.danangua b order by fenshu desc,gametime asc LIMIT 0,10";
			
  			PreparedStatement sql_dagui_top100 = con.prepareStatement(st, ResultSet.TYPE_SCROLL_INSENSITIVE);
  			ResultSet rm = sql_dagui_top100.executeQuery();
  			
			boolean isLast = true;

			List<__Player> top10Players = new ArrayList<__Player>();

			if(rm.first()){
				rm.beforeFirst();

				while(isLast) {

					if(rm.next()){
						String uuid = rm.getString("uuid");
						int fenshu = rm.getInt("fenshu");
						int gametime = rm.getInt("gametime");
						int rank = rm.getInt("RNK");
						
						
						__Player player = new __Player();
						player.setHaoma("WS"+uuid.substring(2,5)+"***");
						player.setFenshu(fenshu);
						player.setGameTime(gametime);
						player.setPaiming(rank);
						//System.out.println(rm.getString("uuid")+" : " +rm.getInt("fenshu")+" : "+rm.getInt("gametime"));
						top10Players.add(player);

					}else if(rm.last()){
						isLast = false;
					}
				}
			}
			
			request.setAttribute("g", "wansheng");
			Gson gson = new Gson();
			String gson100 = gson.toJson(top10Players);
			request.setAttribute("top100", gson100);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/youxi/fenshubang.jsp");
			dispatcher.forward(request, response);
			

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
		
		
	}
	
}
class __Player{
	
	private String haoma;
	private int fenshu;
	private int game_time;
	private int paiming;
	
	
	public __Player(){
		haoma = "";
		fenshu = 0;
		game_time = 0;
		paiming = 0;
	}
	
	public void setHaoma(String time){
		haoma = time;
	}
	public void setFenshu(int score){
		this.fenshu = score;
	}
	public void setGameTime(int gameTime){
		game_time = gameTime;
	}
	public void setPaiming(int paiming){
		this.paiming = paiming;
	}
	public String getHaoma(){
		return haoma;
	}
	public int getFenshu(){
		return fenshu;
	}
	public int getGameTime(){
		return game_time;
	}
	public int getPaiming(){
		return paiming;
	}
	
}
