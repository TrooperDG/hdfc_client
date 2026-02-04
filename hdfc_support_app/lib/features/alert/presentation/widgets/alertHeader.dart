import 'package:flutter/material.dart';
import '../../../../core/widgets/headingText.dart';
import '../../../../core/constants/appColor.dart';

/// Used across Home, Header, Cards
enum AlertSeverity { critical, high, medium, info }

class AlertHeader extends StatelessWidget {
  final Map<AlertSeverity, int> counts;
  final Function(AlertSeverity?) onFilterSelected;

  const AlertHeader({
    super.key,
    required this.counts,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// TITLE + COUNTS INLINE
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Alerts",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(width: 12),

            _CountCircle(
              count: counts[AlertSeverity.critical] ?? 0,
              color: AppColors.alertCritical,
              onTap: () => onFilterSelected(AlertSeverity.critical),
            ),
            _CountCircle(
              count: counts[AlertSeverity.high] ?? 0,
              color: AppColors.alertHigh,
              onTap: () => onFilterSelected(AlertSeverity.high),
            ),
            _CountCircle(
              count: counts[AlertSeverity.medium] ?? 0,
              color: AppColors.alertMedium,
              onTap: () => onFilterSelected(AlertSeverity.medium),
            ),
            _CountCircle(
              count: counts[AlertSeverity.info] ?? 0,
              color: AppColors.alertInfo,
              onTap: () => onFilterSelected(AlertSeverity.info),
            ),
          ],
        ),

        const SizedBox(height: 6),

        /// SUBTITLE
        const Text(
          "Something needs your attention.",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}

/// SMALL CIRCULAR COUNT BADGE
class _CountCircle extends StatelessWidget {
  final int count;
  final Color color;
  final VoidCallback onTap;

  const _CountCircle({
    required this.count,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 6),
        width: 22,
        height: 22,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        alignment: Alignment.center,
        child: Text(
          count.toString(),
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
