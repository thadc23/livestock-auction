package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import auction.Species;

public class SpeciesDAO extends AuctionDAO {

	public Species getSpeciesByName(String name) {
		Species species = new Species();
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		species = (Species) session.createQuery(
				"select s from Species as s where s.name = '" + name + "'")
				.uniqueResult();
		session.getTransaction().commit();
		return species;
	}

	@SuppressWarnings("unchecked")
	public List<Species> getSpecies() {
		List<Species> species = new ArrayList<Species>();
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		species = session.createQuery("select s from Species as s").list();
		session.getTransaction().commit();
		return species;
	}
}
