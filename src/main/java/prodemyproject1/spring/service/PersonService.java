package prodemyproject1.spring.service;

import prodemyproject1.spring.model.Person;

public interface PersonService {
	public void registerPerson(Person person);
	public Person loginPerson(Person person);
}
