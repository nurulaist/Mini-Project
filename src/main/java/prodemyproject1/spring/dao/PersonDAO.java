package prodemyproject1.spring.dao;

import prodemyproject1.spring.model.Person;

public interface PersonDAO {
	public void registerPerson(Person person);
	public Person loginPerson(Person person);
}
