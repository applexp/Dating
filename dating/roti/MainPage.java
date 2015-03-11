package roti;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
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

/**
 * Servlet implementation class MainPage
 */
@WebServlet("/zhs/main")
public class MainPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MainPage() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//request.setCharacterEncoding("UTF-8");

		int loop1Time = -1;

		String type = request.getParameter("type");
		int isPhoto = 1; //default value
		int age1 = 24; //default value
		int age2 = 35; //default value
		String isOnline = "zaixian"; //default value
		String state = "0"; //default value
		String country = "0"; //default value
		String sname = ""; //default value
		String sdesc = ""; //default value

		int limit = 20; // from a
		double dlimit = 20.0;
		int totalRows = 0;
		String offset = request. getParameter("z"); // to z
		//int sql_type = -1;
		//String yourGender = "";

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();
		String select_sql_item = "";
		String select_count = "";

		String state_sql = "", country_sql = "", name_sql = "", title_sql = "";

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
			 * Determined by search, for example, when a user click a submit button, it means 1, otherwise 0
			 * 0 - default
			 * 1 - define by user
			 */
			if(type.equals("0")){

				loop1Time = 1;

				genders = s.getGenders();
				gender = genders.split("@");

				select_count = "SELECT COUNT(*) AS count1 FROM user where gender = ? and interestedgender = ? and isPhoto = ? and status = ? and age >= ? and age <= ? and ((country IS NULL) OR (country = country)) and ((state IS NULL) OR (state = state)) and Name = name and ((title IS NULL) OR (title = title))";
				select_sql_item = "SELECT UserID, Name, Title, Gender, Age, City, State, Status, Photo from user where gender = ? and interestedgender = ? and isPhoto = ? and status = ? and age >= ? and age <= ? and ((country IS NULL) OR (country = country)) and ((state IS NULL) OR (state = state)) and Name = name and ((title IS NULL) OR (title = title)) LIMIT "+ limit +" OFFSET " + offset +"";

				//System.out.println("0: "+ select_sql_item);

				request.setAttribute("extra_link_detail", "");

			}else if(type.equals("1")){

				loop1Time = Integer.parseInt(request.getParameter("l"));

				isPhoto = Integer.parseInt(request.getParameter("ip"));
				isOnline = request.getParameter("io");
				age1 = Integer.parseInt(request.getParameter("a1"));
				age2 = Integer.parseInt(request.getParameter("a2"));
				state = request.getParameter("state");
				country = request.getParameter("country");
				sname = request.getParameter("sname");
				sname = new String(sname.getBytes("ISO-8859-1"), "UTF-8");
				sdesc = request.getParameter("sdesc");
				sdesc = new String(sdesc.getBytes("ISO-8859-1"), "UTF-8");
				gender[0] = request.getParameter("g1");
				gender[1] = request.getParameter("g2");

				if(state.equals("0"))
					state_sql = "((state IS NULL) OR (state = state))";
				else
					state_sql = "state = \"" + state + "\"";

				if(country.equals("0"))
					country_sql = "((country IS NULL) OR (country = country))";
				else
					country_sql = "country = \"" + country + "\"";

				if(sname.equals("nnnn"))
					name_sql = "Name = Name";
				else
					name_sql = "name = \"" + sname + "\"";

				if(sdesc.equals("nnnn"))
					title_sql = "((title IS NULL) OR (title = title))";
				else
					title_sql = "title = \"" + sdesc + "\"";

				select_count = "SELECT COUNT(*) AS count1 FROM User where gender = ? and interestedgender = ? and isPhoto = ? and status = ? and age >= ? and age <= ? and " + country_sql + " and " + state_sql + " and " + name_sql + " and " + title_sql +"";
				select_sql_item = "SELECT UserID, Name, Title, Gender, Age, City, State, Status, Photo from User where gender = ? and interestedgender = ? and isPhoto = ? and status = ? and age >= ? and age <= ? and " + country_sql + " and " + state_sql + " and " + name_sql + " and " + title_sql + " LIMIT "+ limit +" OFFSET " + offset +"";

				if(loop1Time == 1){

					String extra_link_detail = "&ip=" + isPhoto + "&io=" + isOnline + "&a1=" + age1 + "&a2=" + age2 + "&state=" + state + "&country=" + country + "&g1=" + gender[0] + "&g2=" + gender[1] +"&sname=" + sname + "&sdesc=" + sdesc +"&l=1";
					request.setAttribute("extra_link_detail", extra_link_detail);

				}


			}





			String self_photoPath = "#";

			boolean correctUser = false;

			//System.out.println("00 " + name + " " + uuid + " " + email + " " + status + " " + role + " " + gender[0] + " " + gender[1]);

			PreparedStatement sql_user_account = con.prepareStatement("select photo, email from user where email = ? and UUID = ? and status = ?");
			sql_user_account.setString(1, email);
			sql_user_account.setString(2, uuid);
			sql_user_account.setString(3, status);

			ResultSet result = sql_user_account.executeQuery();

			if (result.next()){
				self_photoPath = result.getString("photo");
				
				if(email.equals(result.getString("email")))
					correctUser = true;
			}

			if(correctUser){


				if(loop1Time == 1){

					PreparedStatement sql_item = null;


					PreparedStatement sql_count = null;
					ResultSet rs_count;


					/**
					 * 1 - m2w
					 * 2 - f2m
					 * 3 - m2m
					 * 4 - w2w
					 */ 

					if(gender[0].equals("male") && gender[1].equals("female")){

						//get total rows
						sql_count  = con.prepareStatement(select_count, ResultSet.TYPE_SCROLL_INSENSITIVE);
						sql_count.setString(1, "female");
						sql_count.setString(2, "male");
						sql_count.setInt(3, isPhoto);
						sql_count.setString(4, isOnline);
						sql_count.setInt(5, age1);
						sql_count.setInt(6, age2);
						rs_count = sql_count.executeQuery();
						if(rs_count.next())
							totalRows = rs_count.getInt("count1");
						
						
						sql_item  = con.prepareStatement(select_sql_item, ResultSet.TYPE_SCROLL_INSENSITIVE);
						//System.out.println(" 4 " + sql_item);

						sql_item.setString(1, "female");
						sql_item.setString(2, "male");
						sql_item.setInt(3, isPhoto);
						sql_item.setString(4, isOnline);
						sql_item.setInt(5, age1);
						sql_item.setInt(6, age2);

					}else if(gender[0].equals("female") && gender[1].equals("male")){

						//get total rows
						sql_count  = con.prepareStatement(select_count, ResultSet.TYPE_SCROLL_INSENSITIVE);
						sql_count.setString(1, "male");
						sql_count.setString(2, "female");
						sql_count.setInt(3, isPhoto);
						sql_count.setString(4, isOnline);
						sql_count.setInt(5, age1);
						sql_count.setInt(6, age2);
						rs_count = sql_count.executeQuery();
						if(rs_count.next())
							totalRows = rs_count.getInt("count1");
						System.out.println("total: " + totalRows);

						//select_sql_item = "SELECT UserID, Name, Title, Gender, Age, City, State, Status, Photo  from User where gender = ? and interestedgender = ? and isPhoto = ? and age >= ? and age <= ? LIMIT "+ limit +" OFFSET " + offset +"";

						sql_item  = con.prepareStatement(select_sql_item, ResultSet.TYPE_SCROLL_INSENSITIVE);

						//System.out.println(" 3 " + sql_item);

						sql_item.setString(1, "male");
						sql_item.setString(2, "female");
						sql_item.setInt(3, isPhoto);
						sql_item.setString(4, isOnline);
						sql_item.setInt(5, age1);
						sql_item.setInt(6, age2);

					}else if(gender[0].equals("male") && gender[1].equals("male")){

						//get total rows
						sql_count  = con.prepareStatement(select_count, ResultSet.TYPE_SCROLL_INSENSITIVE);
						sql_count.setString(1, "male");
						sql_count.setString(2, "male");
						sql_count.setInt(3, isPhoto);
						sql_count.setString(4, isOnline);
						sql_count.setInt(5, age1);
						sql_count.setInt(6, age2);
						rs_count = sql_count.executeQuery();
						if(rs_count.next())
							totalRows = rs_count.getInt("count1");



						//select_sql_item = "SELECT UserID, Name, Title, Gender, Age, City, State, Status, Photo  from User where gender = ? and interestedgender = ? and isPhoto = ? and age >= ? and age <= ? LIMIT "+ limit +" OFFSET " + offset +"";

						sql_item  = con.prepareStatement(select_sql_item, ResultSet.TYPE_SCROLL_INSENSITIVE);

						sql_item.setString(1, "male");
						sql_item.setString(2, "male");
						sql_item.setInt(3, isPhoto);
						sql_item.setString(4, isOnline);
						sql_item.setInt(5, age1);
						sql_item.setInt(6, age2);

					}else if(gender[0].equals("female") && gender[1].equals("female")){

						//get total rows
						sql_count  = con.prepareStatement(select_count, ResultSet.TYPE_SCROLL_INSENSITIVE);
						sql_count.setString(1, "female");
						sql_count.setString(2, "female");
						sql_count.setInt(3, isPhoto);
						sql_count.setString(4, isOnline);
						sql_count.setInt(5, age1);
						sql_count.setInt(6, age2);
						rs_count = sql_count.executeQuery();
						if(rs_count.next())
							totalRows = rs_count.getInt("count1");



						//select_sql_item = "SELECT UserID, Name, Title, Gender, Age, City, State, Status, Photo  from User where gender = ? and interestedgender = ? and isPhoto = ? and age >= ? and age <= ? LIMIT "+ limit +" OFFSET " + offset +"";

						sql_item  = con.prepareStatement(select_sql_item, ResultSet.TYPE_SCROLL_INSENSITIVE);

						sql_item.setString(1, "female");
						sql_item.setString(2, "female");
						sql_item.setInt(3, isPhoto);
						sql_item.setString(4, isOnline);
						sql_item.setInt(5, age1);
						sql_item.setInt(6, age2);

					}

					List<__User> userList = new ArrayList<__User>();


					//String extra_link_detail1 = "&ip=" + isPhoto + "&io=" + isOnline + "&a1=" + age1 + "&a2=" + age2 + "&state=" + state + "&country=" + country + "&g1=" + gender[0] + "&g2=" + gender[1] +"&sname=" + sname + "&sdesc=" + sdesc +"&l=2";
					//System.out.println("test 0 " + extra_link_detail1);
					//System.out.println("test 0 ");

					ResultSet rs = sql_item.executeQuery();


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

						request.setAttribute("table_userList", userList);

						request.setAttribute("limit", dlimit+"");
						request.setAttribute("offset", offset+"");
						request.setAttribute("type", type); //what kind of search

						int looptime = (int) Math.ceil(totalRows / dlimit);
						request.setAttribute("loop_times", looptime+"");

						request.setAttribute("name", name);
						request.setAttribute("imagePath", self_photoPath);

						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/main.jsp");
						dispatcher.forward(request, response);

						//String extra_link_detail = "&ip=" + isPhoto + "&io=" + isOnline + "&a1=" + age1 + "&a2=" + age2 + "&state=" + state + "&country=" + country + "&g1=" + gender[0] + "&g2=" + gender[1] +"&sname=" + sname + "&sdesc=" + sdesc +"&l=2";
						//System.out.println("test 1" + extra_link_detail);
						//System.out.println("test 1 ");

					}else{
						//if not found
						response.sendRedirect("main?z=0&type=1&ip=" + isPhoto + "&io=" + isOnline + "&a1=" + age1 + "&a2=" + age2 + "&state=" + state + "&country=" + country + "&g1=" + gender[0] + "&g2=" + gender[1] +"&sname=" + sname + "&sdesc=" + sdesc +"&l=2");
					}

				}else if(loop1Time == 2){

					/**
					 * same with above, but loop1Time is 2
					 * prevent loop many times
					 */

					List<__User> userList = new ArrayList<__User>();
					
					__User user = new __User();
					user.setUserID(-1);
					user.setName("");
					user.setGender("");
					user.setAge(0);
					user.setCity("");
					user.setState("");
					user.setTitle("");
					user.setStatus("");
					user.setProfileImagePath("#");

					userList.add(user);

					request.setAttribute("table_userList", userList);

					request.setAttribute("limit", dlimit+"");
					request.setAttribute("offset", offset+"");
					request.setAttribute("type", type); //what kind of search
					request.setAttribute("loop_times", "0");

					String extra_link_detail = "&ip=" + isPhoto + "&io=" + isOnline + "&a1=" + age1 + "&a2=" + age2 + "&state=" + state + "&country=" + country + "&g1=" + gender[0] + "&g2=" + gender[1] +"&sname=" + sname + "&sdesc=" + sdesc +"&l=2";
					//request.setAttribute("extra_link_detail", extra_link_detail);
					//					
					//System.out.println("test 2 " + extra_link_detail);
					//System.out.println("test 2 ");

					request.setAttribute("name", name);
					request.setAttribute("imagePath", self_photoPath);

					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/main.jsp");
					dispatcher.forward(request, response);
				}



			}else{
				// if UUID has been updated/changed, the user will be redirected to login
				// or the authentication is failed, the user will be redirected to login page
				response.sendRedirect("login?type=0&email=");
			}

		}  catch (SQLException e) {
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

		String[] t_genders = request.getParameterValues("gender");
		String[] ages1 = request.getParameterValues("age");
		String[] ages2 = request.getParameterValues("age1");
		String[] pictures = request.getParameterValues("picture");
		String[] onlines = request.getParameterValues("isOnline");
		String[] countries = request.getParameterValues("country");
		String[] states = request.getParameterValues("state");
		String name = request.getParameter("name");
		String desc = request.getParameter("desc");

		if(name.equals(""))
			name = "nnnn";

		if(desc.equals(""))
			desc = "nnnn";

		String gender = "";
		String g1="", g2="";
		int age1 = 24;
		int age2 = 35;
		int isPhoto = 0;
		String online = "xiaxian";
		String country = "noValue";
		String state = "noValue";

		for(String g : t_genders)
			gender = g;

		for(String a1 : ages1)
			age1 = Integer.parseInt(a1);

		for(String a2 : ages2)
			age2 = Integer.parseInt(a2);

		if(pictures != null){	
			for(String pic : pictures)
				isPhoto = Integer.parseInt(pic);
		}

		if(onlines != null){	
			for(String on9 : onlines)
				online = on9;
		}

		for(String c : countries)
			country = c;

		for(String s : states)
			state = s;

		if(gender.equals("m2w")){
			g1 = "male";
			g2 = "female";
		}else if(gender.equals("w2m")){
			g1 = "female";
			g2 = "male";
		}else if(gender.equals("m2m")){
			g1 = "male";
			g2 = "male";
		}else if(gender.equals("w2w")){
			g1 = "female";
			g2 = "female";
		}
		
		if(age1 == 0)
			age1 = 18;
		
		if(age2 == 0)
			age2 = 75;

		//System.out.println("tes111t");

		response.sendRedirect("main?z=0&type=1&ip=" + isPhoto + "&io=" + online + "&a1=" + age1 + "&a2=" + age2 + "&state=" + state + "&country=" + country + "&g1=" + g1 + "&g2=" + g2 +"&sname=" + URLEncoder.encode(name, "utf-8") + "&sdesc=" + URLEncoder.encode(desc, "utf-8") +"&l=1");


	}

}
