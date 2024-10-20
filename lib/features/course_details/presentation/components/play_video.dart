import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import '../cubit/play_video_cubit.dart';

class PlayVideo extends StatelessWidget {
  const PlayVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayVideoCubit, PlayVideoState>(
        builder: (context, state) {
          final cubit = context.read<PlayVideoCubit>();

          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              AspectRatio(
                aspectRatio: cubit.controller.value.aspectRatio,
                child: VideoPlayer(cubit.controller),
              ),
              _buildControls(context),
            ],
          );
        },
      );

  }

  Widget _buildControls(BuildContext context) {
    final cubit = context.read<PlayVideoCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        VideoProgressIndicator(cubit.controller, allowScrubbing: true),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.fast_forward_outlined, color: Colors.white),
              onPressed: () {
                cubit.increaseVideoSpeed();
              },
            ),
            IconButton(
              icon: Icon(
                cubit.controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
              ),
              onPressed: () {
                cubit.togglePlayPause();
              },
            ),
            IconButton(
              icon: const Icon(Icons.fast_rewind_outlined, color: Colors.white),
              onPressed: () {
                cubit.decreaseVideoSpeed();
              },
            ),
            // IconButton(
            //   icon: const Icon(Icons.fullscreen, color: Colors.white),
            //   onPressed: () {
            //     cubit.toggleFullScreen();
            //   },
            // ),
          ],
        ),
      ],
    );
  }
}
