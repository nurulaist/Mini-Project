<!DOCTYPE web-app PUBLIC "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN" "http://java.sun.com/dtd/web-app_2_3.dtd" >
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%
request.setAttribute("contextName", request.getContextPath());
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Daftar Buku</title>
<link rel="stylesheet"
	href="<c:url value="/resources/theme1/css/listbuku.css" />" >
<link
	href="https://fonts.googleapis.com/css2?family=Ubuntu&display=swap"
	rel="stylesheet">
	

</head>
<style>
.h-96 {
  height: 30rem;
}

.overflow-y-auto {
  overflow-y: auto;
}

.fixed {
  position: fixed;
}
</style>
<body>
	<script src="https://www.kryogenix.org/code/browser/sorttable/sorttable.js"></script>
	<script>
		function searchOnTable() {
			// Declare variables
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("searchInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("table");
			tr = table.getElementsByTagName("tr");

			// Loop through all table rows, and hide those who don't match the search query
			for (i = 1; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[1];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>
<section class="wadah">
	<!-- sidebar -->
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
        </div>
      <!-- end sidebar -->
      
      <div class="main-content">
        <div id="menu-button">
          <input type="checkbox" id="menu-checkbox"> <label
            for="menu-checkbox" id="menu-label">
            <div id="hamburger"></div>
          </label>
        </div>

        <div class="w-screen bg-cover "
          style="height: 70rem; background-image: url(https://www.eneadesign.com/wp-content/uploads/2022/04/biblioteca-almeria-8.jpg)">
  
          <div
            class="bg-opacity-50 h-full w-full bg-rose-200 items-center text-center">
            <br>
            <div>
                <form class="mx-auto" method="post" action="${contextName}/listbuku"> 
                <input type="hidden" style="display:none;" name="mode" value="tambah"><br>
                <div class="mb-2">
                  <label for="Kode Buku"
                    class="block mb-2 text-sm font-bold text-gray-900 dark:text-gray-300">Kode
                    Buku</label> <input type="text" id="Kode Buku" name="kodebuku"
                    class=" mx-auto bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block p-1 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                    required="">
                </div>
                <div class="mb-2">
                  <label for="Nama Buku"
                    class="block mb-2 text-sm font-bold text-gray-900 dark:text-gray-300">Nama
                    Buku</label> <input type="text" id="Nama Buku" name="namabuku"
                    class="mx-auto bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block p-1 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                    required="">
                </div>
                <div class="mb-2">
                  <label for="Nama Penerbit"
                    class="block mb-2 text-sm font-bold text-gray-900 dark:text-gray-300">Nama
                    Penerbit</label> <input type="text" id="Nama Penerbit" name="penerbitbuku"
                    class="mx-auto bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block p-1 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                    required="">
                </div>
                <div class="mb-2">
                  <label for="Tahun"
                    class="block mb-2 text-sm font-bold text-gray-900 dark:text-gray-300">Tahun</label>
                  <input type="text" id="Tahun" name="tahunterbitbuku"
                    class="mx-auto bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block p-1 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                    required="">
                </div>
                <div class="mb-2">
                  <label for="Jumlah Buku"
                    class="block mb-2 text-sm font-bold text-gray-900 dark:text-gray-300">Jumlah
                    Buku</label> <input type="text" id="Jumlah Buku" name="jumlahbuku"
                    class="mx-auto bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block p-1 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                    required="">
                </div>
                <div class="mb-2">
                  <label for="Jenis Buku"
                    class="block mb-2 text-sm font-bold text-gray-900 dark:text-gray-300">Jenis
                    Buku</label> <input type="text" id="Jenis Buku" name="jenisbuku"
                    class="mx-auto bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block p-1 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                    required="">
                </div>
                <div class="flex items-start mb-6">
                  <button type="submit"
                    class="mx-auto text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Submit</button>
                </div>
              </form>
            </div>
            
            <h1 class=" text-center text-4xl font-serif font bold">Daftar
              Buku</h1>
            <div class="flex justify-center">
              <div class="mt-5">
                <div
                  class="input-group relative flex items-stretch w-full  rounded">
                  <input type="text"
                    class="form-control relative flex-auto min-w-0 block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white bg-clip-padding border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none"
                    placeholder="Cari nama buku..." aria-label="Search"
                    aria-describedby="button-addon2" id="searchInput"
                    onkeyup="searchOnTable()"> <span
                    class="input-group-text flex items-center px-3 py-1.5 text-base font-normal text-gray-700 text-center whitespace-nowrap rounded"
                    id="basic-addon2"> <svg aria-hidden="true"
                      focusable="false" data-prefix="fas" data-icon="search"
                      class="w-4" role="img" xmlns="http://www.w3.org/2000/svg"
                      viewBox="0 0 512 512"> <path fill="currentColor"
                      d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path>
                    </svg>
                  </span>
                </div>
              </div>
            </div>
            <br>
            <div class="overflow-y-auto h-96">
            <table class=" mt-5 w-4/6 mx-auto sortable rounded-lg" id="table">
              <tr
                class="bg-teal-500 py-4 font-bold text-white grid grid-cols-[0.7fr_3.0fr_1.2fr_0.6fr_0.6fr_1.2fr_1.0fr]">
                <th class="text-center">Kode</th>
                <th class="text-center">Nama Buku</th>
                <th class="text-center">Penerbit</th>
                <th class="text-center">Tahun</th>
                <th class="text-center">Jumlah</th>
                <th class="text-center">Jenis Buku</th>
                <th class="text-center">Aksi</th>
              </tr>
  
              <c:forEach var="bk" items="${bukulist}">
                <tr
                  class="bg-slate-200 py-4 grid grid-cols-[0.7fr_3.0fr_1.2fr_0.6fr_0.6fr_1.2fr_1.0fr] item ">
                  <td class="text-center">${bk.bukuKode}</td>
                  <td class="text-justify">${bk.bukuNama}</td>
                  <td class="text-center">${bk.bukuPenerbit}</td>
                  <td class="text-center">${bk.bukuTahunTerbit}</td>
                  <td class="text-center">${bk.bukuJumlah}</td>
                  <td class="text-center">${bk.bukuJenis}</td>
                  <c:if test="${admin}">
                    <td class="flex items-center justify-center gap-2">
                      <form method="post" action="${contextName}/listbuku" class="hover:text-red-500">
                        <input type="hidden" style="display: none;" name="mode"
                          value="delete">
                        <input type="hidden" style="display: none;" name="kodebukudel"
                          value="${bk.bukuKode}">
                        <button type="submit">
                          <svg xmlns="http://www.w3.org/2000/svg" fill="none"
                            viewBox="0 0 24 24" stroke-width="1.5"
                            stroke="currentColor" class="w-6 h-6"> <path
                            stroke-linecap="round" stroke-linejoin="round"
                            d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0" />
                          </svg>
                        </button>
                      </form> 
                      <!--  
                      <a href='<c:url value="/listbuku"></c:url>'
                      class="hover:text-blue-500"> <c:set var="mode"
                          value="delete" /> <svg xmlns="http://www.w3.org/2000/svg"
                          fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                          stroke="currentColor" class="w-6 h-6"> <path
                          stroke-linecap="round" stroke-linejoin="round"
                          d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0115.75 21H5.25A2.25 2.25 0 013 18.75V8.25A2.25 2.25 0 015.25 6H10" />
                        </svg>
                    </a>--></td>
                  </c:if>
                </tr>
              </c:forEach>
            </table>
            </div>
          </div>
        </div>
      </div>
     </section>
      
        <script src="<c:url value="/resources/theme1/js/script.js" />"></script>
  
      <footer class="text-center text-gray-600 text-xs"> &copy; 2022
	Kelompok 2 PT Prosigmaka Mandiri <br>
	All rights reserved </footer>
</body>
</html>
