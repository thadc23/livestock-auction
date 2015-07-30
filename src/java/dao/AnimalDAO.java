package dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import auction.Animal;

public class AnimalDAO extends AuctionDAO {
 
	public Animal getAnimal(int tagNumber, String speciesID) {
		Animal animal = new Animal();
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		animal = (Animal) session.createQuery(
				"select a from Animal as a where a.tagNumber = " + tagNumber
						+ " and a.species.ID = " + speciesID).uniqueResult();
		return animal;
	}
	
	public Animal getAnimalByLotNumber(int lotNumber) {
		Animal animal = new Animal();
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		animal = (Animal) session.createQuery(
				"select a from Animal as a where a.lotNumber = " + lotNumber).uniqueResult();
		return animal;
	}

	public void updateAnimal(Animal animal) {
		Transaction tx = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			tx = session.beginTransaction();
			session.update(animal);
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
