package dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class DeleteInfor {

	public int getDelete(String hql, Object[] parameters) {
		SessionFactory sf = Connection.getConnection();
		Session session = sf.openSession();
		Transaction ts = session.beginTransaction();
		int result;
		try {
			Query query = session.createQuery(hql);
			if (parameters.length > 0) {
				for (int i = 0; i < parameters.length; i++) {
					query.setParameter(i, parameters[i]);
				}
			}
			result = query.executeUpdate();
			ts.commit();

		} catch (Exception e) {
			e.printStackTrace();
			ts.rollback();
			result = 0;
		} finally {
			Connection.closeConnection(sf, session);
		}
		return result;

	}

	// ·½·¨¶þ
	public boolean delete(Object basicIfo) {
		boolean result = true;
		SessionFactory sf = Connection.getConnection();
		Session session = sf.openSession();
		try {

			session.delete(basicIfo);
			session.beginTransaction().commit();
		} catch (Exception e) {
			result = false;
		} finally {
			Connection.closeConnection(sf, session);
		}
		return result;
	}

}
