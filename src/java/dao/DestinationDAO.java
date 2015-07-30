package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import auction.Destination;

public class DestinationDAO extends AuctionDAO {

	@SuppressWarnings("unchecked")
	public List<Destination> getDestinations() {
		List<Destination> destinations = new ArrayList<Destination>();
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		destinations = session.createQuery("select d from Destination as d")
				.list();
		session.getTransaction().commit();
		return destinations;
	}

	public void removeBuyer(int destinationId) {
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		Object d = session.load(Destination.class, destinationId);
		session.delete(d);
		session.getTransaction().commit();
	}

	public Destination getDestination(int destinationID) {
		Destination destination = new Destination();
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		destination = (Destination) session.createQuery(
				"select d from Destination as d where d.ID = " + destinationID)
				.uniqueResult();
		return destination;
	}
}
