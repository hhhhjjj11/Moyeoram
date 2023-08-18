import 'dart:math' as math;

import 'package:flutter/material.dart';

class NoVideoWidget extends StatelessWidget {
  //
  const NoVideoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        child: LayoutBuilder(
          builder: (ctx, constraints) => Icon(
            Icons.video_call_outlined,
            color: Colors.black12,
            size: math.min(constraints.maxHeight, constraints.maxWidth) * 0.3,
          ),
        ),
      );
}
