

import java.util.ArrayList;

import model.Application;
import model.Driver;
import model.User;
import dao.SaveInfor;
import dao.SelectInfor;


public class test {
	

	public static void main(String[] args) {
		SelectInfor select=new SelectInfor();
		String hql="from Application where state=? order by setday desc";
		Object[] paramates=new Object[]{"ЭЌвт"};
		ArrayList<Application> list=(ArrayList<Application>) select.getSelectList(hql, paramates);
		for (Application application : list) {
			System.out.println(application.getSetday());
		}
		

	}

}
