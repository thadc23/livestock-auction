package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import auction.Buyer;

public class BuyerDAO extends AuctionDAO {

	@SuppressWarnings("unchecked")
	public List<Buyer> getBuyers() {
		List<Buyer> buyers = new ArrayList<Buyer>();
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		buyers = session.createQuery("select b from Buyer as b").list();
		session.getTransaction().commit();
		return buyers;
	}

	public Buyer getBuyer(int buyerNum) {
		Buyer buyer = new Buyer();
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		buyer = (Buyer) session.createQuery(
				"select b from Buyer as b where b.ID = " + buyerNum)
				.uniqueResult();
		return buyer;
	}

}
