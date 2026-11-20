import 'package:dio/dio.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show ProviderListenable;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/invite_embed_provider.dart';
import 'package:fluxer_app/features/gifts/providers/gift_embed_provider.dart';
import 'package:fluxer_dart/export.dart';

DioException _dioError(String path, {int? statusCode}) {
  final RequestOptions options = RequestOptions(path: path);
  return DioException(
    requestOptions: options,
    type: statusCode == null
        ? DioExceptionType.connectionError
        : DioExceptionType.badResponse,
    response: statusCode == null
        ? null
        : Response<void>(requestOptions: options, statusCode: statusCode),
  );
}

class _FakeInvitesApi extends Fake implements InvitesApi {
  int calls = 0;
  bool offline = false;

  @override
  Future<InviteResponseSchema> getInvite({required String inviteCode}) {
    calls += 1;
    return Future<InviteResponseSchema>.error(
      _dioError('/invites/$inviteCode', statusCode: offline ? null : 404),
    );
  }
}

class _FakeGiftsApi extends Fake implements GiftsApi {
  int calls = 0;
  bool offline = false;

  @override
  Future<GiftCodeResponse> getGiftCode({required String code}) async {
    calls += 1;
    if (offline) {
      throw _dioError('/gifts/$code');
    }
    return GiftCodeResponse(
      code: code,
      durationType: GiftCodeDurationTypeSchema.months,
      durationQuantity: 1,
      redeemed: false,
    );
  }
}

class _FakeFluxerClient extends FluxerClient {
  _FakeFluxerClient(this._invites, this._gifts) : super(Dio());

  final InvitesApi _invites;
  final GiftsApi _gifts;

  @override
  InvitesApi get invites => _invites;

  @override
  GiftsApi get gifts => _gifts;
}

void main() {
  late _FakeInvitesApi invites;
  late _FakeGiftsApi gifts;

  setUp(() {
    invites = _FakeInvitesApi();
    gifts = _FakeGiftsApi();
  });

  ProviderContainer createContainer() => ProviderContainer(
    overrides: [
      fluxerClientProvider.overrideWithValue(_FakeFluxerClient(invites, gifts)),
    ],
    retry: (int retryCount, Object error) => null,
  );

  void visit(
    FakeAsync async,
    ProviderContainer container,
    ProviderListenable<Object?> provider,
  ) {
    final ProviderSubscription<Object?> subscription = container.listen(
      provider,
      (Object? _, Object? _) {},
    );
    async.flushMicrotasks();
    subscription.close();
    async.flushMicrotasks();
  }

  test('invite embeds are reused across visits until idle for the TTL', () {
    fakeAsync((FakeAsync async) {
      final ProviderContainer container = createContainer();
      addTearDown(container.dispose);
      final provider = inviteEmbedProvider('abc');

      visit(async, container, provider);
      expect(invites.calls, 1);

      async.elapse(kInviteEmbedIdleRetention - const Duration(seconds: 1));
      visit(async, container, provider);
      expect(invites.calls, 1);
      expect(container.read(provider).value, isA<InviteEmbedNotFound>());

      async.elapse(kInviteEmbedIdleRetention + const Duration(seconds: 1));
      visit(async, container, provider);
      expect(invites.calls, 2);
    });
  });

  test('invite embeds that failed to load are refetched on the next visit', () {
    fakeAsync((FakeAsync async) {
      final ProviderContainer container = createContainer();
      addTearDown(container.dispose);
      invites.offline = true;
      final provider = inviteEmbedProvider('abc');

      visit(async, container, provider);
      async.elapse(const Duration(seconds: 1));
      visit(async, container, provider);
      expect(invites.calls, 2);
    });
  });

  test('gift embeds are reused across visits until idle for the TTL', () {
    fakeAsync((FakeAsync async) {
      final ProviderContainer container = createContainer();
      addTearDown(container.dispose);
      final provider = giftEmbedProvider('gift-code');

      visit(async, container, provider);
      container.read(provider.notifier).markRedeemed();
      async.elapse(kGiftEmbedIdleRetention - const Duration(seconds: 1));
      visit(async, container, provider);
      expect(gifts.calls, 1);
      final GiftEmbedState? state = container.read(provider).value;
      expect(state, isA<GiftEmbedLoaded>());
      expect((state! as GiftEmbedLoaded).gift.redeemed, isTrue);

      async.elapse(kGiftEmbedIdleRetention + const Duration(seconds: 1));
      visit(async, container, provider);
      expect(gifts.calls, 2);
    });
  });

  test('gift embeds that failed to load are refetched on the next visit', () {
    fakeAsync((FakeAsync async) {
      final ProviderContainer container = createContainer();
      addTearDown(container.dispose);
      gifts.offline = true;
      final provider = giftEmbedProvider('gift-code');

      visit(async, container, provider);
      async.elapse(const Duration(seconds: 1));
      visit(async, container, provider);
      expect(gifts.calls, 2);
    });
  });
}
