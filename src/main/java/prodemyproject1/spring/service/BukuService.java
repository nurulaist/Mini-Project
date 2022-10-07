package prodemyproject1.spring.service;

import java.util.List;

import prodemyproject1.spring.model.Buku;

public interface BukuService {
	public Buku SelectBuku(String bukuKode);
	public List<Buku> SelectAllBuku();
	public void InsertBuku(Buku buku);
	public void UpdateBuku(String bukuKode, boolean habis, boolean returned, boolean editing);
	public void DeleteBuku(String bukuKode);
}