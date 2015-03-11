package roti;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.joda.time.LocalDate;
import org.joda.time.Years;

/**
 * Servlet implementation class Login
 */
@WebServlet(name="Register", urlPatterns={"/zhs/register1"})
public class Register extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static final String PASS_SECRET_KEY = "gjfsa#()*;LDSFA;0sdfj3409asdef0FjsdJ=3SD";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String g1 = request.getParameter("g1");
		String g2 = request.getParameter("g2");
		String email = request.getParameter("email");

		request.setAttribute("g1", g1);
		request.setAttribute("g2", g2);
		request.setAttribute("email", email);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/register.jsp");
		dispatcher.forward(request, response);
		
		/*
		request.setCharacterEncoding("UTF-8");
		
		String type = request.getParameter("type");
		int isPhoto = 1; //default value
		int age1 = 24; //default value
		int age2 = 35; //default value
		String isOnline = "zaixian"; //default value
		String state = "noValue"; //default value
		String country = "noValue"; //default value
		String sname = "noValue"; //default value
		String sdesc = "noValue"; //default value
		
		int limit = 4; // from a
		double dlimit = 4.0;
		int totalRows = 0;
		String offset = request. getParameter("z"); // to z
		
		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();
		
		try {

			
			___Session s = new ___Session(request);
			String name = s.getUsername();
			String uuid = s.getUUID();
			String email = s.getEmail();
			String status = s.getStatus();
			String role = s.getRole();
			String genders = "";
			String[] gender = {"",""};
			
			/**
			 * 0 - default
			 * 1 - define by user
			 */
		/*
			if(type.equals("0")){
				
				genders = s.getGenders();
				gender = genders.split("@");
				
			}else if(type.equals("1")){

				isPhoto = Integer.parseInt(request.getParameter("ip"));
				isOnline = request.getParameter("io");
				age1 = Integer.parseInt(request.getParameter("a1"));
				age2 = Integer.parseInt(request.getParameter("a2"));
				state = request.getParameter("state");
				country = request.getParameter("country");
				sname = request.getParameter("sname");
				sdesc = request.getParameter("sdesc");
				gender[0] = request.getParameter("g1");
				gender[1] = request.getParameter("g2");
				
			}
			
			String self_photoPath = "";
			int temp_age = -1;
			//int temp_isPhoto = 0;
			
			boolean correctUser = false;

			//System.out.println("00 " + name + " " + uuid + " " + email + " " + status + " " + role + " " + gender[0] + " " + gender[1]);
			
			PreparedStatement sql_user_account = con.prepareStatement("select photo, age from user where email = ? and UUID = ? and status = ?");
			sql_user_account.setString(1, email);
			sql_user_account.setString(2, uuid);
			sql_user_account.setString(3, status);

			ResultSet result = sql_user_account.executeQuery();

			if (result.next()){
				self_photoPath = result.getString("photo");
				temp_age = result.getInt("age");
				//temp_isPhoto = result.getInt("isPhoto");
				
				correctUser = true;
			}
			
			if(correctUser){
				
				String select_sql_item = "";
				PreparedStatement sql_item = null;
				
				String select_count = "";
				PreparedStatement sql_count = null;
				ResultSet rs_count;
				select_count = "SELECT COUNT(*) AS count1 FROM User where gender = ? and interestedgender = ? and isPhoto = ? and status = ? and age >= ? and age <= ?";
				
				*/
				/**
				 * 1 - m2w
				 * 2 - f2m
				 * 3 - m2m
				 * 4 - w2w
				 */ 
				/*
				if(gender[0].equals("male") && gender[1].equals("female")){
					
					//get total rows
					sql_count  = con.prepareStatement(select_count, ResultSet.TYPE_SCROLL_INSENSITIVE);
					sql_count.setString(1, "female");
					sql_count.setString(2, "male");
					sql_count.setInt(3, isPhoto);
					sql_count.setString(3, isOnline);
					sql_count.setInt(4, age1);
					sql_count.setInt(5, age2);
					rs_count = sql_count.executeQuery();
					if(rs_count.next())
						totalRows = rs_count.getInt("count1");
							
					
					select_sql_item = "SELECT UserID, Name, Title, Gender, Age, City, State, Status, Photo from User where gender = ? and interestedgender = ? and isPhoto = ? and age >= ? and age <= ? LIMIT "+ limit +" OFFSET " + offset +"";
					
					sql_item  = con.prepareStatement(select_sql_item, ResultSet.TYPE_SCROLL_INSENSITIVE);
					//System.out.println(" 4 " + sql_item);
					
					sql_item.setString(1, "female");
					sql_item.setString(2, "male");
					sql_item.setInt(3, 1);
					sql_item.setInt(4, 24);
					sql_item.setInt(5, 35);
					
				}else if(gender[0].equals("female") && gender[1].equals("male")){
					
					//get total rows
					sql_count  = con.prepareStatement(select_count, ResultSet.TYPE_SCROLL_INSENSITIVE);
					sql_count.setString(1, "male");
					sql_count.setString(2, "female");
					sql_count.setInt(3, 1);
					sql_count.setInt(4, 24);
					sql_count.setInt(5, 35);
					rs_count = sql_count.executeQuery();
					if(rs_count.next())
						totalRows = rs_count.getInt("count1");
					
					
					select_sql_item = "SELECT UserID, Name, Title, Gender, Age, City, State, Status, Photo  from User where gender = ? and interestedgender = ? and isPhoto = ? and age >= ? and age <= ? LIMIT "+ limit +" OFFSET " + offset +"";
					
					sql_item  = con.prepareStatement(select_sql_item, ResultSet.TYPE_SCROLL_INSENSITIVE);
					
					//System.out.println(" 3 " + sql_item);
					
					sql_item.setString(1, "male");
					sql_item.setString(2, "female");
					sql_item.setInt(3, 1);
					sql_item.setInt(4, 24);
					sql_item.setInt(5, 35);
					
				}else if(gender[0].equals("male") && gender[1].equals("male")){
					
					//get total rows
					sql_count  = con.prepareStatement(select_count, ResultSet.TYPE_SCROLL_INSENSITIVE);
					sql_count.setString(1, "male");
					sql_count.setString(2, "male");
					sql_count.setInt(3, 1);
					sql_count.setInt(4, 24);
					sql_count.setInt(5, 35);
					rs_count = sql_count.executeQuery();
					if(rs_count.next())
						totalRows = rs_count.getInt("count1");
					
					
					
					select_sql_item = "SELECT UserID, Name, Title, Gender, Age, City, State, Status, Photo  from User where gender = ? and interestedgender = ? and isPhoto = ? and age >= ? and age <= ? LIMIT "+ limit +" OFFSET " + offset +"";
					
					sql_item  = con.prepareStatement(select_sql_item, ResultSet.TYPE_SCROLL_INSENSITIVE);
					
					sql_item.setString(1, "male");
					sql_item.setString(2, "male");
					sql_item.setInt(3, 1);
					sql_item.setInt(4, 24);
					sql_item.setInt(5, 35);
					
				}else if(gender[0].equals("female") && gender[1].equals("female")){
					
					//get total rows
					sql_count  = con.prepareStatement(select_count, ResultSet.TYPE_SCROLL_INSENSITIVE);
					sql_count.setString(1, "female");
					sql_count.setString(2, "female");
					sql_count.setInt(3, 1);
					sql_count.setInt(4, 24);
					sql_count.setInt(5, 35);
					rs_count = sql_count.executeQuery();
					if(rs_count.next())
						totalRows = rs_count.getInt("count1");
					
					
					
					select_sql_item = "SELECT UserID, Name, Title, Gender, Age, City, State, Status, Photo  from User where gender = ? and interestedgender = ? and isPhoto = ? and age >= ? and age <= ? LIMIT "+ limit +" OFFSET " + offset +"";
					
					sql_item  = con.prepareStatement(select_sql_item, ResultSet.TYPE_SCROLL_INSENSITIVE);
					
					sql_item.setString(1, "female");
					sql_item.setString(2, "female");
					sql_item.setInt(3, 1);
					sql_item.setInt(4, 24);
					sql_item.setInt(5, 35);
					
				}

				ResultSet rs = sql_item.executeQuery();

				List<__User> userList = new ArrayList<__User>();
				boolean isLast = true;


				if(rs.first()){
					rs.beforeFirst();

					while(isLast) {

						if(rs.next()){
							
							__User user = new __User();
							user.setUserID(rs.getInt("UserID"));
							user.setName(rs.getString("Name"));
							user.setGender(rs.getString("Gender"));
							user.setAge(rs.getInt("Age"));
							user.setCity(rs.getString("City"));
							user.setState(rs.getString("State"));
							user.setTitle(rs.getString("title"));
							user.setStatus(rs.getString("Status"));
							user.setProfileImagePath(rs.getString("photo"));
							
							//System.out.println(rs.getInt("UserID") + " " + rs.getString("Name"));
							
							userList.add(user);

						}else if(rs.last()){

							isLast = false;

						}

					}

					//System.out.println("1 "+ iiList.size());
					con.close();
					
					request.setAttribute("table_userList", userList);
					

				}else{
					
					/**
					 * if no item was found in database
					 */
					/*
					__User user = new __User();
					
					userList.add(user);
					
					//System.out.println("2 "+ user.getName());
					
					request.setAttribute("table_userList", userList);

				}
				
				request.setAttribute("name", name);
				request.setAttribute("gender", gender[0]);
				request.setAttribute("imagePath", self_photoPath);
				request.setAttribute("age", temp_age);
				request.setAttribute("limit", dlimit+"");
				//System.out.println("total row: "+totalRows + " / " + dlimit);
				request.setAttribute("offset", offset+"");
				request.setAttribute("type", type); //what kind of search
				
				int looptime = (int) Math.ceil(totalRows / dlimit);
				
				request.setAttribute("loop_times", looptime+"");
				
				
				
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/main.jsp");
				dispatcher.forward(request, response);
				
			}else{
				// if UUID has been updated/changed, the user will be redirected to login
				// or the authentication is failed, the user will be redirected to login page
				response.sendRedirect("login?type=0&email=");
			}

		}  catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("index");
		} catch(java.lang.NullPointerException e){
			e.printStackTrace();
			response.sendRedirect("index");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("index");
		} finally{
			db.setClose();
		}*/

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String name = request.getParameter("name");
		String[] months = request.getParameterValues("month");
		String[] years = request.getParameterValues("year");
		String[] countries = request.getParameterValues("country");
		String postcode = request.getParameter("postcode");
		String password = request.getParameter("password");

		String g1 = request.getParameter("g1");
		String g2 = request.getParameter("g2");
		String email = request.getParameter("email");

		String month = "";
		String year = "";
		String country = "";

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();
		java.util.Date today = new java.util.Date();

		boolean isEmailExist = false;

		try {

			for(String m : months)
				month = m;

			for(String y : years)
				year = y;

			for(String c : countries)
				country = c;



			//System.out.println(name + " " + month + " " + year + " " + country + " " + postcode + " " + password + " " + g1 + " " + g2 + " " + email);

			PreparedStatement sql_check_email = con.prepareStatement("select email from user where email = ?");
			sql_check_email.setString(1, email);

			ResultSet result = sql_check_email.executeQuery();

			if (result.next())
				isEmailExist = true;

			if(isEmailExist){
				
				response.sendRedirect("login?type=1&email=" + email); 
				
			}else{

				__ZipLocation geo = new __ZipLocation(postcode, country);
				
				// insert new user information
				PreparedStatement sql_register_user = con.prepareStatement("insert into hunyin.user(Name, Month, Year, Age, Country, Postcode, Password, Gender, InterestedGender, Email, Role, CreatedDate, City, State) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				sql_register_user.setString(1, name);
				sql_register_user.setString(2, month);
				sql_register_user.setString(3, year);
				
				LocalDate birthdate = new LocalDate (Integer.parseInt(year), Integer.parseInt(month), 1);
				LocalDate now = new LocalDate();
				Years age = Years.yearsBetween(birthdate, now);
				
				sql_register_user.setInt(4, age.getYears());
				sql_register_user.setString(5, country);
				sql_register_user.setString(6, postcode);
				String en_pwd = EncryptionBytes.toBaoMi(PASS_SECRET_KEY, password);
				sql_register_user.setString(7, en_pwd);
				sql_register_user.setString(8, g1);
				sql_register_user.setString(9, g2);
				sql_register_user.setString(10, email);
				sql_register_user.setString(11, "unconfirmedEmail");
				sql_register_user.setTimestamp(12, new java.sql.Timestamp(today.getTime()));
				sql_register_user.setString(13, geo.getCity());
				sql_register_user.setString(14, geo.getState());

				sql_register_user.executeUpdate();
				
				
				//generate a random password
				Random rnd = new Random();
				int random_pass = 100000 + rnd.nextInt(900000);
				
				// send email verification
				String update_sql = "update user set VerificationEmailCode = ? where Email = ?";

				PreparedStatement update_user_sql = con.prepareStatement(update_sql);
				update_user_sql.setString(1, random_pass+"");
				update_user_sql.setString(2, email);

				update_user_sql.executeUpdate();

				String host = "smtp.gmail.com";
				String from = "lov4egg";
				String pass = "move4Faregg";
				Properties props = System.getProperties();
				props.put("mail.smtp.starttls.enable", "true"); // added this line
				props.put("mail.smtp.host", host);
				props.put("mail.smtp.user", from);
				props.put("mail.smtp.password", pass);
				props.put("mail.smtp.port", "587");
				props.put("mail.smtp.auth", "true");

				String[] to = {"lov4egg@gmail.com"}; // added this line

				Session session = Session.getDefaultInstance(props, null);
				MimeMessage message = new MimeMessage(session);


				message.setFrom(new InternetAddress(from));
				message.setHeader("Content-Type", "text/html; charset=utf-8");

				InternetAddress[] toAddress = new InternetAddress[to.length];

				// To get the array of addresses
				for( int i=0; i < to.length; i++ ) { // changed from a while loop
					toAddress[i] = new InternetAddress(to[i]);
				}
				//System.out.println(Message.RecipientType.TO);

				for( int i=0; i < toAddress.length; i++) { // changed from a while loop
					message.addRecipient(Message.RecipientType.TO, toAddress[i]);
				}
				message.setSubject("\u7535\u5B50\u90AE\u4EF6\u5730\u5740\u9A8C\u8BC1\u7A0B\u5E8F - \u7231\u5728\u0035\u0032\u0030", "utf-8");
				message.setContent("<html><body><head></head>\u4F60\u597D, "+name+"<br /><br />\u6B22\u8FCE\u4F60\u52A0\u5165\u7231\u5728\u0035\u0032\u0030\u5A5A\u59FB\u4EA4\u53CB\u7F51<br /><br />\u4F60\u7684\u7535\u5B50\u90AE\u4EF6\u9A8C\u8BC1\u7801 <b><span style=\"color: #D35858; font-size: 18px;\">"+ random_pass +"</span></b><br /><br /><small>\u7231\u5728\u0035\u0032\u0030\u5A5A\u59FB\u4EA4\u53CB\u7F51</small></body></html>","text/html; charset=utf-8");
				Transport transport = session.getTransport("smtp");
				transport.connect(host, from, pass);
				transport.sendMessage(message, message.getAllRecipients());
				transport.close();
				
				response.sendRedirect("email_verification?type=0&name=" + URLEncoder.encode(name, "utf-8") + "&g1=" + g1 + "&g2=" + g2 + "&email=" + email);

			}

		} catch (AddressException e) {
			// TODO Auto-generated catch block
			response.sendRedirect("index");
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			response.sendRedirect("index");
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

}
