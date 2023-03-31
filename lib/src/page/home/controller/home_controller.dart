import 'package:seventh/src/page/home/model/video_model.dart';
import 'package:seventh/src/page/home/service/home_service.dart';


class HomeController {
  
  late VideoModel video;

  Future getVideo(String token, String file) async {    
     video = await HomeService.getVideo(token, file); 
  }
}
