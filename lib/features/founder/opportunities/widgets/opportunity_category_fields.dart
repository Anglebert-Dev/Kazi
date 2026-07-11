import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/index.dart';
import '../../../admin/categories/models/category_type.dart';
import '../../../admin/categories/providers/category_providers.dart';
import '../../../student/profile/widgets/skill_chip_selector.dart';

class OpportunityCategoryFields extends ConsumerWidget {
  const OpportunityCategoryFields({
    super.key,
    required this.selectedCategory,
    required this.onCategoryChanged,
    required this.selectedSkills,
    required this.onSkillsChanged,
  });

  final String? selectedCategory;
  final ValueChanged<String> onCategoryChanged;
  final List<String> selectedSkills;
  final ValueChanged<List<String>> onSkillsChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref
        .watch(categoriesByTypeProvider(CategoryType.opportunityCategory))
        .valueOrNull
        ?.map((category) => category.label)
        .toList();
    final skills = ref
        .watch(categoriesByTypeProvider(CategoryType.skill))
        .valueOrNull
        ?.map((category) => category.label)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Category'),
        const SizedBox(height: AppSpacing.sm),
        if (categories == null)
          const Center(child: CircularProgressIndicator())
        else if (categories.isEmpty)
          const Text('No categories set up yet — ask an admin to add some.')
        else
          SingleSelectChipGroup(
            options: categories,
            selected: selectedCategory,
            onChanged: onCategoryChanged,
          ),
        const SizedBox(height: AppSpacing.lg),
        const SectionHeader(title: 'Required skills'),
        const SizedBox(height: AppSpacing.sm),
        if (skills == null)
          const Center(child: CircularProgressIndicator())
        else if (skills.isEmpty)
          const Text('No skills set up yet — ask an admin to add some.')
        else
          SkillChipSelector(
            options: skills,
            selected: selectedSkills,
            onChanged: onSkillsChanged,
          ),
      ],
    );
  }
}
