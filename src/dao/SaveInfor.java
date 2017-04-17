package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class SaveInfor {

	//±£¥ÊUser–≈œ¢
	public int save(Object basicIfo){
		int result=0;
		SessionFactory sf=Connection.getConnection();
		Session session=sf.openSession();
		try{
			session.save(basicIfo);
			session.beginTransaction().commit();
		}catch (Exception e){
			result=1;
		}finally{
			Connection.closeConnection(sf, session);
		}
		return result;	
	}

}
