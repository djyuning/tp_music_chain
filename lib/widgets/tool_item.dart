import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tp_music_chain/types.dart';

class ToolItem extends StatelessWidget {
  /// 条目
  final ToolItemRow row;

  /// 图标大写
  final double iconSize = 64.0;

  /// 标题名称样式
  final TextStyle nameStyle = const TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis,
  );

  /// 备注文本样式
  final TextStyle remarkStyle = const TextStyle(
    fontSize: 12,
    color: Colors.white60,
    overflow: TextOverflow.ellipsis,
  );

  const ToolItem({super.key, required this.row});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            row.icon,
            fit: BoxFit.fill,
            height: iconSize,
            width: iconSize,
          ),
          const SizedBox(height: 10),
          Text(row.name, style: nameStyle),
          const SizedBox(height: 8),
          Text(row.remark, style: remarkStyle),
        ],
      ),
    );
  }
}
