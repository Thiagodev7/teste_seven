import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:seventh/src/page/home/model/video_model.dart';
import 'package:seventh/src/util/token_model.dart';

class HomeService {
  
  static Future<VideoModel> getVideo(String token, String video) async {
    var response = await http.get(
      Uri.parse('http://mobiletest.seventh.com.br/video/$video'),
      headers: {
        "X-Access-Token" : token
      }
      
    );
    if (response.statusCode == 200) {      
      return VideoModel.fromJson(jsonDecode(response.body));      
    } else {
      throw Exception('Failed to load data');
    }
  }
}