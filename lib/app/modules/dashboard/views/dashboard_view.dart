import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:project_latihan/app/modules/home/views/home_view.dart';
import '../../../data/headline_response.dart';
import '../../../data/technology_response.dart';
import '../../../data/sports_response.dart';
import '../../../data/entertainment_response.dart';
import 'package:project_latihan/app/modules/dashboard/controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  DashboardView({Key? key}) : super(key: key);

  final authToken = GetStorage();

  @override
  Widget build(BuildContext context) {
    DashboardController controller = Get.put(DashboardController());
    final ScrollController scrollController = ScrollController();
    final auth = GetStorage();

    return SafeArea(
      // Widget SafeArea menempatkan semua konten widget ke dalam area yang aman (safe area) dari layar.
      child: DefaultTabController(
        length: 5,
        // Widget DefaultTabController digunakan untuk mengatur tab di aplikasi.
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
  onPressed: () async {
    await auth.erase();
    Get.offAll(() => HomeView());
  },
  backgroundColor: Colors.redAccent,
  child: const Icon(Icons.logout_rounded),
),
          // Widget Scaffold digunakan sebagai struktur dasar aplikasi.
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120.0),
            // Widget PreferredSize digunakan untuk menyesuaikan tinggi appBar.
            child: Column(
              // Widget Column adalah widget yang menyatukan widget-childnya secara vertikal.
              children: [
                ListTile(
                  // Widget ListTile digunakan untuk menampilkan tampilan list sederhana.
                  title: const Text(
                    "Hallo!",
                    textAlign: TextAlign.end,
                    // Properti textAlign digunakan untuk menentukan perataan teks.
                  ),
                  subtitle: Text(
  auth.read('full_name').toString(),
  textAlign: TextAlign.end,
),
                  trailing: Container(
                    // Widget Container digunakan untuk mengatur tampilan konten dalam kotak.
                    margin: const EdgeInsets.only(right: 10),
                    // Properti margin digunakan untuk menentukan jarak dari tepi kontainer ke tepi widget yang di dalamnya.
                    width: 50.0,
                    height: 50.0,
                    child: Lottie.network(
                      // Widget Lottie.network digunakan untuk menampilkan animasi Lottie dari suatu URL.
                      'https://gist.githubusercontent.com/olipiskandar/2095343e6b34255dcfb042166c4a3283/raw/d76e1121a2124640481edcf6e7712130304d6236/praujikom_kucing.json',
                      fit: BoxFit.cover,
                      // Properti fit digunakan untuk menyesuaikan ukuran konten agar sesuai dengan kontainer.
                    ),
                  ),
                ),
                const Align(
                  // Widget Align digunakan untuk menempatkan widget pada posisi tertentu di dalam widget induk.
                  alignment: Alignment.topLeft,
                  // Properti alignment digunakan untuk menentukan letak widget di dalam widget induk.
                  child: TabBar(
                    // Widget TabBar digunakan untuk menampilkan tab di aplikasi.
                    labelColor: Colors.black,
                    // Properti labelColor digunakan untuk menentukan warna teks tab yang dipilih.
                    indicatorSize: TabBarIndicatorSize.label,
                    // Properti indicatorSize digunakan untuk menentukan ukuran indikator tab yang dipilih.
                    isScrollable: true,
                    // Properti isScrollable digunakan untuk menentukan apakah tab dapat di-scroll atau tidak.
                    indicatorColor: Colors.white,
                    // Properti indicatorColor digunakan untuk menentukan warna indikator tab yang dipilih.
                    tabs: [
                      // Properti tabs digunakan untuk menentukan teks yang akan ditampilkan pada masing-masing tab.
                      Tab(text: "Headline"),
                      Tab(text: "Teknologi"),
                      Tab(text: "Olahraga"),
                      Tab(text: "Hiburan"),
                      Tab(text: "Profile"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            // Widget TabBarView digunakan untuk menampilkan konten yang terkait dengan masing-masing tab.
            children: [
              // Properti children digunakan untuk menentukan konten yang akan ditampilkan pada masing-masing tab.
              headline(controller, scrollController),
              technology(controller, scrollController),
              sports(controller, scrollController),
              entertainment(controller, scrollController),
              profile(),
            ],
          ),
        ),
      ),
    );
  }
}

SingleChildScrollView profile() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Lottie.network(
            'https://assets1.lottiefiles.com/packages/lf20_WaQ8yMJuKt.json',
            height: Get.size.height / 4,
          ),
          Text(
            'Visit Me',
            style: GoogleFonts.pressStart2p(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(FeatherIcons.github),
                  color: Colors.black,
                  onPressed: () async {
                    if (!await launchUrl(Uri.parse('https://github.com/olipiskandar'))) {
                      throw Exception('Could not launch');
                    }
                  },
                  iconSize: 40,
                ),
                IconButton(
                  icon: const Icon(FeatherIcons.globe),
                  color: Colors.indigo,
                  onPressed: () async {
                    if (!await launchUrl(Uri.parse('https://olipiskandar.com/'))) {
                      throw Exception('Could not launch');
                    }
                  },
                  iconSize: 40,
                ),
                IconButton(
                  icon: const Icon(FeatherIcons.twitter),
                  color: Colors.blueAccent,
                  onPressed: () async {
                    if (!await launchUrl(Uri.parse('https://twitter.com/olipiskandar'))) {
                      throw Exception('Could not launch');
                    }
                  },
                  iconSize: 40,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Halo nama saya Azmil Rahman Dari kelas 12 RPL 3',
              style: GoogleFonts.pressStart2p(
                fontSize: 12,
                height: 2,
                textStyle: const TextStyle(
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


FutureBuilder<HeadlineResponse> headline(
    DashboardController controller, ScrollController scrollController) {
  return FutureBuilder<HeadlineResponse>(
    // Mendapatkan future data headline dari controller
    future: controller.getHeadline(),
    builder: (context, snapshot) {
      // Jika koneksi masih dalam keadaan waiting/tunggu, tampilkan widget Lottie loading
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: Lottie.network(
            // Menggunakan animasi Lottie untuk tampilan loading
            'https://gist.githubusercontent.com/olipiskandar/4f08ac098c81c32ebc02c55f5b11127b/raw/6e21dc500323da795e8b61b5558748b5c7885157/loading.json',
            repeat: true,
            width: MediaQuery.of(context).size.width / 1,
          ),
        );
      }
      // Jika tidak ada data yang diterima, tampilkan pesan "Tidak ada data"
      if (!snapshot.hasData) {
        return const Center(child: Text("Tidak ada data"));
      }

      // Jika data diterima, tampilkan daftar headline dalam bentuk ListView.Builder
      return ListView.builder(
        itemCount: snapshot.data!.data!.length,
        controller: scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          // Tampilan untuk setiap item headline dalam ListView.Builder
          return Container(
            padding: const EdgeInsets.only(
              top: 5,
              left: 8,
              right: 8,
              bottom: 5,
            ),
            height: 110,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Widget untuk menampilkan gambar headline dengan menggunakan url gambar dari data yang diterima
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    snapshot.data!.data![index].urlToImage.toString(),
                    height: 130,
                    width: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Widget untuk menampilkan judul headline dengan menggunakan data yang diterima
                      Text(
                        snapshot.data!.data![index].title.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      // Widget untuk menampilkan informasi author dan sumber headline dengan menggunakan data yang diterima
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Author : ${snapshot.data!.data![index].author}'),
                          Text('Sumber :${snapshot.data!.data![index].name}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

FutureBuilder<TechnologyResponse> technology(
    DashboardController controller, ScrollController scrollController) {
  return FutureBuilder<TechnologyResponse>(
    // Mendapatkan future data headline dari controller
    future: controller.getTechnology(),
    builder: (context, snapshot) {
      // Jika koneksi masih dalam keadaan waiting/tunggu, tampilkan widget Lottie loading
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: Lottie.network(
            // Menggunakan animasi Lottie untuk tampilan loading
            'https://gist.githubusercontent.com/olipiskandar/4f08ac098c81c32ebc02c55f5b11127b/raw/6e21dc500323da795e8b61b5558748b5c7885157/loading.json',
            repeat: true,
            width: MediaQuery.of(context).size.width / 1,
          ),
        );
      }
      // Jika tidak ada data yang diterima, tampilkan pesan "Tidak ada data"
      if (!snapshot.hasData) {
        return const Center(child: Text("Tidak ada data"));
      }

      // Jika data diterima, tampilkan daftar headline dalam bentuk ListView.Builder
      return ListView.builder(
        itemCount: snapshot.data!.data!.length,
        controller: scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          // Tampilan untuk setiap item headline dalam ListView.Builder
          return Container(
            padding: const EdgeInsets.only(
              top: 5,
              left: 8,
              right: 8,
              bottom: 5,
            ),
            height: 110,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Widget untuk menampilkan gambar headline dengan menggunakan url gambar dari data yang diterima
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    snapshot.data!.data![index].urlToImage.toString(),
                    height: 130,
                    width: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Widget untuk menampilkan judul headline dengan menggunakan data yang diterima
                      Text(
                        snapshot.data!.data![index].title.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      // Widget untuk menampilkan informasi author dan sumber headline dengan menggunakan data yang diterima
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Author : ${snapshot.data!.data![index].author}'),
                          Text('Sumber :${snapshot.data!.data![index].name}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

FutureBuilder<SportsResponse> sports(
    DashboardController controller, ScrollController scrollController) {
  return FutureBuilder<SportsResponse>(
    // Mendapatkan future data headline dari controller
    future: controller.getSports(),
    builder: (context, snapshot) {
      // Jika koneksi masih dalam keadaan waiting/tunggu, tampilkan widget Lottie loading
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: Lottie.network(
            // Menggunakan animasi Lottie untuk tampilan loading
            'https://gist.githubusercontent.com/olipiskandar/4f08ac098c81c32ebc02c55f5b11127b/raw/6e21dc500323da795e8b61b5558748b5c7885157/loading.json',
            repeat: true,
            width: MediaQuery.of(context).size.width / 1,
          ),
        );
      }
      // Jika tidak ada data yang diterima, tampilkan pesan "Tidak ada data"
      if (!snapshot.hasData) {
        return const Center(child: Text("Tidak ada data"));
      }

      // Jika data diterima, tampilkan daftar headline dalam bentuk ListView.Builder
      return ListView.builder(
        itemCount: snapshot.data!.data!.length,
        controller: scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          // Tampilan untuk setiap item headline dalam ListView.Builder
          return Container(
            padding: const EdgeInsets.only(
              top: 5,
              left: 8,
              right: 8,
              bottom: 5,
            ),
            height: 110,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Widget untuk menampilkan gambar headline dengan menggunakan url gambar dari data yang diterima
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    snapshot.data!.data![index].urlToImage.toString(),
                    height: 130,
                    width: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Widget untuk menampilkan judul headline dengan menggunakan data yang diterima
                      Text(
                        snapshot.data!.data![index].title.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      // Widget untuk menampilkan informasi author dan sumber headline dengan menggunakan data yang diterima
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Author : ${snapshot.data!.data![index].author}'),
                          Text('Sumber :${snapshot.data!.data![index].name}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

FutureBuilder<EntertainmentResponse> entertainment(
    DashboardController controller, ScrollController scrollController) {
  return FutureBuilder<EntertainmentResponse>(
    // Mendapatkan future data headline dari controller
    future: controller.getEntertainment(),
    builder: (context, snapshot) {
      // Jika koneksi masih dalam keadaan waiting/tunggu, tampilkan widget Lottie loading
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: Lottie.network(
            // Menggunakan animasi Lottie untuk tampilan loading
            'https://gist.githubusercontent.com/olipiskandar/4f08ac098c81c32ebc02c55f5b11127b/raw/6e21dc500323da795e8b61b5558748b5c7885157/loading.json',
            repeat: true,
            width: MediaQuery.of(context).size.width / 1,
          ),
        );
      }
      // Jika tidak ada data yang diterima, tampilkan pesan "Tidak ada data"
      if (!snapshot.hasData) {
        return const Center(child: Text("Tidak ada data"));
      }

      // Jika data diterima, tampilkan daftar headline dalam bentuk ListView.Builder
      return ListView.builder(
        itemCount: snapshot.data!.data!.length,
        controller: scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          // Tampilan untuk setiap item headline dalam ListView.Builder
          return Container(
            padding: const EdgeInsets.only(
              top: 5,
              left: 8,
              right: 8,
              bottom: 5,
            ),
            height: 110,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Widget untuk menampilkan gambar headline dengan menggunakan url gambar dari data yang diterima
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    snapshot.data!.data![index].urlToImage.toString(),
                    height: 130,
                    width: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Widget untuk menampilkan judul headline dengan menggunakan data yang diterima
                      Text(
                        snapshot.data!.data![index].title.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      // Widget untuk menampilkan informasi author dan sumber headline dengan menggunakan data yang diterima
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Author : ${snapshot.data!.data![index].author}'),
                          Text('Sumber :${snapshot.data!.data![index].name}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

// FutureBuilder<ProfileResponse> profile(
//     DashboardController controller, ScrollController scrollController) {
//   return FutureBuilder<ProfileResponse>(
//     // Mendapatkan future data headline dari controller
//     future: controller.getProfile(),
//     builder: (context, snapshot) {
//       // Jika koneksi masih dalam keadaan waiting/tunggu, tampilkan widget Lottie loading
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return Center(
//           child: Lottie.network(
//             // Menggunakan animasi Lottie untuk tampilan loading
//             'https://gist.githubusercontent.com/olipiskandar/4f08ac098c81c32ebc02c55f5b11127b/raw/6e21dc500323da795e8b61b5558748b5c7885157/loading.json',
//             repeat: true,
//             width: MediaQuery.of(context).size.width / 1,
//           ),
//         );
//       }
//       // Jika tidak ada data yang diterima, tampilkan pesan "Tidak ada data"
//       if (!snapshot.hasData) {
//         return const Center(child: Text("Tidak ada data"));
//       }

//       // Jika data diterima, tampilkan daftar headline dalam bentuk ListView.Builder
//       return ListView.builder(
//         itemCount: snapshot.data!.data!.length,
//         controller: scrollController,
//         shrinkWrap: true,
//         itemBuilder: (context, index) {
//           // Tampilan untuk setiap item headline dalam ListView.Builder
//           return Container(
//             padding: const EdgeInsets.only(
//               top: 5,
//               left: 8,
//               right: 8,
//               bottom: 5,
//             ),
//             height: 110,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Widget untuk menampilkan gambar headline dengan menggunakan url gambar dari data yang diterima
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(8.0),
//                   child: Image.network(
//                     snapshot.data!.data![index].urlToImage.toString(),
//                     height: 130,
//                     width: 130,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Widget untuk menampilkan judul headline dengan menggunakan data yang diterima
//                       Text(
//                         snapshot.data!.data![index].title.toString(),
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 2,
//                       ),
//                       const SizedBox(
//                         height: 2,
//                       ),
//                       // Widget untuk menampilkan informasi author dan sumber headline dengan menggunakan data yang diterima
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                               'Author : ${snapshot.data!.data![index].author}'),
//                           Text('Sumber :${snapshot.data!.data![index].name}'),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     },
//   );
// }