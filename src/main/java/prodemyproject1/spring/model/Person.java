package prodemyproject1.spring.model;

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
@Table(name = "person")
public class Person {
	@Id
	@Column(name = "person_id")
	@SequenceGenerator(name = "pk_person", sequenceName = "person_person_id_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "pk_person")
	private int id;

	@Column(name = "person_nama")
	private String nama;

	@Column(name = "person_alamat")
	private String alamat;
	
	@Column(name = "person_password")
	private String password;
	
	@Column(name = "person_username")
	private String username;
	
	@Column(name = "person_jenis")
	private int jenis;
}
