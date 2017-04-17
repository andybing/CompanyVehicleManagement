package controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import model.Driver;
import model.Record;
import model.User;
import model.Vehicle;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.DeleteInfor;
import dao.PageSelect;
import dao.SaveInfor;
import dao.SelectInfor;
import dao.UpdateInfor;

@Controller
public class ApplicationOp {

	private SelectInfor select = new SelectInfor();
	private SaveInfor save = new SaveInfor();
	private UpdateInfor update = new UpdateInfor();
	private DeleteInfor delete = new DeleteInfor();

	/*
	 * --------------------------------------------------------------------------
	 */
	@RequestMapping("/selectVehicle")
	public String selectVehicle(String search, HttpServletRequest rs) {
		PageSelect result = (PageSelect) rs.getSession().getAttribute(
				"resultVehicle");
		;
		if (result == null || !(result.getSearch().equals(search))) {
			result = new PageSelect();
		}
		search=search.trim();
		result.setSearch(search);
		String hql;
		Object[] parameters;
		if (search.trim()!= "") {

			search = "%" + search + "%";
			hql = "from Vehicle where vid like ? or name like ? or model like ? or kind like ? or state like ?";
			parameters = new Object[] { search, search, search, search, search };
		} else {
			hql = "from Vehicle";
			parameters = new Object[] {};
		}

		result = select.pageSelectList(result, hql, parameters);
		rs.getSession().setAttribute("resultVehicle", result);
		User user = (User) rs.getSession().getAttribute("userSession");
		if (user.getRoot().equals("管理员") ) {
			return "admin/selectVehicle.jsp";
		} else {
			return "user/selectVehicle.jsp";
		}
	}

	// 翻页
	@RequestMapping("/vchagePagenow")
	public String changePagenow(HttpServletRequest rs) {
		String pagenow = rs.getParameter("pagenow");
		PageSelect result = (PageSelect) rs.getSession().getAttribute(
				"resultVehicle");
		if (pagenow.equals("more")) {
			result.pagemore();
		} else {
			result.pageless();
		}
		return selectVehicle(result.getSearch(), rs);
	}

	// 删除
	@RequestMapping("/deleteVehicle")
	public String deleteVehicle(HttpServletRequest rs) {
		String vid = utf(rs.getParameter("vid"));
		PageSelect result = (PageSelect) rs.getSession().getAttribute(
				"resultVehicle");
		result.setChange(false);
		String hql = "delete from Vehicle where vid=?";
		Object[] paramaters = new Object[] { vid };
		delete.getDelete(hql, paramaters);
		return selectVehicle(result.getSearch(), rs);

	}

	// 查看
	@RequestMapping("/viewVehicle")
	public String viewVehicle(HttpServletRequest rs) {
		String vid = utf(rs.getParameter("vid"));
		String state = rs.getParameter("state");
		String hql = "from Vehicle where vid=?";
		Object[] parameters = new Object[] { vid };
		Vehicle vehicle = (Vehicle) select.getSelectList(hql, parameters)
				.get(0);
		rs.setAttribute("vehicle", vehicle);
		if (state.equals("view")) {
			return "admin/viewVehicle.jsp";
		} else if (state.equals("update")) {
			return "admin/updateVehicle.jsp";
		} else {
			return "user/viewVehicle.jsp";
		}
	}

	// 更新
	@RequestMapping("/updateVehicle")
	public String updateVehicle(@ModelAttribute Vehicle vehicle,
			HttpServletRequest rs) {
		save.save(vehicle);
		PageSelect result = (PageSelect) rs.getSession().getAttribute(
				"resultVehicle");
		String search;
		if (result != null) {
			search = result.getSearch();
		} else {
			search = vehicle.getVid();
		}
		return selectVehicle(search, rs);
	}

	/*
	 * --------------------------------------------------------------------------
	 */
	// 提出申请
	@RequestMapping("/application")
	public String application(String vid, HttpServletRequest rs) {
		vid = utf(vid);
		rs.setAttribute("vid", vid);
		String hql="from Driver where state='空闲'";
		@SuppressWarnings("unchecked")
		ArrayList<Driver> driverList=(ArrayList<Driver>) select.getSelectList(hql, new Object[]{});
		rs.setAttribute("driverList", driverList);
		return "user/addApplication.jsp";

	}

	@RequestMapping("/addApplicaton")
	public String addApplication(@ModelAttribute model.Application application,
			HttpServletRequest rs) {
		application.setState("未处理");
		// 获取系统当前是时间
		Date dateNowStr = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH");// 设置时间格式
		String setday = sdf.format(dateNowStr);// 对当前时间进行转换
		application.setSetday(setday);// 将系统时间写入对象
		System.out.println(save.save(application));
		return selectApplication("", rs);

	}

	// 查看所有申请
	@RequestMapping("/selectApplication")
	public String selectApplication(String search, HttpServletRequest rs) {
		PageSelect result = (PageSelect) rs.getSession().getAttribute(
				"resultApplication");
		if (result == null || !(result.getSearch().equals(search))) {
			result = new PageSelect();
		}
		search=search.trim();
		result.setSearch(search);
		String hql;
		int id;
		Object[] parameters = null;
		User user = (User) rs.getSession().getAttribute("userSession");
		if (user.getRoot().equals("管理员")) {
				try {
					id = Integer.parseInt(search);
					search = "%" + search + "%";
					hql = "from Application where id like ? or car_id like ? or user_id like ? or state like ? order by setday desc";
					parameters = new Object[] { id, id, id, search };
				} catch (NumberFormatException e) {

					search = "%" + search + "%";
					hql = "from Application where  state like ? order by setday desc";
					parameters = new Object[] { search };
				}

			result = select.pageSelectList(result, hql, parameters);
			rs.getSession().setAttribute("resultApplication", result);
			return "admin/selectApplication.jsp";
		} else {
			
				try {
					id = Integer.parseInt(search);
					search = "%" + search + "%";
					hql = "from Application where id like ? or car_id like ?  or state like ? and user_id=? order by setday desc ";
					parameters = new Object[] { id, id, search, user.getId() };
				} catch (NumberFormatException e) {

					search = "%" + search + "%";
					hql = "from Application where  state like ? and user_id=? order by setday desc";
					parameters = new Object[] { search, user.getId() };
				}

		result = select.pageSelectList(result, hql, parameters);
		rs.getSession().setAttribute("resultApplication", result);
		return "user/selectApplication.jsp";
		}

	}

	// 翻页
	@RequestMapping("/achagePagenow")
	public String achangePagenow(HttpServletRequest rs) {
		String pagenow = rs.getParameter("pagenow");
		PageSelect result = (PageSelect) rs.getSession().getAttribute(
				"resultApplication");
		if (pagenow.equals("more")) {
			result.pagemore();
		} else {
			result.pageless();
		}
		return selectApplication(result.getSearch(), rs);
	}

	// 删除
	@RequestMapping("/deleteApplication")
	public String deleteApplication(HttpServletRequest rs) {
		int id = Integer.parseInt(rs.getParameter("id"));
		PageSelect result = (PageSelect) rs.getSession().getAttribute(
				"resultApplication");
		result.setChange(false);
		String hql = "delete from Application where id=?";
		Object[] paramaters = new Object[] { id };
		delete.getDelete(hql, paramaters);
		return selectApplication(result.getSearch(), rs);

	}

	//用车审批
	@RequestMapping("/doApplication")
	public String doApplication(HttpServletRequest rs) {
		String id = rs.getParameter("id");
		String state = rs.getParameter("state");
		@SuppressWarnings("unused")
		model.Application application = (model.Application) select
				.getSelectObject("Application", id);
		if (state.equals("yes")){
			state = "同意";
			Record record = new Record(application);
			record.setIsreturn("否");
			Vehicle vehicle=(Vehicle) select.getSelectObject("Vehicle",application.getCar_id());
			vehicle.setState("正在使用");
			Driver driver=(Driver) select.getSelectObject("Driver", String.valueOf(application.getDriver_id()));
			driver.setState("忙碌");
			update.update(vehicle);
			update.update(driver);
			save.save(record);
		}else {
			state = "拒绝";
		}
		// 获取系统当前是时间
		Date dateNowStr = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH");// 设置时间格式
		String doneday = sdf.format(dateNowStr);// 对当前时间进行转换
		application.setDoneday(doneday);
		application.setState(state);
		update.update(application);
		return selectApplication("", rs);
	}
	
	
	
	//还车
	@RequestMapping("/returnCar")
	public String returnCar(HttpServletRequest rs){
		User user=(User) rs.getSession().getAttribute("userSession");
		String hql="from Record where isreturn=? and user_id=?";
		Object[] paramaters = new Object[] { "否",user.getId()};
		@SuppressWarnings("unchecked")
		ArrayList<Record> recordList=(ArrayList<Record>) select.getSelectList(hql, paramaters);
		rs.setAttribute("recordList", recordList);
		return "user/returnCar.jsp";
	}
	
	//填写还车信息
	@RequestMapping("/addReturnCar")
	public String addReturnCar(@ModelAttribute Record record,HttpServletRequest rs){
		update.update(record);
		Vehicle vehicle=(Vehicle) select.getSelectObject("Vehicle", record.getCar_id());
		Driver driver=(Driver) select.getSelectObject("Driver", String.valueOf( record.getDriver_id()));
		vehicle.setState("可用");
		driver.setState("空闲");
		update.update(vehicle);
		update.update(driver);
		return returnCar(rs);
		
	}
	
	

	/*
	 * --------------------------------------------------------------------------
	 */
	
	//获取不可申请的车辆的借阅信息
	@RequestMapping("/getRecord")
	public String getRecord(HttpServletRequest rs){
		String vid=utf(rs.getParameter("vid"));
		String hql="from Record where car_id=? and isreturn=?";
		Object[] paramaters = new Object[] { vid,"否"};
		Record record=(Record) select.getSelectList(hql, paramaters).get(0);
		rs.setAttribute("VRecord", record);
		return "user/viewApplication.jsp";
	
	}
	
	//获取用户的借车记录
		@RequestMapping("/viewRecord")
		public String viewRecord(HttpServletRequest rs){
			String id=rs.getParameter("id");
			Record record =(Record) select.getSelectObject("Record", id);
			rs.setAttribute("record", record);
			return "user/addReturnCar.jsp";
			
		}
	
	//出车记录管理
	@RequestMapping("/selectRecord")	
	public String selectRecord(String search, HttpServletRequest rs) {
		PageSelect result = (PageSelect) rs.getSession().getAttribute(
				"resultRecord");
		if (result == null || !(result.getSearch().equals(search))) {
			result = new PageSelect();
		}
		search=search.trim();
		result.setSearch(search);
		String hql;
		int id;
		Object[] parameters = null;
		
				try {
					id = Integer.parseInt(search);
					search = "%" + search + "%";
					hql = "from Record where driver_id like ? or car_id like ? or user_id like ? or isreturn like ? order by isreturn";
					parameters = new Object[] { id, id, id, search };
				} catch (NumberFormatException e) {

					search = "%" + search + "%";
					hql = "from Record where  car_id like ?  or isreturn like ? order by isreturn";
					parameters = new Object[] { search,search };
				}

			result = select.pageSelectList(result, hql, parameters);
			rs.getSession().setAttribute("resultRecord", result);
			return "admin/selectRecord.jsp";
		
	}

	// 翻页
	@RequestMapping("/rchagePagenow")
	public String rchangePagenow(HttpServletRequest rs) {
		String pagenow = rs.getParameter("pagenow");
		PageSelect result = (PageSelect) rs.getSession().getAttribute(
				"resultRecord");
		if (pagenow.equals("more")) {
			result.pagemore();
		} else {
			result.pageless();
		}
		return selectRecord(result.getSearch(), rs);
	}

	
	
	/*
	 * --------------------------------------------------------------------------
	 */
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
