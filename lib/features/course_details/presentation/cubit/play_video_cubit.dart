import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

abstract class PlayVideoState {}

class PlayVideoInitial extends PlayVideoState {}

class PlayVideoCubit extends Cubit<PlayVideoState> {
  bool isFullScreen = false;
  late VideoPlayerController controller;
  PlayVideoCubit() : super(PlayVideoInitial()) {
    _initializeVideo();
  }

  void _initializeVideo() {
    controller = VideoPlayerController.networkUrl(
      Uri.parse('https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'),
      videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true),
    );
    controller.initialize().then((_) => emit(PlayVideoInitial())); // emit عند الانتهاء من التهيئة
  }

  void togglePlayPause() {
    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      controller.play();
    }
    emit(PlayVideoInitial()); // هنا نقوم بإرسال الحالة لتحديث واجهة المستخدم
  }

  void increaseVideoSpeed() {
    controller.setPlaybackSpeed(5.0);
    final currentPosition = controller.value.position;
    final newPosition = currentPosition + const Duration(seconds: 5);
    controller.seekTo(newPosition);

  }
  void decreaseVideoSpeed() {
    final currentPosition = controller.value.position;
    final newPosition = currentPosition - const Duration(seconds: 5);
    controller.seekTo(newPosition < Duration.zero ? Duration.zero : newPosition);
  }




  void toggleFullScreen() {
    if (!isFullScreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }

    isFullScreen = !isFullScreen;
    emit(PlayVideoInitial());
  }



  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
