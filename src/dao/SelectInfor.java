package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class SelectInfor {
	
	public Object getSelectObject(String table,String id){
		SessionFactory sf = Connection.getConnection();// 调用数据库连接类进行连接
		Session session = sf.openSession();// 创建session实例
		Transaction ts = session.beginTransaction();// 创建事务实例
		Object result = null;// 存放查询的结果
		String hql;
		try {
			if(table.equals("Vehicle")){
			hql="from "+table+" where vid='"+id+"'";
			}else{
			hql="from "+table+" where id="+id;
			}
			Query query = session.createQuery(hql);
			result = query.list().get(0);// 将查询结果返回
			ts.commit();// 提交

		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();// 如果出错进行回滚
		} finally {
			Connection.closeConnection(sf, session);// 关闭数据库连接
		}
		return result;

	}

	@SuppressWarnings({ "rawtypes", })
	// 查询并返回结果
	// hql 使用HQL语句进行查询
	// parameters为查询参数
	public List getSelectList(String hql, Object[] parameters) {
		SessionFactory sf = Connection.getConnection();// 调用数据库连接类进行连接
		Session session = sf.openSession();// 创建session实例
		Transaction ts = session.beginTransaction();// 创建事务实例
		List result = null;// 存放查询的结果
		try {
			Query query = session.createQuery(hql);
			if (parameters.length > 0) {
				for (int i = 0; i < parameters.length; i++) {
					query.setParameter(i, parameters[i]);
				}
			}
			result = query.list();// 将查询结果返回
			ts.commit();// 提交

		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();// 如果出错进行回滚
		} finally {
			Connection.closeConnection(sf, session);// 关闭数据库连接
		}
		return result;

	}

	// 分页查询的实现
	public PageSelect pageSelectList(PageSelect result, String hql,
			Object[] parameters) {
		SessionFactory sf = Connection.getConnection();// 调用数据库连接类进行连接
		Session session = sf.openSession();// 创建session实例
		Transaction ts = session.beginTransaction();// 创建事务实例
		int size = result.getSize();// 获取每页最大记录数
		try {
			if (!result.isChange()) { // 如果总记录数为0，标志初始化，要获取总的记录数
				result.setChange(true);
				Query query = session.createQuery(" select count(*)" + hql);// 获取符合条件的总记录数查询语句
				if (parameters.length > 0) {
					for (int i = 0; i < parameters.length; i++) {
						query.setParameter(i, parameters[i]);
					}
				}
				long count = ((Number) query.list().get(0)).longValue();// 获取符合条件的总记录数
				result.setCount(count);
				if (count % result.getSize() == 0) { // 获取总的页数
					result.setPagecount((int) count / size);
				} else {
					result.setPagecount((int) count / size + 1);
				}
			}
			Query query1 = session.createQuery(hql);
			if (parameters.length > 0) {
				for (int i = 0; i < parameters.length; i++) {
					query1.setParameter(i, parameters[i]);
				}
			}
			query1.setFirstResult((result.getPagenow() - 1) * size); // 设置起始页数
			query1.setMaxResults(size); // 设置每页最大记录数
			result.setList(query1.list());// 将查询结果返回
			ts.commit();// 提交

		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();// 如果出错进行回滚
		} finally {
			Connection.closeConnection(sf, session);// 关闭数据库连接
		}
		return result;

	}

}
