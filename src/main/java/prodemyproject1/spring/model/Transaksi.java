package prodemyproject1.spring.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
@Table(name = "transaksi")
public class Transaksi {
	@Id
	@Column(name = "transaksi_id")
	@SequenceGenerator(name = "pk_transaksi", sequenceName = "transaksi_transaksi_id_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "pk_transaksi")
	private int transaksiId;
	
	@Column(name = "person_id")
	private int personId;
	
	@Column(name = "buku_kode")
	private String bukuKode;
	
	@Column(name = "tanggal_pinjam")
	private Date tPinjam;
	
	@Column(name = "tanggal_kembali")
	private Date tBalik;
	
	@Column(name = "denda")
	private int denda;
	
	@Column(name = "keterangan")
	private String keterangan;
}
