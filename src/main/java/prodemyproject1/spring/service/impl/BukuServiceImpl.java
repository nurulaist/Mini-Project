package prodemyproject1.spring.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import prodemyproject1.spring.dao.BukuDAO;
import prodemyproject1.spring.model.Buku;
import prodemyproject1.spring.service.BukuService;

@Service
@Transactional
public class BukuServiceImpl implements BukuService{
	@Autowired
	private BukuDAO bkdao;

	@Override
	public Buku SelectBuku(String bukuKode) {
		return bkdao.SelectBuku(bukuKode);
	}

	@Override
	public List<Buku> SelectAllBuku() {
		return bkdao.SelectAllBuku();
	}

	@Override
	public void InsertBuku(Buku buku) {
		bkdao.InsertBuku(buku);
	}

	@Override
	public void UpdateBuku(String bukuKode, boolean habis, boolean returned, boolean editing) {
		bkdao.UpdateBuku(bukuKode, habis, returned, editing);
	}

	@Override
	public void DeleteBuku(String bukuKode) {
		bkdao.DeleteBuku(bukuKode);
	}
	
	
}
