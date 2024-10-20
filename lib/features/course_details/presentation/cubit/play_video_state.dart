part of 'play_video_cubit.dart';

abstract class PlayVideoState {}


class VideoInitialized extends PlayVideoState {}

class VideoPlaying extends PlayVideoState {}

class VideoPaused extends PlayVideoState {}

class EnterFullScreen extends PlayVideoState {}

class ExitFullScreen extends PlayVideoState {}

class PlaybackSpeedChanged extends PlayVideoState {
  final double speed;
  PlaybackSpeedChanged(this.speed);
}