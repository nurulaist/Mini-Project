package prodemyproject1.spring.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import prodemyproject1.spring.dao.BukuDAO;
import prodemyproject1.spring.model.Buku;

@Repository
public class BukuDAOImpl implements BukuDAO{
	
	private SessionFactory sessionFactory;
	
	@Autowired
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	
	// Select 1 book
	@Override
	public Buku SelectBuku(String bukuKode) {
		Session session = this.sessionFactory.getCurrentSession();
		Buku bk = (Buku) session.get(Buku.class, bukuKode);
		return bk;
	}
	
	// Select all book
	@Override
	public List<Buku> SelectAllBuku() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Buku> result = session.createQuery("from Buku").list();
		return result;
	}

	// Select insert new book
	@Override
	public void InsertBuku(Buku buku) {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(buku);
	}
	
	// update book
	@Override
	public void UpdateBuku(String bukuKode, boolean habis, boolean returned, boolean editing) {
		if(habis) {
			Session session = this.sessionFactory.getCurrentSession();
			
			Buku bk = (Buku) session.get(Buku.class, bukuKode);
			
			if(returned) {
				if(!editing) bk.setBukuJumlah(bk.getBukuJumlah() + 1);
			}
			else bk.setBukuJumlah(bk.getBukuJumlah() - 1);
			
			session.update(bk);
		}
	}

	// Select delete book
	@Override
	public void DeleteBuku(String bukuKode) {
		Session session = this.sessionFactory.getCurrentSession();
		Buku bk = (Buku) session.load(Buku.class, bukuKode);
		session.delete(bk);
	
	}
}
