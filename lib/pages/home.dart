import 'package:flutter/material.dart';
import 'package:tp_music_chain/types.dart';
import 'package:tp_music_chain/widgets/player.dart';
import 'package:tp_music_chain/widgets/tool_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 工具集
  final tools = [
    ToolItemRow(
      icon: 'assets/brand_music163.svg',
      name: 'NcmToMp3',
      remark: '网易云音乐格式转换',
    ),
    ToolItemRow(
      icon: 'assets/brand_kugou.svg',
      name: 'Search DJ',
      remark: 'DJ 音乐全网搜索',
    ),
  ];

  /// 内容区域尺寸
  Size innerSize = const Size(460, 520);

  @override
  Widget build(BuildContext context) {
    /// 初始化内容区域尺寸
    if (innerSize.isEmpty) {
      innerSize = Size(
        MediaQuery.sizeOf(context).width,
        MediaQuery.sizeOf(context).height - 28.0,
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: _mainLayout(),
    );
  }

  /// 主布局
  Widget _mainLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Stack(
            children: [
              Positioned.fill(child: _gradientRed()),
              Positioned(
                left: _offset(context),
                bottom: _offset(context),
                child: _gradientBlue(),
              ),
              Positioned(
                right: _offset(context),
                top: _offset(context),
                child: _gradientPurple(),
              ),
              Column(
                children: [
                  _appBar(),
                  Container(
                    decoration: const BoxDecoration(color: Colors.white10),
                    height: 1,
                  ),
                  Expanded(flex: 1, child: _main()),
                ],
              ),
              Positioned(
                left: 231,
                top: 29,
                bottom: 0,
                child: _splitShadow(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// 标题栏
  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: 28.00,
      title: Text(
        widget.title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14.00,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Text(
            '版本 1.0.1',
            style: TextStyle(
              fontSize: 9,
              color: Colors.white60,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  /// 偏移尺寸
  double _offset(BuildContext context) {
    return -innerSize.width * 0.3;
  }

  /// 横向边框
  final BoxBorder _borderHor = const Border(
    bottom: BorderSide(
      color: Colors.white10,
      width: 1.0,
      style: BorderStyle.solid,
    ),
  );

  /// 垂直边框
  final BoxBorder _borderVer = const Border(
    left: BorderSide(
      color: Colors.white10,
      width: 1.0,
      style: BorderStyle.solid,
    ),
  );

  /// 工具集组件
  _tools() {
    return List.generate(tools.length, (int index) {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: index == tools.length - 1 ? null : _borderHor,
          ),
          child: ToolItem(row: tools[index]),
        ),
      );
    });
  }

  /// 主视图
  Widget _main() {
    return Row(
      children: [
        SizedBox(
          width: 230.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: _tools(),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(border: _borderVer),
            child: const Player(),
          ),
        ),
      ],
    );
  }

  /// 遮罩阴影
  Widget _splitShadow() {
    return Container(
      width: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black12, Colors.black12.withAlpha(0)],
          stops: const [0, 1],
        ),
      ),
    );
  }

  /// 红色弥散渐变
  Widget _gradientRed() {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color.fromARGB(150, 221, 0, 27),
            Color.fromARGB(20, 221, 0, 27),
            Color.fromARGB(0, 221, 0, 27)
          ],
          stops: [0.0, 0.7, 1.0],
        ),
      ),
    );
  }

  /// 蓝色弥散渐变
  Widget _gradientBlue() {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color.fromARGB(100, 37, 177, 255),
            Color.fromARGB(20, 37, 177, 255),
            Color.fromARGB(0, 37, 177, 255)
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
    );
  }

  /// 紫色弥散渐变
  Widget _gradientPurple() {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color.fromARGB(100, 137, 0, 221),
            Color.fromARGB(20, 137, 0, 221),
            Color.fromARGB(0, 137, 0, 221)
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}
