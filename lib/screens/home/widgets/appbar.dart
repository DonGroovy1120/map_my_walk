import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:map_my_walk/configs/app_typography_ext.dart';
import 'package:provider/provider.dart';

import '../../../configs/app_theme.dart';
import '../../../configs/app_typography.dart';
import '../../../configs/space.dart';
import '../../../painters/notification_bell.dart';
import '../../../painters/stats.dart';
import '../../../painters/trophy.dart';
import '../../../providers/app_provider.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppProvider>(context);
    return Padding(
      padding: Space.v,
      child: Row(
        children: [
          Space.x,
          IconButton(
            onPressed: () => app.toggleDrawer(),
            icon: const Icon(Icons.menu),
          ),
          DelayedDisplay(
            delay: const Duration(milliseconds: 300),
            slidingBeginOffset: const Offset(-10, 0),
            child: Card(
              shape: const CircleBorder(),
              child: Padding(
                padding: Space.all(2, 2),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: const NetworkImage(
                      "https://avatars.githubusercontent.com/u/101565812?v=4"),
                ),
              ),
            ),
          ),
          Space.x,
          DelayedDisplay(
            delay: const Duration(milliseconds: 250),
            slidingBeginOffset: const Offset(-10, 0),
            child: CustomPaint(
              painter: StatsPainter(),
              size: const Size(
                16,
                16,
              ),
            ),
          ),
          Space.x,
          DelayedDisplay(
            delay: const Duration(milliseconds: 200),
            slidingBeginOffset: const Offset(-10, 0),
            child: Text(
              "6",
              style: AppText.h3bm.cl(AppTheme.c.primaryDark!),
            ),
          ),
          Space.x,
          DelayedDisplay(
            delay: const Duration(milliseconds: 150),
            slidingBeginOffset: const Offset(-10, 0),
            child: CustomPaint(
              painter: TrophyPainter(),
              size: const Size(
                16,
                16,
              ),
            ),
          ),
          Space.x,
          DelayedDisplay(
            delay: const Duration(milliseconds: 100),
            slidingBeginOffset: const Offset(-10, 0),
            child: Text(
              "12",
              style: AppText.h3bm.cl(AppTheme.c.primaryDark!),
            ),
          ),
          const Expanded(child: SizedBox()),
          DelayedDisplay(
            delay: const Duration(milliseconds: 100),
            slidingBeginOffset: const Offset(10, 0),
            child: Bounce(
              onPressed: () {},
              duration: const Duration(milliseconds: 200),
              child: CustomPaint(
                painter: NotificationBellPainter(),
                size: const Size(16, 16),
              ),
            ),
          ),
          Space.x2
        ],
      ),
    );
  }
}
