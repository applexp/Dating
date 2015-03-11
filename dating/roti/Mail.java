package roti;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
 * Servlet implementation class Mail
 */
@WebServlet(name="Mail", urlPatterns={"/zhs/mail"})
public class Mail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Mail() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		//int t_mailid = -1;
		
		//String si = request.getParameter("i");
		
			

		//System.out.println("lalal 1    4");
		
		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();

		boolean correctUser = false;
		int temp_userID = -1;
		//String temp_photo = "";
		HttpServletRequest r = null;

		try{
			//if(si != null )
			//	t_mailid = Integer.parseInt(si);

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
					//temp_photo = result.getString("photo");
					correctUser = true;
				}
			}

			if(correctUser){

				// -1 mean default value(mean nothing)
				r = retriveMails(con, request, temp_userID);

				r.setAttribute("yourid", temp_userID+"");

				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/mail.jsp");
				dispatcher.forward(r, response);


			}else{
				// if UUID has been updated/changed, the user will be redirected to login
				// or the authentication is failed, the user will be redirected to login page
				response.sendRedirect("login?type=0&email=");
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		request.setCharacterEncoding("UTF-8");

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();

		boolean correctUser = false;
		int temp_userID = -1;
		String temp_photo = "";
		//HttpServletRequest r = null;
		
		try{

			int t_mailid = Integer.parseInt(request.getParameter("mid"));
			String t_name = request.getParameter("tname"); // lovername
			String loverPictureIndex = request.getParameter("index"); // based on the list

			___Session session = new ___Session(request);
			String sname = session.getUsername();
			String uuid = session.getUUID();
			String email = session.getEmail();
			String sstatus = session.getStatus();
			String role = session.getRole();

			PreparedStatement sql_user_account = con.prepareStatement("select userid, email, photo from user where email = ? and UUID = ? and status = ?");
			sql_user_account.setString(1, email);
			sql_user_account.setString(2, uuid);
			sql_user_account.setString(3, sstatus);

			ResultSet result = sql_user_account.executeQuery();

			if (result.next()){
				if(email.equals(result.getString("email"))){
					temp_userID = result.getInt("userid");
					temp_photo = result.getString("photo");
					correctUser = true;
				}
			}

			if(correctUser){

				toJSONMails(con, response, temp_userID, t_mailid, sname, t_name, temp_photo, loverPictureIndex);
				
				//System.out.println(t_mailid);
				
//				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/mail.jsp");
//				dispatcher.forward(r, response);
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


	private HttpServletRequest retriveMails(Connection con, HttpServletRequest request, int userid) throws SQLException{

		// mail table
		// retrieve all mails by this user
		PreparedStatement sql_mail = con.prepareStatement("select * from mail where userid = ? or loverid = ? ORDER BY LatestReplyTimeStamp DESC" , ResultSet.TYPE_SCROLL_INSENSITIVE);
		sql_mail.setInt(1, userid);
		sql_mail.setInt(2, userid);
		ResultSet rm = sql_mail.executeQuery();

		boolean isLast = true;


		List<__Mail> mailList = new ArrayList<__Mail>();

		if(rm.first()){
			rm.beforeFirst();

			while(isLast) {

				if(rm.next()){

					__Mail mail = new __Mail();
					mail.setMailID(rm.getInt("mailid"));
					mail.setCoupleID(rm.getString("coupleid"));
					mail.setUserID(rm.getInt("userid"));
					mail.setUserName(rm.getString("username"));
					mail.setUserPicture(rm.getString("userpicture"));
					mail.setLoverID(rm.getInt("loverid"));
					mail.setLoverName(rm.getString("lovername"));
					mail.setLoverPicture(rm.getString("loverpicture"));
					mail.setTotalReply(rm.getInt("totalreply"));
					mail.setLatestTimeStamp(rm.getTimestamp("LatestReplyTimeStamp")+"");
					mail.setNotViewTotalReplyA(rm.getInt("NotViewTotalReplyA"));
					mail.setNotViewTotalReplyB(rm.getInt("NotViewTotalReplyB"));

					mailList.add(mail);

				}else if(rm.last()){

					isLast = false;

				}
			}
		}

		List<__MailMsg> msgList = new ArrayList<__MailMsg>();
		if(mailList.size() != 0){
			isLast = true; // reset

			// mailmsg table
			// retrieve all reply message from the first message id, [default]
			PreparedStatement sql_mailmsg = con.prepareStatement("select * from mailmsg where mailid = ?" , ResultSet.TYPE_SCROLL_INSENSITIVE);
			
			//int id = (t_mailid == -1)? mailList.get(0).getMailID():t_mailid;
			sql_mailmsg.setInt(1, mailList.get(0).getMailID());
			ResultSet r1 = sql_mailmsg.executeQuery();



			if(r1.first()){
				r1.beforeFirst();

				while(isLast) {

					if(r1.next()){

						__MailMsg msg = new __MailMsg();
						msg.setMailMsgID(r1.getInt("mailmsgid"));
						msg.setReplyUserID(r1.getInt("replyuserid"));
						msg.setMailID(r1.getInt("mailid"));
						msg.setMessage(r1.getString("messages").replaceAll("(\r\n|\n)", "<br />"));
						
						java.sql.Timestamp time = r1.getTimestamp("ReplyTimeStamp");
						long replyTimeMillis = time.getTime();
						
						Calendar start = Calendar.getInstance();
						start.setTimeInMillis(replyTimeMillis);
						
						long current_milli = System.currentTimeMillis();
						long difference_millis = current_milli - replyTimeMillis;
						
						if(difference_millis >= 0 && difference_millis < 60000)
							msg.setReplyTime((difference_millis/1000)%60 +" s");
						else if(difference_millis > 60000 && difference_millis < 3600000)
							msg.setReplyTime(((difference_millis)/1000)/60+" m");
						else if(difference_millis > 3600000 && difference_millis < 86400000){
							long seconds = difference_millis / 1000;  
							long hours = seconds / 3600; 
							msg.setReplyTime(hours+" h");
						}else
							msg.setReplyTime(new SimpleDateFormat("MM/dd, hh:mm:ss a").format(replyTimeMillis));
						
						//msg.setReplyTime(start.getFirstDayOfWeek()+"");
						msgList.add(msg);
						
						//System.out.println(start.get(Calendar.MINUTE) +"/" + time.getTime());

					}else if(r1.last()){

						isLast = false;

					}
				}
			}
		}

		request.setAttribute("mailList", mailList);
		request.setAttribute("messageList", msgList);
		
		return request;
	}
	
	private void toJSONMails(Connection con, HttpServletResponse response, int userid, int t_mailid, String username, String lovername, String userPhoto, String loverPicture) throws SQLException, IOException{

		// mail table
		// retrieve all mails by this user
		PreparedStatement sql_mail = con.prepareStatement("select * from mail where userid = ? or loverid = ? ORDER BY LatestReplyTimeStamp DESC" , ResultSet.TYPE_SCROLL_INSENSITIVE);
		sql_mail.setInt(1, userid);
		sql_mail.setInt(2, userid);
		ResultSet rm = sql_mail.executeQuery();

		boolean isLast = true;


		List<__Mail> mailList = new ArrayList<__Mail>();

		if(rm.first()){
			rm.beforeFirst();

			while(isLast) {

				if(rm.next()){

					__Mail mail = new __Mail();
					mail.setMailID(rm.getInt("mailid"));
					mail.setCoupleID(rm.getString("coupleid"));
					mail.setUserID(rm.getInt("userid"));
					mail.setUserName(rm.getString("username"));
					mail.setUserPicture(rm.getString("userpicture"));
					mail.setLoverID(rm.getInt("loverid"));
					mail.setLoverName(rm.getString("lovername"));
					mail.setLoverPicture(rm.getString("loverpicture"));
					mail.setTotalReply(rm.getInt("totalreply"));
					mail.setLatestTimeStamp(rm.getTimestamp("LatestReplyTimeStamp")+"");
					mail.setNotViewTotalReplyA(rm.getInt("NotViewTotalReplyA"));
					mail.setNotViewTotalReplyB(rm.getInt("NotViewTotalReplyB"));

					mailList.add(mail);

				}else if(rm.last()){

					isLast = false;

				}
			}
		}

		List<__MailMsg> msgList = new ArrayList<__MailMsg>();
		if(mailList.size() != 0){
			isLast = true; // reset

			// mailmsg table
			// retrieve all reply message from the first message id, [default]
			PreparedStatement sql_mailmsg = con.prepareStatement("select * from mailmsg where mailid = ?" , ResultSet.TYPE_SCROLL_INSENSITIVE);
			
			int id = (t_mailid == -1)? mailList.get(0).getMailID():t_mailid;
			sql_mailmsg.setInt(1, id);
			ResultSet r1 = sql_mailmsg.executeQuery();



			if(r1.first()){
				r1.beforeFirst();

				while(isLast) {

					if(r1.next()){

						__MailMsg msg = new __MailMsg();
						msg.setMailMsgID(r1.getInt("mailmsgid"));
						int userReplyID = r1.getInt("replyuserid");
						msg.setReplyUserID(userReplyID);
						msg.setMailID(r1.getInt("mailid"));
						msg.setMessage(r1.getString("messages").replaceAll("(\r\n|\n)", "<br />"));
						
						//time
						java.sql.Timestamp time = r1.getTimestamp("ReplyTimeStamp");
						long replyTimeMillis = time.getTime();
						
						Calendar start = Calendar.getInstance();
						start.setTimeInMillis(replyTimeMillis);
						
						long current_milli = System.currentTimeMillis();
						long difference_millis = current_milli - replyTimeMillis;
						
						if(difference_millis >= 0 && difference_millis < 60000)
							msg.setReplyTime((difference_millis/1000)%60 +" s");
						else if(difference_millis > 60000 && difference_millis < 3600000)
							msg.setReplyTime(((difference_millis)/1000)/60+" m");
						else if(difference_millis > 3600000 && difference_millis < 86400000){
							long seconds = difference_millis / 1000;  
							long hours = seconds / 3600; 
							msg.setReplyTime(hours+" h");
						}else
							msg.setReplyTime(new SimpleDateFormat("MM/dd, hh:mm:ss a").format(replyTimeMillis));
						
						String isLR = "";
						/** display decision
						 * 1 - is you
						 * 2 - someone
						 */
						if(userid == userReplyID){
							isLR = "r";
						}else
							isLR = "l";
							
						msg.setIsLeftRight(isLR);
						
						msgList.add(msg);

					}else if(r1.last()){

						isLast = false;

					}
				}
			}
		}
		
		Gson gson = new Gson();
		
		String jobj1 = gson.toJson(mailList);
		String jobj2 = gson.toJson(msgList);
		String juserid = gson.toJson(userid);
		String jusername = gson.toJson(username);
		String jlovername = gson.toJson(lovername);
		String juserphoto = gson.toJson(userPhoto);
		String jloverpic = gson.toJson(loverPicture);
		
		response.setContentType("application/json"); 
		response.setCharacterEncoding("utf-8"); 
		String bothJson = "["+jobj1+","+jobj2+","+juserid+","+jusername+","+jlovername+","+juserphoto+","+jloverpic+"]";
		//System.out.println(bothJson);
		response.getWriter().write(bothJson);
		
		//System.out.println(jobj1);
		//System.out.println(jobj2);
		
	}
}
