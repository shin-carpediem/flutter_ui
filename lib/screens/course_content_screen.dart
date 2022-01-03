// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

//TODO: 個別の動画データを取得して視聴できるようにする
class MoviePlayerScreen extends StatefulWidget {
  // const MoviePlayerScreen({Key? key, this.movieUrl}) : super(key: key);
  // ignore: use_key_in_widget_constructors
  const MoviePlayerScreen(this.movieUrl);

  final String? movieUrl;

  @override
  _MoviePlayerScreen createState() => _MoviePlayerScreen();
}

class _MoviePlayerScreen extends State<MoviePlayerScreen> {
  //コントローラーの定義
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

//初期化
  @override
  void initState() {
    super.initState();
    // final moviePath = await FirebaseStorage.instance
    //     .ref()
    //     .child('PostVideo')
    //     .getDownloadURL();
    _videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    // _videoPlayerController =
    //     VideoPlayerController.network('PostVideo/Road - 84970.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 3 / 2, //アスペクト比
      autoPlay: true, //自動再生
      looping: false, //繰り返し再生

      // 以下はオプション
      showControls: true, //コントロールバーの表示（デフォルトではtrue）
      //動画読み込み前の背景色
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      autoInitialize: true, //widget呼び出し時に動画を読み込むかどうか
    );
  }

//コントローラーの破棄
  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("movie"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Chewie(
                    controller: _chewieController,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
