package prodemyproject1.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import prodemyproject1.spring.model.Buku;
import prodemyproject1.spring.model.Person;
import prodemyproject1.spring.model.Transaksi;
import prodemyproject1.spring.service.BukuService;
import prodemyproject1.spring.service.PersonService;
import prodemyproject1.spring.service.TransaksiService;

@Controller
public class PerpustakaanController {
	@Autowired
	private PersonService service;
	@Autowired
	private BukuService bkservice;
	@Autowired
	private TransaksiService tsservice;
	
	private int isAdmin = 0;
	private int currentPersonId = 0;
	private boolean logIn = false;
	
	// Kondisi ketika yang login itu admin atau bukan
	public void isAdmin(Model model, HttpServletRequest req) {
		if (isAdmin == 1) {
			model.addAttribute("admin", true); //If Admin
		}
		else {
			model.addAttribute("admin", false); // If User / costumer
		}
	}
	
	// Instatiasi list buku dan jadiin model
	public void inisiateBuku(Model model, HttpServletRequest req) {
		List<Buku> list = bkservice.SelectAllBuku();
		isAdmin(model, req);
		model.addAttribute("bukulist", list);
	}
	
	// Instatiasi list transaksi dan jadiin model
	public void inisiateTransaksi(Model model, HttpServletRequest req) {
		List<Transaksi> list = tsservice.SelectAllTransaction();
		isAdmin(model, req);
		model.addAttribute("tslist", list);
	}
	
	// Home
	@GetMapping("/")
	public ModelAndView home(Model m) {
		Person person = new Person();
		m.addAttribute("login", false);
		m.addAttribute("person", person);
		ModelAndView modelAndView = null;
		if(logIn)
			modelAndView = new ModelAndView("welcome");
		else
			modelAndView = new ModelAndView("index");
		return modelAndView;
	}
	
	// Masuk ke jsp register
	@GetMapping("/register")
	public String registerDisplay(Model m, HttpSession session) {

		Person person = new Person();

		if (session.getAttribute("person") != null) {
			session.invalidate();
		}
		
		m.addAttribute("person", person);
		return "register";
	}
	
	// Masukkin data yang diinput ke database person
	@PostMapping("/register")
	public String register(@ModelAttribute("person") Person person, Model model) {
		service.registerPerson(person);
		model.addAttribute("success", "Registered Successfully");
		return "register";
	}
	
	// Pencet tombol keluar
	@GetMapping("/logout")
	public String logoutDisplay() {
		logIn = false;
		return "index";
	}
		
	// Masuk ke jsp login
	@GetMapping("/login")
	public String loginDisplay(Model m, HttpSession session) {

		Person person = new Person();

		if (session.getAttribute("person") != null) {
			session.invalidate();
			System.out.println("here");
			m.addAttribute("success", "You have logout Successfully!!!");
		}
		m.addAttribute("person", person);
		return "login";
	}
	
	// Masuk ke welcome
	@PostMapping("/login")
	public String login(@ModelAttribute("person") Person person, Model model, HttpSession session) {
		Person person2 = service.loginPerson(person);
		System.out.println("person2" + person2);
		if (person2 != null) {
			System.out.println("hello");
			model.addAttribute("person", person2);
			session.setAttribute("person", person2);
			
			List<Buku> list = bkservice.SelectAllBuku();
			model.addAttribute("bukulist", list);
			
			// Kondisi yang login admin atau bukan
			if (person2.getJenis() == 1) { //If Admin
				model.addAttribute("admin", true); 
				isAdmin = 1;
			}
			else { // If User / costumer
				model.addAttribute("admin", false); 
				isAdmin = 0;
				currentPersonId = person2.getId();
			}
			
			logIn = true;
			model.addAttribute("login", true); 
			model.addAttribute("personid", person2.getId());
			return "welcome";
		}
		if (person2 == null) {
			System.out.println("on");
			model.addAttribute("error", "Invalid Credentials");
		}
		return "login";

	}
	
	// Masuk ke kumpulan list buku
	@GetMapping("/listbuku")
	public String display(Model model, HttpServletRequest req) {
		inisiateBuku(model, req);
		
		model.addAttribute("check", false);
		return "perpustakaan/listbuku";
	}
	
	// Bagian List Buku
	@PostMapping("/listbuku")
	public String insertBuku(Model model, HttpServletRequest req) {
		String mode = req.getParameter("mode");
		
		// Jika klik tambah buku
		if("tambah".equals(mode)) {
			model.addAttribute("check", true);
			Buku bk = new Buku();
			bk.setBukuKode(req.getParameter("kodebuku"));
			bk.setBukuNama(req.getParameter("namabuku"));
			bk.setBukuPenerbit(req.getParameter("penerbitbuku"));
			bk.setBukuTahunTerbit(Integer.parseInt(req.getParameter("tahunterbitbuku")));
			bk.setBukuJenis(req.getParameter("jenisbuku"));
			bk.setBukuJumlah(Integer.parseInt(req.getParameter("jumlahbuku")));
			bkservice.InsertBuku(bk);
		}
		// Jika klik delete buku
		else
			bkservice.DeleteBuku(req.getParameter("kodebukudel"));
		
		inisiateBuku(model, req);
		
		return "perpustakaan/listbuku";
	}
	
	// Masuk ke fitur transaksi peminjaman buku
	@GetMapping("/pinjam")
	public String pinjamBuku(Model model, HttpServletRequest req) {
		List<Transaksi> list = tsservice.SelectAllTransaction();
		isAdmin(model, req);
		model.addAttribute("tslist", list);
		
		// Untuk menampilkan buku2 yang dipinjam oleh user terganggung person id
		if(isAdmin != 1)
			list.removeIf(id -> !(id.getPersonId() == currentPersonId));
		
		model.addAttribute("wrong", false);
		
		return "perpustakaan/pinjam";
	}
	
	// Tambah transaksi peminjaman buku
	@PostMapping("/aksi")
	public String transaksi(Model model, HttpServletRequest req) {
		String mode = req.getParameter("mode");
		
		// Jika klik submit di form
		if("tambah".equals(mode)) {
			boolean habis = tsservice.NewTransaction(Integer.parseInt(req.getParameter("personid")) , 
					req.getParameter("kodebuku"), 
					req.getParameter("tpinjam"), model);
			
			bkservice.UpdateBuku(req.getParameter("kodebuku"), habis, false, false);
			
		}
		// Jika klik edit tanggal balik
		else if("tbalik".equals(mode)) {
			Transaksi ts = tsservice.SelectTransaction(Integer.parseInt(req.getParameter("transaksiid")));
			
			tsservice.UpdateTransaction(Integer.parseInt(req.getParameter("transaksiid")), 
					req.getParameter("tbalik"));
			
			// Kalau baru balikin buku
			if(ts.getTBalik() == null || ts.getTBalik().toString().length() == 0) 
				bkservice.UpdateBuku(req.getParameter("kodebuku"), true, true, false);
			// Kalau ternyata input tanggal baliknya salah karena human error
			else 
				bkservice.UpdateBuku(req.getParameter("kodebuku"), true, true, true);
			
		} 
		// Jika klik edit denda
		else {
			tsservice.UpdateDenda(Integer.parseInt(req.getParameter("transaksiid")), 
					Integer.parseInt(req.getParameter("denda")));
		}
		
		inisiateTransaksi(model, req);
		
		return "perpustakaan/pinjam";
	}
}
