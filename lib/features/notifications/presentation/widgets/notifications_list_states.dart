import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/material_ui.dart';

const double kNotificationsLoadMoreFooterHeight = 64;

class NotificationsLoadingState extends StatelessWidget {
  const NotificationsLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: FluxerLoadingSpinner(size: FluxerLoadingSpinnerSize.medium),
    );
  }
}

class NotificationsLoadMoreFooter extends StatelessWidget {
  const NotificationsLoadMoreFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: kNotificationsLoadMoreFooterHeight,
      child: Center(
        child: FluxerLoadingSpinner(size: FluxerLoadingSpinnerSize.small),
      ),
    );
  }
}
