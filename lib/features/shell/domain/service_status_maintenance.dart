enum ServiceStatusMaintenanceStatus { scheduled, inProgress, completed }

class ServiceStatusMaintenance {
  const ServiceStatusMaintenance({
    required this.id,
    required this.status,
    required this.start,
    required this.durationMinutes,
    required this.url,
  });

  final String id;
  final ServiceStatusMaintenanceStatus status;
  final DateTime start;
  final int durationMinutes;
  final String url;
}
