import 'package:flutter/material.dart';
import 'package:seventh/src/page/home/controller/home_controller.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  String token;
  HomePage(this.token, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FlickManager flickManager;
  HomeController controllerHome = HomeController();

  @override
  void initState(){       
    super.initState();
  }

  loadVideoPlayer()async{
    await controllerHome.getVideo(widget.token, 'bunny.mp4');
  }


  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }  

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
      future: loadVideoPlayer(),
      builder: (context, snapshot){
      if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      color: Colors.white,
                      child: const Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                  } if  (snapshot.connectionState == ConnectionState.done) {
                    flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.network(controllerHome.video.url!),
    );
                    return FlickVideoPlayer(
                      flickManager: flickManager
                    );
                  } if  (snapshot.connectionState == ConnectionState.none) {
                    return const Text('erro ao carregar');
                  } return const SizedBox();
                  }
    );    
   
  }
}