package dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import auction.Purchase;

public class PurchaseDAO extends AuctionDAO {

	public void createNewInvoice(Purchase animalBuyer) {
		Transaction tx = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			tx = session.beginTransaction();
			session.save(animalBuyer);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null && tx.isActive()) {
				try {
					tx.rollback();
				} catch (HibernateException e1) {
					e1.printStackTrace();
				}
			}
		}
	}

}
