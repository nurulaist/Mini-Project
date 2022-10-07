package prodemyproject1.spring.dao.impl;

import java.sql.Date;

import java.time.Duration;
import java.time.LocalDate;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import prodemyproject1.spring.dao.TransaksiDAO;
import prodemyproject1.spring.model.Buku;
import prodemyproject1.spring.model.Transaksi;

@Repository
public class TransaksiDAOImpl implements TransaksiDAO{
	
	private SessionFactory sessionFactory;
	
	@Autowired
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	
	@Override
	public boolean NewTransaction(int personId, String bukuKode, String tpinjam, Model model) {
		Session session = this.sessionFactory.getCurrentSession();
		Buku bk = (Buku) session.get(Buku.class, bukuKode);
		
		if(bk.getBukuJumlah() <= 0) {
			model.addAttribute("condition", "habis");
			model.addAttribute("wrong", true);
			return false;
		}
		
		Transaksi ts = new Transaksi();
		ts.setPersonId(personId);
		ts.setBukuKode(bukuKode);
		ts.setTPinjam(Date.valueOf(tpinjam));
		ts.setKeterangan("Sedang dipinjam");
		System.out.println(ts);
		
		session.save(ts);
		return true;
		
	}

	@Override
	public void UpdateTransaction(int transaksiId, String tbalik) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Transaksi ts = (Transaksi) session.get(Transaksi.class, transaksiId);
		ts.setTBalik(Date.valueOf(tbalik));
		Date peminjaman = ts.getTPinjam();
		Date pengembalian = ts.getTBalik();
		
		LocalDate datePinjam = peminjaman.toLocalDate();
		LocalDate dateBalik = pengembalian.toLocalDate();
		
		long durasiHari = Duration.between(datePinjam.atStartOfDay(), dateBalik.atStartOfDay()).toDays();
		
		if (durasiHari <= 14) {
			ts.setDenda(0);
			ts.setKeterangan("Tidak ada denda");
		}
		else if(durasiHari > 14 && durasiHari <= 28) {
			ts.setDenda((int) durasiHari * 10000);
			ts.setKeterangan("Belum Lunas");
		}
		else if(durasiHari > 28 && durasiHari <= 50) {
			ts.setDenda((int) durasiHari * 20000);
			ts.setKeterangan("Belum Lunas");
		}
		else {
			ts.setDenda(50000000);
			ts.setKeterangan("Belum Lunas");
		}
		
		session.update(ts);
	}
	
	@Override
	public void UpdateDenda(int transaksiId, int denda) {
		Session session = this.sessionFactory.getCurrentSession();
		Transaksi ts = (Transaksi) session.get(Transaksi.class, transaksiId);
		
		ts.setDenda(denda);
		
		if(denda == 0) ts.setKeterangan("Lunas");
		
		session.update(ts);
	}

	@Override
	public List<Transaksi> SelectAllTransaction() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Transaksi> result = session.createQuery("from Transaksi").list();
		return result;
	}

	@Override
	public Transaksi SelectTransaction(int transaksiId) {
		Session session = this.sessionFactory.getCurrentSession();
		Transaksi ts = (Transaksi) session.get(Transaksi.class, transaksiId);
		return ts;
	}
}
