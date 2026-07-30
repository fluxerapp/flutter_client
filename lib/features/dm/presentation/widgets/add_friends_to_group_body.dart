import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/picker_search_input.dart';
import 'package:fluxer_app/features/dm/providers/add_friends_to_group_controller.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/widgets/friend_selector.dart';

class AddFriendsToGroupBody extends ConsumerStatefulWidget {
  const AddFriendsToGroupBody({
    required this.controller,
    required this.scrollController,
    this.showInviteFooter = true,
    super.key,
  });

  final AddFriendsToGroupController controller;
  final ScrollController scrollController;
  final bool showInviteFooter;

  @override
  ConsumerState<AddFriendsToGroupBody> createState() =>
      _AddFriendsToGroupBodyState();
}

class _AddFriendsToGroupBodyState extends ConsumerState<AddFriendsToGroupBody> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(
      text: widget.controller.searchQuery,
    );
    _searchController.addListener(_handleSearchChanged);
    widget.controller.addListener(_handleControllerChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleControllerChanged);
    _searchController
      ..removeListener(_handleSearchChanged)
      ..dispose();
    super.dispose();
  }

  void _handleSearchChanged() {
    widget.controller.setSearchQuery(_searchController.text);
  }

  void _handleControllerChanged() {
    if (!mounted) {
      return;
    }
    if (_searchController.text != widget.controller.searchQuery) {
      _searchController.value = _searchController.value.copyWith(
        text: widget.controller.searchQuery,
        selection: TextSelection.collapsed(
          offset: widget.controller.searchQuery.length,
        ),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final AddFriendsToGroupController controller = widget.controller;
    final friends = ref.watch(friendsListProvider).value ?? const [];
    final bool canAdd =
        controller.selectedUserIds.isNotEmpty && !controller.isAdding;
    return Padding(
      padding: EdgeInsets.only(
        bottom: FluxerBottomSheet.scrollBottomPaddingOf(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          PickerSearchInput(
            controller: _searchController,
            hintText: l10n.createDmSearchFriends,
            topPadding: 0,
            bottomPadding: context.layout.s3,
            rightCustomElement: FluxerButton.primary(
              label: l10n.groupDmAddFriends,
              size: FluxerButtonSize.small,
              fitContent: true,
              isLoading: controller.isAdding,
              onPressed: canAdd
                  ? () => controller.handleAddFriends(context)
                  : null,
            ),
          ),
          Expanded(
            child: FriendSelector(
              friends: friends,
              selectedUserIds: controller.selectedUserIds,
              onToggle: controller.toggleUser,
              searchQuery: controller.searchQuery,
              l10n: l10n,
              scrollController: widget.scrollController,
              maxSelections: controller.remainingSlotsCount,
              excludeUserIds: controller.currentMemberIds,
            ),
          ),
          if (widget.showInviteFooter) ...<Widget>[
            SizedBox(height: context.layout.s3),
            Text(
              l10n.groupDmOrSendInvite,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            SizedBox(height: context.layout.s2),
            Row(
              children: <Widget>[
                Expanded(
                  child: FluxerInput(
                    readOnly: true,
                    hint: l10n.groupDmGenerateInviteLink,
                    controller: TextEditingController(
                      text: controller.inviteLink ?? '',
                    ),
                  ),
                ),
                SizedBox(width: context.layout.s2),
                FluxerButton.primary(
                  label: controller.inviteLink == null
                      ? l10n.groupDmCreateInvite
                      : l10n.channelDetailsCopyLink,
                  size: FluxerButtonSize.small,
                  fitContent: true,
                  isLoading: controller.isGeneratingInvite,
                  onPressed: controller.isGeneratingInvite
                      ? null
                      : () async {
                          final bool copied = await controller
                              .handleGenerateOrCopyInvite(context);
                          if (!context.mounted) {
                            return;
                          }
                          if (!copied) {
                            if (controller.inviteLink == null &&
                                !controller.isGeneratingInvite) {
                              ref
                                  .read(toastProvider.notifier)
                                  .show(
                                    FluxerToast(
                                      message:
                                          l10n.groupDmCreateInviteFailedBody,
                                      variant: FluxerToastVariant.danger,
                                    ),
                                  );
                            }
                            return;
                          }
                          ref
                              .read(toastProvider.notifier)
                              .show(
                                FluxerToast(message: l10n.guildNavbarCopied),
                              );
                        },
                ),
              ],
            ),
            SizedBox(height: context.layout.s2),
            Text(
              l10n.groupDmInviteExpires24Hours,
              style: context.textStyles.timestamp.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
