// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(learningRepository)
final learningRepositoryProvider = LearningRepositoryProvider._();

final class LearningRepositoryProvider
    extends
        $FunctionalProvider<
          LearningRepository,
          LearningRepository,
          LearningRepository
        >
    with $Provider<LearningRepository> {
  LearningRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'learningRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$learningRepositoryHash();

  @$internal
  @override
  $ProviderElement<LearningRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LearningRepository create(Ref ref) {
    return learningRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LearningRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LearningRepository>(value),
    );
  }
}

String _$learningRepositoryHash() =>
    r'9b7105401ce18e52ef1cccd835bac05461cfe1dd';

@ProviderFor(lessons)
final lessonsProvider = LessonsProvider._();

final class LessonsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Lesson>>,
          List<Lesson>,
          FutureOr<List<Lesson>>
        >
    with $FutureModifier<List<Lesson>>, $FutureProvider<List<Lesson>> {
  LessonsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lessonsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lessonsHash();

  @$internal
  @override
  $FutureProviderElement<List<Lesson>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Lesson>> create(Ref ref) {
    return lessons(ref);
  }
}

String _$lessonsHash() => r'31de34656a0ab4acd0c464a152704c07a47ad430';

/// The lesson to offer next: the one in progress, else the first unstarted.

@ProviderFor(lessonToContinue)
final lessonToContinueProvider = LessonToContinueProvider._();

/// The lesson to offer next: the one in progress, else the first unstarted.

final class LessonToContinueProvider
    extends $FunctionalProvider<AsyncValue<Lesson?>, Lesson?, FutureOr<Lesson?>>
    with $FutureModifier<Lesson?>, $FutureProvider<Lesson?> {
  /// The lesson to offer next: the one in progress, else the first unstarted.
  LessonToContinueProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lessonToContinueProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lessonToContinueHash();

  @$internal
  @override
  $FutureProviderElement<Lesson?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Lesson?> create(Ref ref) {
    return lessonToContinue(ref);
  }
}

String _$lessonToContinueHash() => r'becb4a997bf8137fee07ffef9c1172121c209a04';
