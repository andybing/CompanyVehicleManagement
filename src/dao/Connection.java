package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Connection {
	public static Configuration cf=null; 
	public static SessionFactory sf=null;
	public static Session session=null;
	
	//加载Hibernate配置文件，并且创建SessionFactory实例
	@SuppressWarnings("deprecation")
	public static SessionFactory getConnection(){
		cf=new Configuration().configure(); 
		sf=cf.buildSessionFactory();
		return sf;
		
	}
	//关闭连接
	public static void closeConnection(SessionFactory sf,Session session){
		if(session!=null){
			session.close(); //关闭Session
		}
		if(sf!=null){
			sf.close();	 //关闭SessionFactory
		}
		
	}


}
