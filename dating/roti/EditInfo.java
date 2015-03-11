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
 * Servlet implementation class EditInfo
 */
@WebServlet(name="EditInfo", urlPatterns={"/zhs/info"})
public class EditInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();

		boolean correctUser = false;
		int temp_userID = -1;

		try{

			___Session session = new ___Session(request);
			//String sname = session.getUsername();
			String uuid = session.getUUID();
			String email = session.getEmail();
			String sstatus = session.getStatus();
			//String role = session.getRole();

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

				HttpServletRequest r = retriveUserBasic(con, request, temp_userID);

				r.setAttribute("success_update", "false");
				r.setAttribute("which_section", "basic");

				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/info.jsp");
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

		// s - section
		String section = request.getParameter("s");

		___Session session = new ___Session(request);
		String sname = session.getUsername();
		String uuid = session.getUUID();
		String email = session.getEmail();
		String sstatus = session.getStatus();
		String role = session.getRole();

		___IniDB db = new ___IniDB();
		Connection con = db.getConnection();

		boolean correctUser = false;
		int temp_userID = -1;

		try{

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

				/**
				 * 1 - update user basic information
				 * 2 - update user job information
				 * 3 - update user education level
				 * 4 - update user interests
				 * 5 - update your target preferences
				 * 
				 */

				if(section.equals("basic")){

					String name = request.getParameter("name");
					String title = request.getParameter("title");
					String desc = request.getParameter("self_desc");
					String[] statuses = request.getParameterValues("status");
					String[] tgenders = request.getParameterValues("target_gender");
					String height = request.getParameter("height");
					String weight = request.getParameter("weight");
					String[] nationalities = request.getParameterValues("nationality");
					String race = request.getParameter("race");
					String religion = request.getParameter("religion");
					String[] bloodtypes = request.getParameterValues("bloodtype");
					String[] signs = request.getParameterValues("sign");
					String language = request.getParameter("language");
					String city = request.getParameter("location_city");
					String state = request.getParameter("location_state");
					String postcode = request.getParameter("postcode");
					String[] countries = request.getParameterValues("country");
					String hometown = request.getParameter("hometown");


					String status = "";
					String tgender = "";
					String nationality = "";
					String bloodtype = "";
					String sign = "";
					String country = "";

					for(String s: statuses)
						status = s;

					for(String tg: tgenders)
						tgender = tg;

					for(String n : nationalities)
						nationality = n;

					for(String b: bloodtypes)
						bloodtype = b;

					for(String s: signs)
						sign = s;

					for(String c: countries)
						country = c;

					String sgenders = session.getGenders();
					String[] sgender = sgenders.split("@");

					/**
					 * update session - username
					 * update session - target_gender
					 */
					session.setUsername(name);
					session.setTargetGender(sgender[0], tgender);

					//update user table
					String update_sql = "update user set name = ?, title = ?, description = ?, interestedgender = ?, city = ?, state = ?, country = ?, postcode = ? where userid = ?";

					PreparedStatement update_user_sql = con.prepareStatement(update_sql);
					update_user_sql.setString(1, name);
					update_user_sql.setString(2, title);
					update_user_sql.setString(3, desc);
					update_user_sql.setString(4, tgender);
					update_user_sql.setString(5, city);
					update_user_sql.setString(6, state);
					update_user_sql.setString(7, country);
					update_user_sql.setString(8, postcode);
					update_user_sql.setInt(9, temp_userID);

					update_user_sql.executeUpdate();



					//update userabout table
					String update_sql_1 = "update userabout set status = ?, height = ?, weight = ?, nationality = ?, race = ?, religion = ?, bloodtype = ?, astrology = ?, language = ?, hometown = ? where userid = ?";

					PreparedStatement update_userabout_sql = con.prepareStatement(update_sql_1);
					update_userabout_sql.setInt(1, Integer.parseInt(status));
					update_userabout_sql.setDouble(2, Double.parseDouble(height));
					update_userabout_sql.setDouble(3, Double.parseDouble(weight));
					update_userabout_sql.setString(4, nationality);
					update_userabout_sql.setString(5, race);
					update_userabout_sql.setString(6, religion);
					update_userabout_sql.setString(7, bloodtype);
					update_userabout_sql.setString(8, sign);
					update_userabout_sql.setString(9, language);
					update_userabout_sql.setString(10, hometown);
					update_userabout_sql.setInt(11, temp_userID);

					update_userabout_sql.executeUpdate();



				}else if(section.equals("job")){

					String[] professions = request.getParameterValues("profession");

					String profession = "";
					String profession_etc = "";

					for(String p : professions)
						profession = p;

					if(profession.equals("etc"))
						profession_etc = request.getParameter("profession_other");

					//update userabout table
					String update_sql = "update userabout set profession = ?, profession_etc = ? where userid = ?";

					PreparedStatement update_userabout_sql = con.prepareStatement(update_sql);
					update_userabout_sql.setString(1, profession);
					update_userabout_sql.setString(2, profession_etc);
					update_userabout_sql.setInt(3, temp_userID);

					update_userabout_sql.executeUpdate();



				}else if(section.equals("education")){

					int totalCols = 0;

					String[] edulevels = request.getParameterValues("educationlevel");
					String highsch = request.getParameter("highschool");
					String c1 = request.getParameter("c1");
					String m1 = request.getParameter("m1");
					String[] d1s = request.getParameterValues("d1");
					String c2 = request.getParameter("c2");
					String m2 = request.getParameter("m2");
					String[] d2s = request.getParameterValues("d2");
					String c3 = request.getParameter("c3");
					String m3 = request.getParameter("m3");
					String[] d3s = request.getParameterValues("d3");
					String c4 = request.getParameter("c4");
					String m4 = request.getParameter("m4");
					String[] d4s = request.getParameterValues("d4");
					String c5 = request.getParameter("c5");
					String m5 = request.getParameter("m5");
					String[] d5s = request.getParameterValues("d5");

					String edulevel = "";
					String d1 = "", d2 = "", d3 = "", d4 = "", d5 = "";

					for(String e: edulevels)
						edulevel = e;

					for(String a: d1s)
						d1 = a;

					for(String a: d2s)
						d2 = a;

					for(String a: d3s)
						d3 = a;

					for(String a: d4s)
						d4 = a;

					for(String a: d5s)
						d5 = a;

					if(!c1.equals("")){
						totalCols++;	
					}else{
						//reset all fields since college/university field is empty
						c1 = "";
						m1 = "";
						d1 = "";
					}

					if(!c2.equals("")){
						totalCols++;	
					}else{
						//reset all fields since college/university field is empty
						c2 = "";
						m2 = "";
						d2 = "";
					}

					if(!c3.equals("")){
						totalCols++;	
					}else{
						//reset all fields since college/university field is empty
						c3 = "";
						m3 = "";
						d3 = "";
					}

					if(!c4.equals("")){
						totalCols++;	
					}else{
						//reset all fields since college/university field is empty
						c4 = "";
						m4 = "";
						d4 = "";
					}

					if(!c5.equals("")){
						totalCols++;	
					}else{
						//reset all fields since college/university field is empty
						c5 = "";
						m5 = "";
						d5 = "";
					}

					//update userabout table
					String update_sql = "update userabout set educationlevel = ?, highschool = ?, college1 = ?, major1 = ?, degree1 = ?, college2 = ?, major2 = ?, degree2 = ?, college3 = ?, major3 = ?, degree3 = ?, college4 = ?, major4 = ?, degree4 = ?, college5 = ?, major5 = ?, degree5 = ?, TotalColleges = ? where userid = ?";

					PreparedStatement update_userabout_sql = con.prepareStatement(update_sql);
					update_userabout_sql.setString(1, edulevel);
					update_userabout_sql.setString(2, highsch);
					update_userabout_sql.setString(3, c1);
					update_userabout_sql.setString(4, m1);
					update_userabout_sql.setString(5, d1);
					update_userabout_sql.setString(6, c2);
					update_userabout_sql.setString(7, m2);
					update_userabout_sql.setString(8, d2);
					update_userabout_sql.setString(9, c3);
					update_userabout_sql.setString(10, m3);
					update_userabout_sql.setString(11, d3);
					update_userabout_sql.setString(12, c4);
					update_userabout_sql.setString(13, m4);
					update_userabout_sql.setString(14, d4);
					update_userabout_sql.setString(15, c5);
					update_userabout_sql.setString(16, m5);
					update_userabout_sql.setString(17, d5);
					update_userabout_sql.setInt(18, totalCols);
					update_userabout_sql.setInt(19, temp_userID);

					update_userabout_sql.executeUpdate();



				}else if(section.equals("interest")){

					String interests = request.getParameter("interests");

					//update userabout table
					String update_sql = "update userabout set Interest = ? where userid = ?";

					PreparedStatement update_userabout_sql = con.prepareStatement(update_sql);
					update_userabout_sql.setString(1, interests);
					update_userabout_sql.setInt(2, temp_userID);

					update_userabout_sql.executeUpdate();

				}else if(section.equals("t_preferences")){

					String[] tsizes = request.getParameterValues("t_size");
					String minheight = request.getParameter("t_minheight");
					String[] tages1 = request.getParameterValues("t_age1");
					String[] tages2 = request.getParameterValues("t_age2");
					String[] tedus = request.getParameterValues("t_edu");
					String[] tpros = request.getParameterValues("t_profession");
					String tdesc = request.getParameter("t_desc");

					String tsize = "0";
					String tage1 = "0";
					String tage2 = "0";
					String tedu = "";
					String tpro = "";
					String tpro_etc = "";

					for(String a: tsizes)
						tsize = a;


					for(String a: tages1)
						tage1 = a;

					for(String a: tages2)
						tage2 = a;

					for(String a: tedus)
						tedu = a;

					for(String a: tpros)
						tpro = a;

					if(tpro.equals("etc"))
						tpro_etc = request.getParameter("profession_other");


					//update userabout table
					String update_sql = "update userabout set t_size = ?, t_minheight = ?, t_minage = ?, t_maxage = ?, t_educationlevel = ?, t_profession = ?, t_profession_etc = ?, t_description = ? where userid = ?";

					PreparedStatement update_userabout_sql = con.prepareStatement(update_sql);
					update_userabout_sql.setInt(1, Integer.parseInt(tsize));
					update_userabout_sql.setDouble(2, Double.parseDouble(minheight));
					update_userabout_sql.setInt(3, Integer.parseInt(tage1));
					update_userabout_sql.setInt(4, Integer.parseInt(tage2));
					update_userabout_sql.setString(5,tedu);
					update_userabout_sql.setString(6,tpro);
					update_userabout_sql.setString(7,tpro_etc);
					update_userabout_sql.setString(8, tdesc);
					update_userabout_sql.setInt(9, temp_userID);

					update_userabout_sql.executeUpdate();


				}


				HttpServletRequest r = retriveUserBasic(con, request, temp_userID);

				r.setAttribute("success_update", "true");
				r.setAttribute("which_section", section);

				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/zhs/info.jsp");
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


	private HttpServletRequest retriveUserBasic(Connection con, HttpServletRequest request, int userid) throws SQLException{

		__User user = new __User();
		__UserAbout ab = new __UserAbout();

		PreparedStatement sql_user_account = con.prepareStatement("select name, title, description, InterestedGender, city, state, postcode, country, photo from user where userid = ?");
		sql_user_account.setInt(1, userid);

		ResultSet r = sql_user_account.executeQuery();

		if (r.next()){

			user.setName(r.getString("name"));
			user.setTitle((r.getString("title") != null) ? r.getString("title") : "");
			user.setDesc((r.getString("description") != null) ? r.getString("description") : "");
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
			ab.setLanguage(a.getString("language"));
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
			ab.setInterests(a.getString("interest"));
			ab.setTotalColleges(a.getInt("totalcolleges"));
			ab.setTSize(a.getInt("t_size"));
			ab.setTMinHeight(a.getDouble("t_minheight"));
			ab.setTMinAge(a.getInt("t_minage"));
			ab.setTMaxAge(a.getInt("t_maxage"));
			ab.setTEduLevel(a.getString("t_educationlevel"));
			ab.setTProfession(a.getString("t_profession"));
			ab.setTProfessionETC((a.getString("t_profession_etc") != null) ? a.getString("t_profession_etc") : "");
			ab.setTDesc((a.getString("t_description") != null) ? a.getString("t_description") : "");

		}

		ab.setUser(user);

		request.setAttribute("userabout", ab);

		return request;
	}

}
