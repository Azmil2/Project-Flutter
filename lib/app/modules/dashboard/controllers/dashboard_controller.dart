import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:lottie/lottie.dart';

import '../../../data/headline_response.dart';
import '../../../data/technology_response.dart';
import '../../../data/sports_response.dart';
import '../../../data/entertainment_response.dart';
import '../../../utils/api.dart';

// import 'package:project_latihan/app/data/headline_response.dart';
// import 'package:project_latihan/app/utils/api.dart';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  final _getConnect = GetConnect();
  final authToken =  GetStorage();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;


  Future<HeadlineResponse> getHeadline() async {
    final response = await http.get(Uri.parse(BaseUrl.headline ));
    if (response.statusCode == 200) {
      return HeadlineResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal Load Data');
    }
  }

  Future<TechnologyResponse> getTechnology() async {
    final response = await http.get(Uri.parse(BaseUrl.technology));
    if (response.statusCode == 200) {
      return TechnologyResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal Load Data');
    }
  }

   Future<SportsResponse> getSports() async {
    final response = await http.get(Uri.parse(BaseUrl.sports));
    if (response.statusCode == 200) {
      return SportsResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal Load Data');
    }
  }

  Future<EntertainmentResponse> getEntertainment() async {
    final response = await http.get(Uri.parse(BaseUrl.entertainment));
    if (response.statusCode == 200) {
      return EntertainmentResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal Load Data');
    }
  }
}