import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          /// DJ 碟机图片
          Positioned(
            right: 10,
            top: 60,
            width: 100,
            height: 200,
            child: Image.asset(
              'assets/player_dj_cover.png',
              width: 100,
              height: 200,
            ),
          ),

          /// logo
          Positioned(
            left: 0,
            top: 0,
            width: 68,
            height: 40,
            child: _placeholder,
          ),

          /// 曲风切换
          Positioned(
            right: 0,
            top: 0,
            child: _styleHandle(context),
          ),

          /// 播放器
          Positioned(
            left: 8,
            right: 8,
            bottom: 24,
            child: _player(context),
          ),
        ],
      ),
    );
  }

  /// 曲风切换图标
  Widget _styleHandle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Icon(
        Icons.view_week,
        size: 16,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  /// 播放器
  Widget _player(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _btnPrev(context),
            _btnPlayPause(context),
            _btnNext(context),
          ],
        ),
        const SizedBox(height: 16),
        _playingInfo(context),
      ],
    );
  }

  /// 上一曲按钮
  Widget _btnPrev(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Icon(
        Icons.skip_previous,
        size: 32,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  /// 下一曲按钮
  Widget _btnNext(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Icon(
        Icons.skip_next,
        size: 32,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  /// 播放按钮
  Widget _btnPlayPause(BuildContext context) {
    Icon icon = Icon(
      Icons.play_circle,
      size: 40.0,
      color: Theme.of(context).colorScheme.secondary,
    );

    final button = Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          colors: [
            Color.fromARGB(255, 57, 57, 57),
            Color.fromARGB(255, 14, 14, 14),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 16),
          ),
        ],
        border: Border.all(
          color: Colors.black,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      height: 88.0,
      width: 88.0,
      child: icon,
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          print('播放或暂停');
        },
        child: button,
      ),
    );
  }

  /// 正在播放信息
  Widget _playingInfo(BuildContext context) {
    Widget inner = Row(
      children: [
        const Icon(Icons.video_call, size: 16),
        const SizedBox(width: 8),
        Text(
          '正在播放曲目信息',
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          print('object');
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(40),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: inner,
        ),
      ),
    );
  }

  /// 占位
  final Widget _placeholder = const Padding(
    padding: EdgeInsets.all(10),
    child: Placeholder(strokeWidth: 1, color: Colors.cyan),
  );
}
