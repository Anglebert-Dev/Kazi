import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/opportunity.dart';
import 'opportunity_providers.dart';

part 'opportunity_controller.g.dart';

@riverpod
class OpportunityController extends _$OpportunityController {
  @override
  FutureOr<void> build() {}

  Future<void> create(Opportunity opportunity) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(opportunityRepositoryProvider).create(opportunity),
    );
  }

  Future<void> save(Opportunity opportunity) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(opportunityRepositoryProvider).update(opportunity),
    );
  }

  Future<void> delete(String id) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(opportunityRepositoryProvider).delete(id));
  }
}
