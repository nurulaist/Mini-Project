package prodemyproject1.spring.dao;

import java.util.List;

import prodemyproject1.spring.model.Buku;

public interface BukuDAO {
	public Buku SelectBuku(String bukuKode);
	public List<Buku> SelectAllBuku();
	public void InsertBuku(Buku buku);
	public void UpdateBuku(String bukuKode, boolean habis, boolean returned, boolean editing);
	public void DeleteBuku(String bukuKode);
}
