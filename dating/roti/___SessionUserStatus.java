package roti;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author JJ
 * Get the user role id
 *
 */
public class ___SessionUserStatus {

	private HttpServletRequest request;
	private ___Session s;

	private HttpSession session;
	
	public ___SessionUserStatus(HttpServletRequest r, ___Session s){
		request = r;
		this.s = s;
	}

	public HttpServletRequest getUpdateRequest(){

		/**
		 * 0 - no login yet
		 * 1 - admin status
		 * 2 - login user
		 * 
		 */

			if(s.getStatus().equals("zaixian")){
				if(s.getRole().equals("guanliyuan"))
					request.setAttribute("role", "1");
				else
					request.setAttribute("role", "2");

				request.setAttribute("sname", s.getUsername());
			}else
				request.setAttribute("role", "0");


		return request;
	}


}
