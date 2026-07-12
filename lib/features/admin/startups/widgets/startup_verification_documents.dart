import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../founder/startup/models/startup.dart';
import '../../../student/profile/widgets/profile_link_tile.dart';
import '../../categories/models/category_type.dart';
import '../../categories/providers/category_providers.dart';

class StartupVerificationDocuments extends ConsumerWidget {
  const StartupVerificationDocuments({super.key, required this.startup});

  final Startup startup;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final documents = ref
        .watch(categoriesByTypeProvider(CategoryType.verificationDocument))
        .valueOrNull;
    final labelById = {for (final doc in documents ?? []) doc.id: doc.label};

    return Column(
      children: [
        for (final entry in startup.verificationDocUrls.entries)
          ProfileLinkTile(
            icon: Icons.description,
            label: labelById[entry.key] ?? 'Document',
            actionLabel: 'View document',
            url: entry.value,
          ),
      ],
    );
  }
}
