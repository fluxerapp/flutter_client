import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/guild_scheduled_events/domain/guild_scheduled_event.dart';
import 'package:fluxer_app/features/guild_scheduled_events/presentation/widgets/event_card.dart';
import 'package:fluxer_app/features/guild_scheduled_events/presentation/widgets/create_event_dialog.dart';
import 'package:go_router/go_router.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  final String guildId;

  const CalendarScreen({super.key, required this.guildId});

  @override
  ConsumerState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  late DateTime _selectedDate;
  late DateTime _currentMonth;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _currentMonth = DateTime(_selectedDate.year, _selectedDate.month);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showCreateEventDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildMonthSelector(),
          _buildCalendarGrid(),
          const Divider(),
          Expanded(
            child: _buildEventsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              setState(() {
                _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
              });
            },
          ),
          Text(
            '${_getMonthName(_currentMonth.month)} ${_currentMonth.year}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () {
              setState(() {
                _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid() {
    final firstDay = DateTime(_currentMonth.year, _currentMonth.month, 1);
    final lastDay = DateTime(_currentMonth.year, _currentMonth.month + 1, 0);
    final startWeekday = firstDay.weekday % 7;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
                .map((day) => Expanded(
                      child: Center(
                        child: Text(
                          day,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 8),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
            ),
            itemCount: startWeekday + lastDay.day,
            itemBuilder: (context, index) {
              if (index < startWeekday) {
                return const SizedBox();
              }
              final day = index - startWeekday + 1;
              final date = DateTime(_currentMonth.year, _currentMonth.month, day);
              final isSelected = _isSameDay(date, _selectedDate);
              final isToday = _isSameDay(date, DateTime.now());

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDate = date;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : isToday
                            ? Theme.of(context).colorScheme.primaryContainer
                            : null,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '$day',
                      style: TextStyle(
                        color: isSelected
                            ? Theme.of(context).colorScheme.onPrimary
                            : isToday
                                ? Theme.of(context).colorScheme.onPrimaryContainer
                                : null,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEventsList() {
    return Consumer(
      builder: (context, ref, child) {
        final eventsAsync = ref.watch(guildScheduledEventsProvider(widget.guildId));

        if (eventsAsync.isEmpty) {
          return const Center(
            child: Text('No events scheduled'),
          );
        }

        final dayEvents = eventsAsync.where((event) {
          return _isSameDay(event.scheduledStartTime, _selectedDate);
        }).toList();

        if (dayEvents.isEmpty) {
          return Center(
            child: Text('No events on ${_formatDate(_selectedDate)}'),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: dayEvents.length,
          itemBuilder: (context, index) {
            return EventCard(
              event: dayEvents[index],
              onTap: () => _showEventDetail(context, dayEvents[index]),
            );
          },
        );
      },
    );
  }

  void _showCreateEventDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CreateEventDialog(guildId: widget.guildId),
    );
  }

  void _showEventDetail(BuildContext context, GuildScheduledEvent event) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _EventDetailSheet(event: event, guildId: widget.guildId),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  String _formatDate(DateTime date) {
    return '${_getMonthName(date.month)} ${date.day}, ${date.year}';
  }

  String _getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return months[month - 1];
  }
}

class _EventDetailSheet extends ConsumerWidget {
  final GuildScheduledEvent event;
  final String guildId;

  const _EventDetailSheet({required this.event, required this.guildId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subscription = ref.watch(
      eventSubscriptionProvider(guildId: guildId, eventId: event.id),
    );

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: ListView(
            controller: scrollController,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                event.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              _buildStatusChip(context),
              const SizedBox(height: 16),
              _buildInfoRow(
                context,
                icon: Icons.calendar_today,
                label: _formatDateTime(event.scheduledStartTime),
              ),
              if (event.scheduledEndTime != null) ...[
                const SizedBox(height: 8),
                _buildInfoRow(
                  context,
                  icon: Icons.calendar_today,
                  label: 'Until ${_formatDateTime(event.scheduledEndTime!)}',
                ),
              ],
              if (event.location != null) ...[
                const SizedBox(height: 8),
                _buildInfoRow(
                  context,
                  icon: Icons.location_on,
                  label: event.location!,
                ),
              ],
              const SizedBox(height: 8),
              _buildInfoRow(
                context,
                icon: Icons.people,
                label: '${event.subscriberCount} going',
              ),
              if (event.description != null && event.description!.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(
                  event.description!,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ref.read(eventSubscriptionProvider(guildId: guildId, eventId: event.id).notifier).toggle();
                  },
                  icon: Icon(
                    subscription ? Icons.check : Icons.add,
                  ),
                  label: Text(subscription ? "I'm Going" : 'Join Event'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatusChip(BuildContext context) {
    Color color;
    String label;

    if (event.isActive) {
      color = Colors.green;
      label = 'In Progress';
    } else if (event.isCompleted) {
      color = Colors.grey;
      label = 'Completed';
    } else if (event.isCancelled) {
      color = Colors.red;
      label = 'Cancelled';
    } else {
      color = Colors.blue;
      label = 'Upcoming';
    }

    return Chip(
      label: Text(label),
      backgroundColor: color.withOpacity(0.2),
      labelStyle: TextStyle(color: color),
    );
  }

  Widget _buildInfoRow(BuildContext context, {required IconData icon, required String label}) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Theme.of(context).colorScheme.onSurfaceVariant),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.month}/${dateTime.day}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
