package roti;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class MailReply
 */
@WebServlet(name="MailReply", urlPatterns={"/zhs/mailreply"})
public class MailReply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MailReply() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		int replyuserid = Integer.parseInt(request.getParameter("replyidfrombox"));
		int mailid = Integer.parseInt(request.getParameter("mailidfrombox"));
		String msg = request.getParameter("replymsgfrombox");
		String coupleid = request.getParameter("cidfrombox");
		String tname = request.getParameter("tnamefrombox");
		String index = request.getParameter("indexfrombox");
		
		//System.out.println(msg);
		
		String[] cids = coupleid.split("D");
		int aid = Integer.parseInt(cids[0]);
		int bid = Integer.parseInt(cids[1]);
		
		
		
		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();

		boolean correctUser = false;
		int temp_userID = -1;
		
		try{

			___Session session = new ___Session(request);
			String sname = session.getUsername();
			String uuid = session.getUUID();
			String email = session.getEmail();
			String sstatus = session.getStatus();
			String role = session.getRole();

			PreparedStatement sql_user_account = con.prepareStatement("select userid, email from user where email = ? and UUID = ? and status = ?");
			sql_user_account.setString(1, email);
			sql_user_account.setString(2, uuid);
			sql_user_account.setString(3, sstatus);

			ResultSet result = sql_user_account.executeQuery();

			if (result.next()){
				if(email.equals(result.getString("email"))){
					temp_userID = result.getInt("userid");
					correctUser = true;
				}
			}

			if(correctUser){
				
				java.util.Date today = new java.util.Date();
				
				
				// update the date and time if the mail is already there
				String update_mail_st = "update mail set LatestReplyTimeStamp = ?, IsNewReplyA = ?, IsNewReplyB = ?, NotViewTotalReplyA = NotViewTotalReplyA + ?, NotViewTotalReplyB = NotViewTotalReplyB + ?, TotalReply = TotalReply + 1  where mailid = ?";

				PreparedStatement update_mail_sql = con.prepareStatement(update_mail_st);
				update_mail_sql.setTimestamp(1, new java.sql.Timestamp(today.getTime()));
				update_mail_sql.setInt(2, (aid == replyuserid)? 0 : 1);
				update_mail_sql.setInt(3, (bid == replyuserid)? 0 : 1);
				update_mail_sql.setInt(4, (aid == replyuserid)? 0 : 1);
				update_mail_sql.setInt(5, (bid == replyuserid)? 0 : 1);
				update_mail_sql.setInt(6, mailid);
				
				update_mail_sql.executeUpdate();
				
				
				//insert a new chat record into the mailmsg table
				PreparedStatement insert_mailmsg_sql = con.prepareStatement("insert into hunyin.mailmsg(replyuserid, mailid, messages, replytimestamp, IsReadA, IsReadB) VALUES (?,?,?,?,?,?)");
				insert_mailmsg_sql.setInt(1, replyuserid);
				insert_mailmsg_sql.setInt(2, mailid);
				insert_mailmsg_sql.setString(3, msg);
				insert_mailmsg_sql.setTimestamp(4, new java.sql.Timestamp(today.getTime()));
				insert_mailmsg_sql.setInt(5, (aid == replyuserid)? 0 : 1);
				insert_mailmsg_sql.setInt(6, (bid == replyuserid)? 0 : 1);

				insert_mailmsg_sql.executeUpdate();
				
				Gson gson = new Gson();
				
				String jobj1 = gson.toJson(mailid);
				String jobj2 = gson.toJson(tname);
				String jobj3 = gson.toJson(coupleid);
				String jobj4 = gson.toJson(index);
				
				response.setContentType("application/json"); 
				response.setCharacterEncoding("utf-8"); 
				String bothJson = "["+jobj1+","+jobj2+","+jobj3+","+jobj4+"]";
				//System.out.println(bothJson);
				response.getWriter().write(bothJson);
				
			}


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


	}

}
