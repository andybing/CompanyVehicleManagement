package controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import model.Department;
import model.Driver;
import model.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.DeleteInfor;
import dao.PageSelect;
import dao.SaveInfor;
import dao.SelectInfor;
import dao.UpdateInfor;

@Controller
public class BasicInfo {

	private SaveInfor save = new SaveInfor();
	private SelectInfor select = new SelectInfor();
	private DeleteInfor delete = new DeleteInfor();
	private UpdateInfor update=new UpdateInfor();

	/*----------------------------------------------------------------*/
	// 用户管理
	@RequestMapping("/selectUser")
	public String selectUser(String user, HttpServletRequest rs) {
		PageSelect result = (PageSelect) rs.getSession().getAttribute("result");
		;
		if (result == null || !(result.getSearch().equals(user))) {
			result = new PageSelect();
		}
		result.setSearch(user);
		String hql;
		int id;
		Object[] parameters;
		try {
			id = Integer.parseInt(user);
			user = "%" + user + "%";
			hql = "from User where id like ? or name like ? or sex like ? or root like ?";
			parameters = new Object[] { id, user, user, user };
		} catch (NumberFormatException e) {

			user = "%" + user + "%";
			hql = "from User where  name like ? or sex like ? or root like ?";
			parameters = new Object[] { user, user, user };
		}

		result = select.pageSelectList(result, hql, parameters);
		rs.getSession().setAttribute("result", result);
		return "admin/selectUser.jsp";
	}

	// 翻页
	@RequestMapping("/chagePagenow")
	public String changePagenow(HttpServletRequest rs) {
		String pagenow = rs.getParameter("pagenow");
		PageSelect result = (PageSelect) rs.getSession().getAttribute("result");
		if (pagenow.equals("more")) {
			result.pagemore();
		} else {
			result.pageless();
		}
		return selectUser(result.getSearch(), rs);
	}

	// 删除
	@RequestMapping("/deleteUser")
	public String deleteUser(HttpServletRequest rs) {
		int id = Integer.parseInt(rs.getParameter("id"));
		PageSelect result = (PageSelect) rs.getSession().getAttribute("result");
		result.setChange(false);
		String hql = "delete from User where id=?";
		Object[] paramaters = new Object[] { id };
		delete.getDelete(hql, paramaters);
		return selectUser(result.getSearch(), rs);

	}

	// 查看
	@RequestMapping("/viewUser")
	public String viewUser(HttpServletRequest rs) {
		int id = Integer.parseInt(rs.getParameter("id"));
		String state = rs.getParameter("state");
		String hql = "from User where id=?";
		Object[] parameters = new Object[] { id };
		User user = (User) select.getSelectList(hql, parameters).get(0);
		rs.setAttribute("user", user);
		if (state.equals("view")) {
			return "admin/viewUser.jsp";
		} else {
			return "admin/updateUser.jsp";
		}
	}

	// 添加
	@RequestMapping("/addUser")
	public String addUser(@ModelAttribute User user, HttpServletRequest rs) {
		save.save(user);
		PageSelect result = (PageSelect) rs.getSession().getAttribute("result");
		String search;
		if (result != null) {
			search = result.getSearch();
		} else {
			search = String.valueOf(user.getId());
		}
		return selectUser(search, rs);
	}
	
	@RequestMapping("/updateUser")
	public String updateUser(@ModelAttribute User user, HttpServletRequest rs) {
		update.update(user);
		PageSelect result = (PageSelect) rs.getSession().getAttribute("result");
		String search;
		if (result != null) {
			search = result.getSearch();
		} else {
			search = String.valueOf(user.getId());
		}
		return selectUser(search, rs);
	}

	/*------------------------------------------------------------------------------------------------*/
	// 得到、添加 删除部门
	@RequestMapping("/getDepartment")
	public String getDepartment(HttpServletRequest rs) {
		@SuppressWarnings("unchecked")
		ArrayList<Department> departmentList = (ArrayList<Department>) select
				.getSelectList("from Department", new Object[] {});
		rs.getSession().setAttribute("departmentList", departmentList);
		return "admin/addDepartment.jsp";

	}

	@RequestMapping("/addDepartment")
	public String addDepartment(@ModelAttribute Department department) {
		try {

			save.save(department);
			return "forward:/getDepartment";

		} catch (Exception e) {
			return "error";
		}
	}

	@RequestMapping("/deleteDepartment")
	public String deleteDepartment(int id) {
		try {
			String hql = "delete from Department where id=?";
			Object[] parameters = new Object[] { id };
			delete.getDelete(hql, parameters);
			return "forward:/getDepartment";

		} catch (Exception e) {
			return "error";
		}

	}

	/*------------------------------------------------------------------------------------------------*/
	//驾驶员管理
	@RequestMapping("/selectDriver")
	public String selectDriver(String user, HttpServletRequest rs) {
		PageSelect result = (PageSelect) rs.getSession().getAttribute(
				"resultDriver");
		;
		if (result == null || !(result.getSearch().equals(user))) {
			result = new PageSelect();
		}
		user=user.trim();
		result.setSearch(user);
		String hql;
		int id;
		Object[] parameters;
		try {
			id = Integer.parseInt(user);
			user = "%" + user + "%";
			hql = "from Driver where id like ? or peopleID like ? or name like ? or sex like ? or state like ?";
			parameters = new Object[] { id, user, user, user, user };
		} catch (NumberFormatException e) {

			user = "%" + user + "%";
			hql = "from Driver where peopleID like ? or name like ? or sex like ? or state like ?";
			parameters = new Object[] { user, user, user, user };
		}

		result = select.pageSelectList(result, hql, parameters);
		rs.getSession().setAttribute("resultDriver", result);
		return "admin/selectDriver.jsp";
	}

	// 翻页
	@RequestMapping("/dchagePagenow")
	public String dchangePagenow(HttpServletRequest rs) {
		String pagenow = rs.getParameter("pagenow");
		PageSelect result = (PageSelect) rs.getSession().getAttribute(
				"resultDriver");
		if (pagenow.equals("more")) {
			result.pagemore();
		} else {
			result.pageless();
		}
		return selectDriver(result.getSearch(), rs);
	}

	// 删除
	@RequestMapping("/deleteDriver")
	public String deleteDriver(HttpServletRequest rs) {
		int id = Integer.parseInt(rs.getParameter("id"));
		PageSelect result = (PageSelect) rs.getSession().getAttribute(
				"resultDriver");
		result.setChange(false);
		String hql = "delete from Driver where id=?";
		Object[] paramaters = new Object[] { id };
		delete.getDelete(hql, paramaters);
		return selectDriver(result.getSearch(), rs);

	}

	// 更新
	@RequestMapping("/updateDriver")
	public String updateUser(@ModelAttribute Driver driver,
			HttpServletRequest rs) {
		update.update(driver);
		PageSelect result = (PageSelect) rs.getSession().getAttribute(
				"resultDriver");
		String search;
		if (result != null) {
			search = result.getSearch();
		} else {
			search = String.valueOf(driver.getId());
		}
		return selectDriver(search, rs);
	}
	
	// 更新
		@RequestMapping("/addDriver")
		public String addUser(@ModelAttribute Driver driver,
				HttpServletRequest rs) {
			save.save(driver);
			PageSelect result = (PageSelect) rs.getSession().getAttribute(
					"resultDriver");
			String search;
			if (result != null) {
				search = result.getSearch();
			} else {
				search = String.valueOf(driver.getId());
			}
			return selectDriver(search, rs);
		}


	@RequestMapping("/viewDriver")
	public String viewDriver(HttpServletRequest rs) {
		int id = Integer.parseInt(rs.getParameter("id"));
		String state = rs.getParameter("state");
		String hql = "from Driver where id=?";
		Object[] parameters = new Object[] { id };
		Driver driver = (Driver) select.getSelectList(hql, parameters).get(0);
		rs.setAttribute("driver", driver);
		if (state.equals("view")) {
			return "admin/viewDriver.jsp";
		} else {
			return "admin/updateDriver.jsp";
		}
	}

	/*------------------------------------------------------------------------------------------------*/

	// 中文乱码
	public String utf(String string) {
		try {
			string = new String(string.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return string;
	}

}
