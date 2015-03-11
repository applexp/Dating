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

/**
 * Servlet implementation class Profile
 */
@WebServlet(name="Profile", urlPatterns={"/zhs/profile"})
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Profile() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id = -1;
		String sid = request.getParameter("id");

		if(sid == null || sid.equals(""))
			sid = "-1";

		id = Integer.parseInt(sid);

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();

		boolean correctUser = false;
		int temp_userID = -1;
		HttpServletRequest r = null;

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
					correctUser = true;
				}
			}

			if(correctUser){

				/**
				 * 0 - view user's profile
				 * else - view your own profile
				 * 
				 */
				if(id >= 0){

					//temp_userID = result.getInt("userid");
					r = retriveUserBasic(con, request, id);
					r.setAttribute("yourprofile", "false");

				}else{

					temp_userID = result.getInt("userid");
					r = retriveUserBasic(con, request, temp_userID);
					r.setAttribute("yourprofile", "true");

				}

				r.setAttribute("yourid", temp_userID);
				r.setAttribute("loverid", id);
				
				System.out.println("profile 1");
				
				
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/profile.jsp");
				dispatcher.forward(r, response);
			}else
				response.sendRedirect("login?type=0&email=");



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
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/profile.jsp");
		dispatcher.forward(request, response);
	}


	private HttpServletRequest retriveUserBasic(Connection con, HttpServletRequest request, int userid) throws SQLException{

		__User user = new __User();
		__UserAbout ab = new __UserAbout();

		PreparedStatement sql_user_account = con.prepareStatement("select name, title, description, age, gender, InterestedGender, city, state, postcode, country, photo from user where userid = ?");
		sql_user_account.setInt(1, userid);

		ResultSet r = sql_user_account.executeQuery();

		if (r.next()){

			user.setName(r.getString("name"));
			user.setTitle((r.getString("title") != null) ? r.getString("title") : "");
			user.setDesc((r.getString("description") != null) ? r.getString("description").replaceAll("(\r\n|\n)", "<br />") : "");
			user.setAge(r.getInt("age"));
			user.setGender(r.getString("gender"));
			user.setTGender(r.getString("InterestedGender"));
			user.setCity(r.getString("city"));
			user.setState(r.getString("state"));
			user.setPostcode(r.getString("postcode"));
			user.setCountry(r.getString("country"));
			user.setProfileImagePath(r.getString("photo"));
		}

		PreparedStatement sql_userbasic_account = con.prepareStatement("select * from userabout where userid = ?");
		sql_userbasic_account.setInt(1, userid);

		ResultSet a = sql_userbasic_account.executeQuery();

		if (a.next()){

			ab.setStatus(a.getInt("status"));
			ab.setH(a.getDouble("height"));
			ab.setW(a.getDouble("weight"));
			ab.setNationality(a.getString("nationality"));
			ab.setRace((a.getString("race") != null) ? a.getString("race") : "");
			ab.setReligion((a.getString("religion") != null) ? a.getString("religion") : "");
			ab.setBloodType(a.getString("bloodtype"));
			ab.setSign(a.getString("astrology"));
			ab.setLanguage((a.getString("language") != null) ? a.getString("language").replaceAll(",", ",\\&nbsp;\\&nbsp;") : "");
			ab.setHometown((a.getString("hometown") != null) ? a.getString("hometown") : "");
			ab.setProfession(a.getString("profession"));
			ab.setProfessionETC((a.getString("profession_etc") != null) ? a.getString("profession_etc") : "");
			ab.setEducationLevel(a.getString("educationlevel"));
			ab.setHighSchool((a.getString("highschool") != null) ? a.getString("highschool") : "");
			ab.setCol1((a.getString("college1") != null) ? a.getString("college1") : "");
			ab.setMaj1((a.getString("major1") != null) ? a.getString("major1") : "");
			ab.setDeg1(a.getString("degree1"));
			ab.setCol2((a.getString("college2") != null) ? a.getString("college2") : "");
			ab.setMaj2((a.getString("major2") != null) ? a.getString("major2") : "");
			ab.setDeg2(a.getString("degree2"));
			ab.setCol3((a.getString("college3") != null) ? a.getString("college3") : "");
			ab.setMaj3((a.getString("major3") != null) ? a.getString("major3") : "");
			ab.setDeg3(a.getString("degree3"));
			ab.setCol4((a.getString("college4") != null) ? a.getString("college4") : "");
			ab.setMaj4((a.getString("major4") != null) ? a.getString("major4") : "");
			ab.setDeg4(a.getString("degree4"));
			ab.setCol5((a.getString("college5") != null) ? a.getString("college5") : "");
			ab.setMaj5((a.getString("major5") != null) ? a.getString("major5") : "");
			ab.setDeg5(a.getString("degree5"));
			ab.setInterests((a.getString("interest") != null) ? a.getString("interest").replaceAll(",", ",  ") : "");
			ab.setTotalColleges(a.getInt("totalcolleges"));
			ab.setTSize(a.getInt("t_size"));
			ab.setTMinHeight(a.getDouble("t_minheight"));
			ab.setTMinAge(a.getInt("t_minage"));
			ab.setTMaxAge(a.getInt("t_maxage"));
			ab.setTEduLevel(a.getString("t_educationlevel"));
			ab.setTProfession(a.getString("t_profession"));
			ab.setTProfessionETC((a.getString("t_profession_etc") != null) ? a.getString("t_profession_etc") : "");
			ab.setTDesc((a.getString("t_description") != null) ? a.getString("t_description").replaceAll("(\r\n|\n)", "<br />") : "");

		}

		ab.setUser(user);

		request.setAttribute("userabout", ab);

		return request;
	}

}
