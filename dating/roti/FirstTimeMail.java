package roti;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.joda.time.LocalDate;
import org.joda.time.Years;

/**
 * Servlet implementation class FirstTimeMail
 */
@WebServlet(name="FirstTimeMail", urlPatterns={"/zhs/firsttimemail"})
public class FirstTimeMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FirstTimeMail() {
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
		
		String yourid = request.getParameter("yourid");
		String loverid = request.getParameter("loverid");
		String loverImgPath = request.getParameter("loverpicturepath");
		String lovername = request.getParameter("lovername");
		String messages = request.getParameter("reply");
		
		String coupleID = yourid + "D" + loverid;
		String rcoupleID = loverid + "D" + yourid; // reserved id
		
		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();
		java.util.Date today = new java.util.Date();

		boolean correctUser = false;
		int temp_mailID = -1;
		String temp_photo = "";
//		HttpServletRequest r = null;

		try{

			___Session session = new ___Session(request);
			String sname = session.getUsername();
			String uuid = session.getUUID();
			String email = session.getEmail();
			String sstatus = session.getStatus();
//			String role = session.getRole();

			PreparedStatement sql_user_account = con.prepareStatement("select email, photo from user where email = ? and UUID = ? and status = ?");
			sql_user_account.setString(1, email);
			sql_user_account.setString(2, uuid);
			sql_user_account.setString(3, sstatus);

			ResultSet result = sql_user_account.executeQuery();

			if (result.next()){
				if(email.equals(result.getString("email"))){
					temp_photo = result.getString("photo");
					correctUser = true;
				}
			}

			if(correctUser){
				
				
				PreparedStatement sql_mail_record = con.prepareStatement("select mailid, coupleid from mail where coupleid = ? or coupleid = ?");
				sql_mail_record.setString(1, coupleID);
				sql_mail_record.setString(2, rcoupleID);
				
				ResultSet r = sql_mail_record.executeQuery();

				//if coupleid is not found, a new mail
				if (!r.next()){
					
					java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
							
					//insert a new mail record into the mail table
					PreparedStatement insert_mail_sql = con.prepareStatement("insert into hunyin.mail(coupleid, userid, username, userpicture, loverid, lovername, loverpicture, mailcreatedtimestamp, latestreplytimestamp, IsNewReplyA, IsNewReplyB, NotViewTotalReplyA, NotViewTotalReplyB, TotalReply) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
					insert_mail_sql.setString(1, coupleID);
					insert_mail_sql.setInt(2, Integer.parseInt(yourid));
					insert_mail_sql.setString(3, sname);
					insert_mail_sql.setString(4, temp_photo);
					insert_mail_sql.setInt(5, Integer.parseInt(loverid));
					insert_mail_sql.setString(6, lovername);
					insert_mail_sql.setString(7, loverImgPath);
					insert_mail_sql.setTimestamp(8, timestamp);
					insert_mail_sql.setTimestamp(9, timestamp);
					insert_mail_sql.setInt(10, 0);
					insert_mail_sql.setInt(11, 1);
					insert_mail_sql.setInt(12, 0);
					insert_mail_sql.setInt(13, 1);
					insert_mail_sql.setInt(14, 1);

					insert_mail_sql.executeUpdate();
					
					//retrieve mailid from mail table
					PreparedStatement sql_get_mailid = con.prepareStatement("select mailid from mail where coupleid = ?");
					sql_get_mailid.setString(1, coupleID);
					ResultSet r1 = sql_get_mailid.executeQuery();
					if(r1.next())
						temp_mailID = r1.getInt("mailid");
					
					
					//insert a new chat record into the mailmsg table
					PreparedStatement insert_mailmsg_sql = con.prepareStatement("insert into hunyin.mailmsg(replyuserid, mailid, messages, replytimestamp, IsReadA, IsReadB) VALUES (?,?,?,?,?,?)");
					insert_mailmsg_sql.setInt(1, Integer.parseInt(yourid));
					insert_mailmsg_sql.setInt(2, temp_mailID);
					insert_mailmsg_sql.setString(3, messages);
					insert_mailmsg_sql.setTimestamp(4, timestamp);
					insert_mailmsg_sql.setInt(5, 0);
					insert_mailmsg_sql.setInt(6, 1);

					insert_mailmsg_sql.executeUpdate();
					
				}else{
					
					String[] cids = r.getString("coupleid").split("D");
					int aid = Integer.parseInt(cids[0]);
					int bid = Integer.parseInt(cids[1]);
					int id = Integer.parseInt(yourid);
					
					// update the date and time if the mail is already there
					String update_mail_st = "update mail set LatestReplyTimeStamp = ?, IsNewReplyA = ?, IsNewReplyB = ?, NotViewTotalReplyA = NotViewTotalReplyA + ?, NotViewTotalReplyB = NotViewTotalReplyB + ?, TotalReply = TotalReply + 1 where mailid = ?";

					PreparedStatement update_mail_sql = con.prepareStatement(update_mail_st);
					update_mail_sql.setTimestamp(1, new java.sql.Timestamp(today.getTime()));
					update_mail_sql.setInt(2, (aid == id)? 0 : 1);
					update_mail_sql.setInt(3, (bid == id)? 0 : 1);
					update_mail_sql.setInt(4, (aid == id)? 0 : 1);
					update_mail_sql.setInt(5, (bid == id)? 0 : 1);
					update_mail_sql.setInt(6, r.getInt("mailid"));
					
					update_mail_sql.executeUpdate();
					
					
					//insert a new chat record into the mailmsg table
					PreparedStatement insert_mailmsg_sql = con.prepareStatement("insert into hunyin.mailmsg(replyuserid, mailid, messages, replytimestamp, IsReadA, IsReadB) VALUES (?,?,?,?,?,?)");
					insert_mailmsg_sql.setString(1, yourid);
					insert_mailmsg_sql.setInt(2, r.getInt("mailid"));
					insert_mailmsg_sql.setString(3, messages);
					insert_mailmsg_sql.setTimestamp(4, new java.sql.Timestamp(today.getTime()));
					insert_mailmsg_sql.setInt(5, (aid == id)? 0 : 1);
					insert_mailmsg_sql.setInt(6, (bid == id)? 0 : 1);

					insert_mailmsg_sql.executeUpdate();
					
				}

				response.sendRedirect("profile?id=" + loverid);
				
//				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/mail.jsp");
//				dispatcher.forward(request, response);
				
				
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

}
