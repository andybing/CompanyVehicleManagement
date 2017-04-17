package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import model.Department;
import model.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.PageSelect;
import dao.SaveInfor;
import dao.SelectInfor;
import dao.UpdateInfor;

@Controller
public class Login {

	private SaveInfor save = new SaveInfor();
	private SelectInfor select = new SelectInfor();
	private UpdateInfor update=new UpdateInfor();

	/*----------------------------------------------------------------*/
	@SuppressWarnings({ "unused", "unchecked" })
	// 登录
	@RequestMapping("/login")
	public String login(String id, String pwd, String root, HttpServletRequest rs) {
		User user = (User) select.getSelectObject("User", id);
		if (user.getPwd().equals(pwd) && user.getRoot().equals(root)) {
			ArrayList<Department> departmentList = (ArrayList<Department>) select
					.getSelectList("from Department", new Object[] {});
			rs.getSession().setAttribute("userSession", user);
			rs.getSession().setAttribute("departmentList", departmentList);
			if (root.equals("管理员")) {
				return "admin.jsp";
			} else if (root.equals("普通用户")) {
				return "user.jsp";
			}

		}
		return "login.jsp";	
	}
	
	 @RequestMapping("/updateInfor")
	   public String updateInfor(@ModelAttribute User user,HttpServletRequest rs){
		 update.update(user);
		  rs.getSession().setAttribute("userSession", user);
		  
		   return "user/showInfor.jsp";
	   }
	 
	 @RequestMapping("/changePwd")
	 public String changePwd(HttpServletRequest rs){
		 String pwd=rs.getParameter("newpwd");
		 User user=(User) rs.getSession().getAttribute("userSession");
		 user.setPwd(pwd);
		 update.update(user);
		 rs.getSession().setAttribute("userSession", user);
		 return "user/showInfor.jsp";
	 }
	/*----------------------------------------------------------------*/

	 
}
