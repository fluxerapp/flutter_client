/// Active incident or in-progress maintenance surfaced from Instatus (summary).
class ServiceStatusIncident {
  const ServiceStatusIncident({required this.name, required this.url});

  final String name;
  final String url;
}
