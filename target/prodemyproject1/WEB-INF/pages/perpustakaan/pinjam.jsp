<!DOCTYPE web-app PUBLIC "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN" "http://java.sun.com/dtd/web-app_2_3.dtd" >
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
request.setAttribute("contextName", request.getContextPath());
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Layanan</title>
<link rel="stylesheet"
	href="<c:url value="/resources/theme1/css/transaksipinjam.css" />">
<link
	href="https://fonts.googleapis.com/css2?family=Ubuntu&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value="/resources/theme1/css/final.css" />">
</head>

<body>
	<section class="wadah">
	<div class="container">
			<div class="sidebar hide">
				<div class="header">
					<div class="list-item">
						<a href="#"> <img
							src="${contextName}/resources/theme1/aset/book-reader.svg" alt=""
							class="icon"> <span class="desc-header">
								Perpustakaan Prodemy </span>
						</a>
						<hr>
					</div>

					<div class="main">
						<div class="list-item">
							<a href='<c:url value="/"></c:url>'> <img
								src="${contextName}/resources/theme1/aset/home.svg" alt=""
								class="icon"> <span class="desc">Beranda</span>
							</a>
						</div>

						<div class="list-item">

							<a href='<c:url value="/listbuku"></c:url>'> <img
								src="${contextName}/resources/theme1/aset/book.svg" alt=""
								class="icon"> <span class="desc">Koleksi</span>
							</a>
						</div>
						<div class="list-item">
							<a href='<c:url value="/logout"></c:url>'> <img
								src="${contextName}/resources/theme1/aset/signout.svg" alt=""
								class="icon"> <span class="desc">Keluar</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="main-content">
			<!-- Icon hamburger -->
			<div id="menu-button">
				<input type="checkbox" id="menu-checkbox"> <label
					for="menu-checkbox" id="menu-label">
					<div id="hamburger"></div>
				</label>
			</div>

			<!-- Isi Main Konten -->
			<div class="w-screen bg-cover"
				style="height: 60rem; background-image: url(https://www.eneadesign.com/wp-content/uploads/2022/04/biblioteca-almeria-8.jpg)">
				<div class="bg-opacity-70 h-full w-full bg-rose-200 items-center">
					<br>
					<div>
						<c:if test="${admin != true}">
						<!-- TULISAN  -->
						<div class="mx-24">
							<h1 class="text-4xl font-semibold">Penikmat Koleksi tahun
								ini</h1>
							<p class="mt-3 text-lg">
								Pengunjung terbaik kami, ada di sini. Nama dan riwayat
								peminjaman juga bisa muncul di sini. <br /> Rajin-rajinlah
								berkunjung dan membaca.
							</p>
						</div>
						</c:if>
						
						<c:if test="${admin == true}">
						<!-- Form Transaksi -->
						<form method="post" action="${contextName}/aksi"
							class="mx-auto w-[40rem] mt-14 bg-gray-100 rounded-xl">
							<input type="hidden" style="display:none;" name="mode" value="tambah"><br>
							<div class="relative mb-6 mx-4 pt-5">
								<div class="">ID Anggota</div>
								<input type="text" name="personid"
									class="block py-2.5 px-0 w-full text-sm text-black bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
									placeholder="Masukkan ID Anggota" required="">
							</div>
							<div class="relative mb-6 mx-4">
								<div class="">Kode Buku</div>
								<input type="text" name="kodebuku"
									class="block py-2.5 px-0 w-full text-sm text-black bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
									placeholder="Masukkan Kode Buku" required="">
							</div>
							<div class="relative mb-6 mx-4">
								<div class="">Tanggal Pinjam</div>
								<input type="date" name="tpinjam"
									class="block py-2.5 px-0 w-full text-sm text-black bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
									placeholder="" required="">
							</div>
							<button type="submit"
								class="text-white bg-teal-400 font-semibold hover:bg-ijo-200 text-sm rounded-md px-5 py-2.5 text-center mx-4 mb-8">Submit</button>
						</form>
						</c:if>
						
						<!-- Tabel Transaksi -->
						<div class="overflow-x-auto relative mt-12">
							<table class="mx-auto text-sm text-gray-500">
								<thead
									class="text-xs text-center text-white uppercase bg-gray-600">
									<tr>
										<th scope="col" class="py-3 px-6">Id Anggota</th>
										<th scope="col" class="py-3 px-6">Kode buku</th>
										<th scope="col" class="py-3 px-6">Tanggal Pinjam</th>
										<th scope="col" class="py-3 px-6">Tanggal Kembali</th>
										<th scope="col" class="py-3 px-6">Denda</th>
										<th scope="col" class="py-3 px-6">Keterangan</th>
										<c:if test="${admin}">
										<th scope="col" class="py-3 px-6">Aksi</th>
										</c:if>
									</tr>
								</thead>

								<tbody class="text-center">
									<c:forEach var="ts" items="${tslist}">
									<tr class="bg-slate-50 border-b">
										<td scope="row" class="py-4 px-6 font-medium text-gray-900">
											${ts.personId}</td>
										<td class="py-4 px-6">${ts.bukuKode}</td>
										<!-- TANGGAL PINJAM -->
										<td class="py-4 px-6">
											<div class="relative">
												<div>${ts.TPinjam}</div>
											</div>
										</td>
										<!-- TANGGAL KEMBALI -->
										<td class="py-4 px-6">
											<div class="relative">
												<div>${ts.TBalik}</div>
											</div>
										</td>
										<!-- Denda -->
										<td class="py-4 px-6">
											<div class="relative">
												<div>${ts.denda}</div>
											</div> <!-- Keterangan -->
										<td class="py-4 px-6">
											<div class="relative">
												<div>${ts.keterangan}</div>
											</div>
										</td>
										
										<c:if test="${admin}">
										<!-- Aksi -->
										<td class="py-4 px-6">
											<div class="relative">
												
												<c:if test="${ts.denda != 0}">
												<!-- Tombol Edit Denda -->
												<button
													class="bg-teal-400 hover:bg-ijo-200 text-white font-semibold text-xs px-6 py-4 rounded shadow hover:shadow-lg focus:outline-none ease-linear transition-all duration-150"
													type="button" onclick="toggleModal('modal-denda')">
													Edit Denda</button>
												<div
													class="hidden overflow-x-hidden overflow-y-auto fixed inset-0 z-50 outline-none focus:outline-none justify-center items-center"
													id="modal-denda">
													<div class="relative w-auto my-6 mx-auto max-w-3xl">
														<!--content-->
														<div
															class="border-0 rounded-lg shadow-lg relative flex flex-col w-full bg-white outline-none focus:outline-none">
															<!--header-->
															<div
																class="flex items-start justify-between p-5 border-b border-solid border-slate-200 rounded-t">
																<h3 class="text-3xl font-semibold">Denda</h3>
																<button
																	class="p-1 ml-auto bg-transparent border-0 text-black opacity-5 float-right text-3xl leading-none font-semibold outline-none focus:outline-none"
																	onclick="toggleModal('modal-denda')">
																	<span
																		class="bg-transparent text-black opacity-5 h-6 w-6 text-2xl block outline-none focus:outline-none">
																		× </span>
																</button>
															</div>
															<!--Isi paragraf-->
															<form method="post" action="${contextName}/aksi">
															<input type="hidden" style="display:none;" name="transaksiid" value="${ts.transaksiId}"><br>
															<input type="hidden" style="display:none;" name="mode" value="denda"><br>
															<div class="relative p-6 flex-auto">
																<p class="my-4 text-slate-500 text-lg leading-relaxed">
																	Total denda yang harus dibayarkan oleh anggota bagi
																	yang telat mengembalikan buku</p>
																<input type="number" name="denda" value="0"
																	class="block py-2.5 px-0 w-full border-2 rounded"
																	placeholder="Masukkan Nominal Denda" />
															</div>
															<!--button simpan dan batal-->
															<div
																class="flex items-center justify-end p-6 border-t border-solid border-slate-200 rounded-b">
																<button
																	class="text-red-500 background-transparent font-bold uppercase px-6 py-2 text-sm outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
																	type="button" onclick="toggleModal('modal-denda')">
																	Batal</button>
																
																<button
																	class="bg-emerald-500 text-white active:bg-emerald-600 font-bold uppercase text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
																	type="submit" onclick="toggleModal('modal-denda')">
																	Simpan</button>
															</div>
															</form>
														</div>
													</div>
												</div>
												<div class="hidden opacity-25 fixed inset-0 z-40 bg-black"
													id="modal-id-backdrop"></div>
												<br>
												</c:if>
												
												<!--Tombol Edit Peminjaman-->
												<button
													class="bg-teal-400 hover:bg-ijo-200 text-white font-semibold text-xs px-6 py-4 mt-3 rounded shadow hover:shadow-lg focus:outline-none ease-linear transition-all duration-150"
													type="button" onclick="toggleModal('modal-tbalik')">
													Edit Tanggal Kembali</button>
												<div
													class="hidden overflow-x-hidden overflow-y-auto fixed inset-0 z-50 outline-none focus:outline-none justify-center items-center"
													id="modal-tbalik">
													<div class="relative w-auto my-6 mx-auto max-w-3xl">
														<!--content-->
														<div
															class="border-0 rounded-lg shadow-lg relative flex flex-col w-full bg-white outline-none focus:outline-none">
															<!--header-->
															<div
																class="flex items-start justify-between p-5 border-b border-solid border-slate-200 rounded-t">
																<h3 class="text-3xl font-semibold">Tanggal Kembali</h3>
																<button
																	class="p-1 ml-auto bg-transparent border-0 text-black opacity-5 float-right text-3xl leading-none font-semibold outline-none focus:outline-none"
																	onclick="toggleModal('modal-tbalik')">
																	<span
																		class="bg-transparent text-black opacity-5 h-6 w-6 text-2xl block outline-none focus:outline-none">
																		× </span>
																</button>
															</div>
															<!--Isi paragraf-->
															<form method="post" action="${contextName}/aksi">
															<input type="hidden" style="display:none;" name="transaksiid" value="${ts.transaksiId}"><br>
															<input type="hidden" style="display:none;" name="kodebuku" value="${ts.bukuKode}"><br>
															<input type="hidden" style="display:none;" name="mode" value="tbalik"><br>
															<div class="relative p-6 flex-auto">
																<p class="my-4 text-slate-500 text-lg leading-relaxed">
																	Tanggal pengembalian buku</p>
																<input type="date" name="tbalik"
																	class="block py-2.5 px-0 w-full border-2 rounded"
																	placeholder="" />
															</div>
															<!--button simpan dan batal-->
															<div
																class="flex items-center justify-end p-6 border-t border-solid border-slate-200 rounded-b">
																<button
																	class="text-red-500 background-transparent font-bold uppercase px-6 py-2 text-sm outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
																	type="button" onclick="toggleModal('modal-tbalik')">
																	Batal</button>
																<button
																	class="bg-emerald-500 text-white active:bg-emerald-600 font-bold uppercase text-sm px-6 py-3 rounded shadow hover:shadow-lg outline-none focus:outline-none mr-1 mb-1 ease-linear transition-all duration-150"
																	type="submit" onclick="toggleModal('modal-tbalik')">
																	Simpan</button>
															</div>
															</form>
														</div>
													</div>
												</div>
												<div class="hidden opacity-25 fixed inset-0 z-40 bg-black"
													id="modal-id-backdrop"></div>


												<!-- batas -->
											</div>
										</td>
										</c:if>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--div main konten-->
	</div>
	</section>

	<script src="<c:url value="/resources/theme1/js/script.js" />"></script>
	<script type="text/javascript">
		function toggleModal(modalID) {
			document.getElementById(modalID).classList.toggle("hidden");
			document.getElementById(modalID + "-backdrop").classList
					.toggle("hidden");
			document.getElementById(modalID).classList.toggle("flex");
			document.getElementById(modalID + "-backdrop").classList
					.toggle("flex");
		}
	</script>

	<footer class="text-center text-gray-600 text-xs"> &copy; 2022
	Kelompok 2 PT Prosigmaka Mandiri <br>
	All rights reserved </footer>
</body>
</html>