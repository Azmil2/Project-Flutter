import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
Widget build(BuildContext context) {
  return SafeArea(
    child: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  "Hallo!",
                  textAlign: TextAlign.end,
                ),
                subtitle: const Text(
                  "Agung Wahyudi",
                  textAlign: TextAlign.end,
                ),
                trailing: Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 50.0,
                  height: 50.0,
                  child: Lottie.network(
                    'https://gist.githubusercontent.com/olipiskandar/2095343e6b34255dcfb042166c4a3283/raw/d76e1121a2124640481edcf6e7712130304d6236/praujikom_kucing.json',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: TabBar(
                  labelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(text: "Headline"),
                    Tab(text: "Teknologi"),
                    Tab(text: "Sains"),
                  ],
                ),
              ),
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            headline(),
            teknologi(),
            sains(),
          ],
        ),
      ),
    ),
  );
}

// Membuat sebuah ListView yang mengandung satu container dengan gambar, judul, dan sumber berita
ListView headline() {
    return ListView(
      shrinkWrap: true, // Mengatur agar ListView tidak memakan ruang kosong yang tidak diperlukan
      children: [
        Container(
          // Membuat sebuah container untuk mengandung gambar, judul, dan sumber berita
          padding: const EdgeInsets.only(top: 5, left: 8, right: 8, bottom: 5), // Mengatur padding di dalam container
          height: 110, // Mengatur tinggi container
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start, // Mengatur tata letak anak-anak dalam row secara vertikal di awal
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0), // Mengatur radius border gambar
                child: Image.network(
                  'https://picsum.photos/100', // Mengambil gambar dari url
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Mengatur tata letak anak-anak dalam column secara horizontal di awal
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Mengatur tata letak anak-anak dalam column secara vertikal dengan spasi yang sama di antara mereka
                  children: [
                    const Text('Sri Mulyani Kecam Hidup Mewah Pejabat Pajak Buntut Kasus Rubicon - CNN Indonesia'), // Menampilkan judul berita
                    const SizedBox(
                      height: 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Mengatur tata letak anak-anak dalam column secara horizontal di awal
                      children: const [
                        Text('Author : Muhammad Azwar'), // Menampilkan nama penulis berita
                        Text('Sumber : detik.com'), // Menampilkan sumber berita
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
         Container(
          // Membuat sebuah container untuk mengandung gambar, judul, dan sumber berita
          padding: const EdgeInsets.only(top: 5, left: 8, right: 8, bottom: 5), // Mengatur padding di dalam container
          height: 110, // Mengatur tinggi container
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start, // Mengatur tata letak anak-anak dalam row secara vertikal di awal
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0), // Mengatur radius border gambar
                child: Image.network(
                  'https://picsum.photos/100', // Mengambil gambar dari url
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Mengatur tata letak anak-anak dalam column secara horizontal di awal
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Mengatur tata letak anak-anak dalam column secara vertikal dengan spasi yang sama di antara mereka
                  children: [
                    const Text('Sri Mulyani Kecam Hidup Mewah Pejabat Pajak Buntut Kasus Rubicon - CNN Indonesia'), // Menampilkan judul berita
                    const SizedBox(
                      height: 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Mengatur tata letak anak-anak dalam column secara horizontal di awal
                      children: const [
                        Text('Author : Muhammad Azwar'), // Menampilkan nama penulis berita
                        Text('Sumber : detik.com'), // Menampilkan sumber berita
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ListView teknologi() {
    return ListView(
      shrinkWrap: true, // Mengatur agar ListView tidak memakan ruang kosong yang tidak diperlukan
      children: [
        Container(
          // Membuat sebuah container untuk mengandung gambar, judul, dan sumber berita
          padding: const EdgeInsets.only(top: 5, left: 8, right: 8, bottom: 5), // Mengatur padding di dalam container
          height: 110, // Mengatur tinggi container
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start, // Mengatur tata letak anak-anak dalam row secara vertikal di awal
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0), // Mengatur radius border gambar
                child: Image.network(
                  'https://picsum.photos/100', // Mengambil gambar dari url
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Mengatur tata letak anak-anak dalam column secara horizontal di awal
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Mengatur tata letak anak-anak dalam column secara vertikal dengan spasi yang sama di antara mereka
                  children: [
                    const Text('Sri Mulyani Kecam Hidup Mewah Pejabat Pajak Buntut Kasus Rubicon - CNN Indonesia'), // Menampilkan judul berita
                    const SizedBox(
                      height: 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Mengatur tata letak anak-anak dalam column secara horizontal di awal
                      children: const [
                        Text('Author : Muhammad Azwar'), // Menampilkan nama penulis berita
                        Text('Sumber : detik.com'), // Menampilkan sumber berita
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
         Container(
          // Membuat sebuah container untuk mengandung gambar, judul, dan sumber berita
          padding: const EdgeInsets.only(top: 5, left: 8, right: 8, bottom: 5), // Mengatur padding di dalam container
          height: 110, // Mengatur tinggi container
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start, // Mengatur tata letak anak-anak dalam row secara vertikal di awal
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0), // Mengatur radius border gambar
                child: Image.network(
                  'https://picsum.photos/100', // Mengambil gambar dari url
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Mengatur tata letak anak-anak dalam column secara horizontal di awal
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Mengatur tata letak anak-anak dalam column secara vertikal dengan spasi yang sama di antara mereka
                  children: [
                    const Text('Sri Mulyani Kecam Hidup Mewah Pejabat Pajak Buntut Kasus Rubicon - CNN Indonesia'), // Menampilkan judul berita
                    const SizedBox(
                      height: 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Mengatur tata letak anak-anak dalam column secara horizontal di awal
                      children: const [
                        Text('Author : Muhammad Azwar'), // Menampilkan nama penulis berita
                        Text('Sumber : detik.com'), // Menampilkan sumber berita
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
ListView sains() {
    return ListView(
      shrinkWrap: true, // Mengatur agar ListView tidak memakan ruang kosong yang tidak diperlukan
      children: [
        Container(
          // Membuat sebuah container untuk mengandung gambar, judul, dan sumber berita
          padding: const EdgeInsets.only(top: 5, left: 8, right: 8, bottom: 5), // Mengatur padding di dalam container
          height: 110, // Mengatur tinggi container
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start, // Mengatur tata letak anak-anak dalam row secara vertikal di awal
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0), // Mengatur radius border gambar
                child: Image.network(
                  'https://picsum.photos/100', // Mengambil gambar dari url
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Mengatur tata letak anak-anak dalam column secara horizontal di awal
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Mengatur tata letak anak-anak dalam column secara vertikal dengan spasi yang sama di antara mereka
                  children: [
                    const Text('Sri Mulyani Kecam Hidup Mewah Pejabat Pajak Buntut Kasus Rubicon - CNN Indonesia'), // Menampilkan judul berita
                    const SizedBox(
                      height: 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Mengatur tata letak anak-anak dalam column secara horizontal di awal
                      children: const [
                        Text('Author : Muhammad Azwar'), // Menampilkan nama penulis berita
                        Text('Sumber : detik.com'), // Menampilkan sumber berita
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
         Container(
          // Membuat sebuah container untuk mengandung gambar, judul, dan sumber berita
          padding: const EdgeInsets.only(top: 5, left: 8, right: 8, bottom: 5), // Mengatur padding di dalam container
          height: 110, // Mengatur tinggi container
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start, // Mengatur tata letak anak-anak dalam row secara vertikal di awal
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0), // Mengatur radius border gambar
                child: Image.network(
                  'https://picsum.photos/100', // Mengambil gambar dari url
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Mengatur tata letak anak-anak dalam column secara horizontal di awal
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Mengatur tata letak anak-anak dalam column secara vertikal dengan spasi yang sama di antara mereka
                  children: [
                    const Text('Sri Mulyani Kecam Hidup Mewah Pejabat Pajak Buntut Kasus Rubicon - CNN Indonesia'), // Menampilkan judul berita
                    const SizedBox(
                      height: 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Mengatur tata letak anak-anak dalam column secara horizontal di awal
                      children: const [
                        Text('Author : Muhammad Azwar'), // Menampilkan nama penulis berita
                        Text('Sumber : detik.com'), // Menampilkan sumber berita
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}
