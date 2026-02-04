import 'package:flutter/material.dart';
import 'package:hdfc_support_app/core/constants/appColor.dart';
import 'package:hdfc_support_app/core/widgets/footer_placeholder.dart';
import 'package:hdfc_support_app/core/widgets/nav_bar.dart';
import 'widgets/alertHeader.dart';
import 'widgets/alertCard.dart';

class AlertItem {
  final AlertSeverity severity;
  final String title;
  final String description;

  AlertItem({
    required this.severity,
    required this.title,
    required this.description,
  });
}

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  AlertSeverity? selectedFilter;

  final List<AlertItem> _alerts = [
    AlertItem(
      severity: AlertSeverity.critical,
      title: "System Down",
      description: "Core banking service is unreachable.",
    ),
    AlertItem(
      severity: AlertSeverity.high,
      title: "API Timeout",
      description: "Risk engine API timed out.",
    ),
    AlertItem(
      severity: AlertSeverity.medium,
      title: "Partial Failure",
      description: "KYC verification partially failed.",
    ),
    AlertItem(
      severity: AlertSeverity.info,
      title: "Information",
      description: "Customer journey started.",
    ),
    AlertItem(
      severity: AlertSeverity.high,
      title: "CRM Error",
      description: "CRM system rejected payload.",
    ),
  ];

  List<AlertItem> get filteredAlerts {
    if (selectedFilter == null) return _alerts;
    return _alerts.where((a) => a.severity == selectedFilter).toList();
  }

  Map<AlertSeverity, int> get counts {
    return {
      AlertSeverity.critical: _alerts
          .where((a) => a.severity == AlertSeverity.critical)
          .length,
      AlertSeverity.high: _alerts
          .where((a) => a.severity == AlertSeverity.high)
          .length,
      AlertSeverity.medium: _alerts
          .where((a) => a.severity == AlertSeverity.medium)
          .length,
      AlertSeverity.info: _alerts
          .where((a) => a.severity == AlertSeverity.info)
          .length,
    };
  }

  Color _getColor(AlertSeverity severity) {
    switch (severity) {
      case AlertSeverity.critical:
        return AppColors.alertCritical;
      case AlertSeverity.high:
        return AppColors.alertHigh;
      case AlertSeverity.medium:
        return AppColors.alertMedium;
      case AlertSeverity.info:
        return AppColors.alertInfo;
    }
  }

  void _openDrillDown(AlertItem alert) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(alert.title),
        content: Text(alert.description),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  void _removeAlert(AlertItem alert) {
    setState(() {
      _alerts.remove(alert);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      backgroundColor: const Color(0xFFF4F6FA),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AlertHeader(
              counts: counts,
              onFilterSelected: (severity) {
                setState(() {
                  selectedFilter = selectedFilter == severity ? null : severity;
                });
              },
            ),
            const SizedBox(height: 24),
            Expanded(
              child: filteredAlerts.isEmpty
                  ? const Center(
                      child: Text(
                        "No alerts yet 🎉",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredAlerts.length,
                      itemBuilder: (context, index) {
                        final alert = filteredAlerts[index];
                        return GestureDetector(
                          onTap: () => _openDrillDown(alert),
                          child: AlertCard(
                            color: _getColor(alert.severity),
                            title: alert.title,
                            description: alert.description,
                            onClose: () => _removeAlert(alert),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppPlaceholderFooter(),
    );
  }
}
