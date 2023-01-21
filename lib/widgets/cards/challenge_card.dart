import 'package:flutter/material.dart';
import 'package:map_my_walk/configs/app_typography_ext.dart';

import '../../app_routes.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_theme.dart';
import '../../configs/app_typography.dart';
import '../../configs/space.dart';
import '../../configs/ui_props.dart';
import '../../models/challenge.dart';

class ChallengeCard extends StatelessWidget {
  final Challenge challenge;
  final Color? shadowColor;

  const ChallengeCard({
    Key? key,
    required this.challenge,
    this.shadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.challengeDetail,
        arguments: {
          'challenge': challenge,
          'color': shadowColor ?? AppTheme.c.primary,
        },
      ),
      child: Container(
        width: double.infinity,
        decoration: UIProps.boxCard!,
        padding: Space.all(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: shadowColor ?? AppTheme.c.primary,
              child: Text(
                'ISB',
                style: AppText.b1b.cl(
                  Colors.white,
                ),
              ),
            ),
            Space.x,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    challenge.title,
                    style: AppText.b1b.copyWith(
                      color: AppTheme.c.primaryDark,
                      fontSize: AppDimensions.font(8),
                    ),
                  ),
                  Text(
                    challenge.description,
                    style: AppText.l1.cl(Colors.grey),
                    maxLines: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
