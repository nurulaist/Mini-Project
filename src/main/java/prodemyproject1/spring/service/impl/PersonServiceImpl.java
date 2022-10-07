package prodemyproject1.spring.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import prodemyproject1.spring.dao.PersonDAO;
import prodemyproject1.spring.model.Person;
import prodemyproject1.spring.service.PersonService;

@Service
public class PersonServiceImpl implements PersonService{
	@Autowired
	private PersonDAO personDao;

	@Override
	@Transactional
	public void registerPerson(Person person) {
		// TODO Auto-generated method stub
		personDao.registerPerson(person);
	}

	@Override
	public Person loginPerson(Person person) {
		// TODO Auto-generated method stub
		return personDao.loginPerson(person);
	}
}
