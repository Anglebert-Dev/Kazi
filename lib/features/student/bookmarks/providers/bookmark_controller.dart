import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../authentication/providers/auth_providers.dart';
import 'bookmark_providers.dart';

part 'bookmark_controller.g.dart';

@riverpod
class BookmarkController extends _$BookmarkController {
  @override
  FutureOr<void> build() {}

  Future<void> toggle(String opportunityId, bool bookmarked) async {
    final uid = ref.read(authRepositoryProvider).currentUserId;
    if (uid == null) return;

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(bookmarkRepositoryProvider).setBookmarked(uid, opportunityId, bookmarked),
    );
  }
}
