/**
 * Daily report generator
 * @author JJ
 * 
 */

package roti;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ___ReportGenerator implements ServletContextListener {

	private ScheduledExecutorService scheduler;

	@Override
	public void contextInitialized(ServletContextEvent event) {
		scheduler = Executors.newSingleThreadScheduledExecutor();
		scheduler.scheduleAtFixedRate(new UpdateCounts(), 0, 6, TimeUnit.HOURS);
	}

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		scheduler.shutdownNow();
	}


	public class UpdateCounts implements Runnable {

		@Override
		public void run() {

			___IniDB db = new ___IniDB();
			Connection con = db.getConnection();
			___IniDB db1 = new ___IniDB("ajliuyan");
			Connection con1 = db1.getConnection();
			//java.util.Date today = new java.util.Date();

			int total_today_user = 0;
			int total_user = 0;

			int total_today_post = 0;
			int total_post = 0;

			int total_today_comment = 0;
			int total_comment = 0;

			try{

				// Get total added user by day
				PreparedStatement sql_total_user_by_day = con.prepareStatement("select COUNT(*) AS total FROM user where CreatedDate > CURDATE();");
				ResultSet result_total_user_by_day = sql_total_user_by_day.executeQuery();
				if (result_total_user_by_day.next())
					total_today_user = result_total_user_by_day.getInt(1);

				
				// Get total added user by all
				PreparedStatement sql_total_user_by_all = con.prepareStatement("select COUNT(*) AS total FROM user;");
				ResultSet result_total_user_by_all = sql_total_user_by_all.executeQuery();
				if (result_total_user_by_all.next())
					total_user = result_total_user_by_all.getInt(1);
				
				
				
				// Get total added post by day
				PreparedStatement sql_total_post_by_day = con.prepareStatement("select COUNT(*) AS total FROM post where PostCreatedTime > CURDATE();");
				ResultSet result_total_post_by_day = sql_total_post_by_day.executeQuery();
				if (result_total_post_by_day.next())
					total_today_post = result_total_post_by_day.getInt(1);

				
				// Get total added user by all
				PreparedStatement sql_total_post_by_all = con.prepareStatement("select COUNT(*) AS total FROM post;");
				ResultSet result_total_post_by_all = sql_total_post_by_all.executeQuery();
				if (result_total_post_by_all.next())
					total_post = result_total_post_by_all.getInt(1);
				
				
				// Get total added comment by day
				PreparedStatement sql_total_comment_by_day = con1.prepareStatement("select COUNT(*) AS total FROM article_comment where PostCreatedTime > CURDATE();");
				ResultSet result_total_comment_by_day = sql_total_comment_by_day.executeQuery();
				if (result_total_comment_by_day.next())
					total_today_comment = result_total_comment_by_day.getInt(1);

				
				// Get total added comment by all
				PreparedStatement sql_total_comment_by_all = con1.prepareStatement("select COUNT(*) AS total FROM article_comment;");
				ResultSet result_total_comment_by_all = sql_total_comment_by_all.executeQuery();
				if (result_total_comment_by_all.next())
					total_comment = result_total_comment_by_all.getInt(1);
				
				
				
				// insert new user information
				String report_st = "insert into hunyin.Report(Day_Add_User, Total_Add_User, Day_Add_Post, Total_Add_Post, Day_Add_Comment, Total_Add_Comment) VALUES (?,?,?,?,?,?)";

				PreparedStatement sql_daily_report = con.prepareStatement(report_st);
				sql_daily_report.setInt(1, total_today_user);
				sql_daily_report.setInt(2, total_user);
				sql_daily_report.setInt(3, total_today_post);
				sql_daily_report.setInt(4, total_post);
				sql_daily_report.setInt(5, total_today_comment);
				sql_daily_report.setInt(6, total_comment);

				sql_daily_report.executeUpdate();


			} catch (SQLException e) {
				e.printStackTrace();
			} catch(java.lang.NullPointerException e){
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally{
				db.setClose();
				db1.setClose();
			}

		}

	}

}

