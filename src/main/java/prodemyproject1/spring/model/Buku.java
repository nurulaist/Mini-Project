package prodemyproject1.spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
@Table(name = "buku")
public class Buku {
	@Id
	@Column(name = "buku_kode")
	private String bukuKode;
	
	@Column(name = "buku_nama")
	private String bukuNama;
	
	@Column(name = "buku_penerbit")
	private String bukuPenerbit;
	
	@Column(name = "buku_tahunterbit")
	private int bukuTahunTerbit;
	
	@Column(name = "buku_jumlah")
	private int bukuJumlah;
	
	@Column(name = "buku_jenis")
	private String bukuJenis;
	
}
