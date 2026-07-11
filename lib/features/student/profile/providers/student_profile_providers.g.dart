// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_profile_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$studentProfileRepositoryHash() =>
    r'0ab91932aab321d8bbb6ee0ff7ffbf6064194676';

/// See also [studentProfileRepository].
@ProviderFor(studentProfileRepository)
final studentProfileRepositoryProvider =
    AutoDisposeProvider<StudentProfileRepository>.internal(
      studentProfileRepository,
      name: r'studentProfileRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$studentProfileRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef StudentProfileRepositoryRef =
    AutoDisposeProviderRef<StudentProfileRepository>;
String _$currentStudentProfileHash() =>
    r'c281496c2e929dab9c3c13afa86693bb95956cbc';

/// See also [currentStudentProfile].
@ProviderFor(currentStudentProfile)
final currentStudentProfileProvider =
    AutoDisposeStreamProvider<StudentProfile>.internal(
      currentStudentProfile,
      name: r'currentStudentProfileProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$currentStudentProfileHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentStudentProfileRef = AutoDisposeStreamProviderRef<StudentProfile>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
