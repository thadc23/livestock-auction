package dao;

import java.util.List;

import org.hibernate.Session;

import auction.Seller;

public class SellerDAO extends AuctionDAO {

	public Seller getSellerByName(String first, String last) {
		Seller seller = new Seller();
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		seller = (Seller) session.createQuery(
				"select s from Seller as s where s.firstName = '" + first
						+ "' and s.lastName = '" + last + "'").uniqueResult();
		session.getTransaction().commit();
		return seller;
	}

	@SuppressWarnings("unchecked")
	public List<Seller> getAllSellers() {
		List<Seller> sellers;
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		sellers = session.createQuery("select s from Seller as s").list();
		session.getTransaction().commit();
		return sellers;
	}
}
