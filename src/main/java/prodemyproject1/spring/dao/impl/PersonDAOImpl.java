package prodemyproject1.spring.dao.impl;

import javax.persistence.NoResultException;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import prodemyproject1.spring.dao.PersonDAO;
import prodemyproject1.spring.model.Person;

@SuppressWarnings("deprecation")
@Repository
@Transactional
public class PersonDAOImpl implements PersonDAO{
	
	@Autowired
	private SessionFactory factory;

	@Override
	public void registerPerson(Person person) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		session.save(person);
	}

	@Override
	public Person loginPerson(Person person) {
		// TODO Login
		Session session = factory.getCurrentSession();
		try {
			Query<Person> query = session.createQuery(
					"from Person where person_username =:userName and person_password =:password",
					Person.class);
			query.setParameter("userName", person.getUsername());
			query.setParameter("password", person.getPassword());
			person = query.getSingleResult();
			return person;
		} catch (NoResultException e) {
			return null;
		}
	}
}
