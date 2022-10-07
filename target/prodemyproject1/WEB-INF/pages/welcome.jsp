<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%
request.setAttribute("contextName", request.getContextPath());
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Beranda</title>
<link rel="stylesheet"
	href="<c:url value="/resources/theme1/css/index.css" />">
<link
	href="https://fonts.googleapis.com/css2?family=Ubuntu&display=swap"
	rel="stylesheet">

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

		<div class="container">
			<div class="main-content">
				<div id="menu-button">
					<input type="checkbox" id="menu-checkbox"> <label
						for="menu-checkbox" id="menu-label">
						<div id="hamburger"></div>
					</label>
				</div>

				<div class="w-auto bg-cover bg-center"
					style="height: 40rem; background-image: url(https://www.eneadesign.com/wp-content/uploads/2019/06/Green-Square-Library-5.jpg);">
					<div
						class="flex items-center justify-center h-full w-full bg-red-300 bg-opacity-50">
						<div class="text-center">
							<h1
								class=" mb-10 text-center text-5xl font-semibold uppercase text-neutral-700 ">Selamat
								Datang</h1>
							<h2
								class=" mb-10 text-center text-2xl font-bold uppercase  text-gray-50">-Perpustakaan
								Prodemy Terpadu-</h2>
						</div>
					</div>
				</div>

				<div class="mt-12 mb-0 mx-6 w-auto">
					<div
						class="box-border h-4 p-5 border-b-2 text-center font-bold font-sans mb-5 text-base text-rose-500">
						<h3>TENTANG</h3>
					</div>
					<div
						class="border rounded-lg p-10 shadow-lg font-semibold text-center ">
						<p>
							<b><em>Perpustakaan Prodemy Terpadu</em></b> merupakan salah satu
							unit PT Pro Sigmaka Mandiri yang berfungsi menyediakan kebutuhan
							bahan pustaka meliputi literatur buku pembelajaran berkaitan
							dengan tekonologi informasi yang dapat digunakan oleh seluruh
							karyawan PT Pro Sigmaka Mandiri.
						</p>
					</div>
				</div>

				<div class="mt-16 mb-10 mx-6 w-auto">
					<div
						class="box-border h-4 p-5 border-b-2 text-center font-bold font-sans mb-5 text-base text-rose-500 uppercase">
						<h4>Jam Operasional Pelayanan</h4>
					</div>

					<div
						class=" border rounded-lg p-10 shadow-lg mt-1 font-semibold text-center">
						<div class="flex text-center font-bold ">
							<div class="w-[60%] ">Hari</div>
							<div class="w-[50%] ">Waktu</div>
						</div>

						<div class="flex text-center font-semibold">
							<div class="w-[60%]">Senin - Kamis</div>
							<div class="w-[10%] flex">09.00-16.00</div>
						</div>

						<div class="flex font-semibold text-center ">
							<div class="w-[60%]">Jumat</div>
							<div class="w-[20%] flex">09.00-14.00</div>
						</div>
					</div>

					<div class="mt-16 mb-10 mx-6 w-auto">
						<div
							class="box-border h-4 p-5 border-b-2 text-center font-bold font-sans mb-5 text-base text-rose-500 uppercase">
							<h5>LAYANAN</h5>
						</div>
						<div class=" border rounded-lg p-20 shadow-lg text-center">
							<a href="${contextName}/pinjam"> <img src="${contextName}/resources/theme1/aset/buy-book-icon.svg" alt=""
								class="ikon">
								<p class="font">Peminjaman dan Pengembalian</p>
							</a>
						</div>
					</div>
				</div>
			</div>
	</section>

	<script src="<c:url value="/resources/theme1/js/script.js" />">
		
	</script>

	<footer class="text-center text-xs text-gray-600">
		&copy; 2022 Kelompok 2 PT Prosigmaka Mandiri <br /> All rights
		reserved
	</footer>
</body>
</html>