package prodemyproject1.spring.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import prodemyproject1.spring.dao.TransaksiDAO;
import prodemyproject1.spring.model.Transaksi;
import prodemyproject1.spring.service.TransaksiService;

@Service
@Transactional
public class TransaksiServiceImpl implements TransaksiService{
	@Autowired
	private TransaksiDAO tsdao;
	
	@Override
	public boolean NewTransaction(int personId, String bukuKode, String tpinjam, Model model) {
		return tsdao.NewTransaction(personId, bukuKode, tpinjam, model);
	}

	@Override
	public void UpdateTransaction(int transaksiId, String tbalik) {
		tsdao.UpdateTransaction(transaksiId, tbalik);
	}
	
	@Override
	public void UpdateDenda(int transaksiId, int denda) {
		tsdao.UpdateDenda(transaksiId, denda);
	}

	@Override
	public Transaksi SelectTransaction(int transaksiId) {
		return tsdao.SelectTransaction(transaksiId);
	}

	@Override
	public List<Transaksi> SelectAllTransaction() {
		return tsdao.SelectAllTransaction();
	}
}
