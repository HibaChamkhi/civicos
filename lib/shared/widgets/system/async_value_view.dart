import 'package:civicos/app/theme/tokens.dart';
import 'package:civicos/core/errors/app_failure.dart';
import 'package:civicos/shared/widgets/system/error_state.dart';
import 'package:civicos/shared/widgets/ui/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Renders every state of a Riverpod [AsyncValue] (loading, error, empty
/// and data) so no screen can forget one.
class AsyncValueView<T> extends StatelessWidget {
  const AsyncValueView({
    required this.value,
    required this.data,
    required this.empty,
    super.key,
    this.isEmpty,
    this.onRetry,
    this.loading,
  });

  final AsyncValue<T> value;
  final Widget Function(T data) data;

  /// Shown when [isEmpty] returns true for the loaded data.
  final Widget empty;
  final bool Function(T data)? isEmpty;
  final VoidCallback? onRetry;

  /// Custom loading placeholder; defaults to three skeleton lines.
  final Widget? loading;

  @override
  Widget build(BuildContext context) {
    return switch (value) {
      AsyncData(:final value) =>
        (isEmpty?.call(value) ?? false) ? empty : data(value),
      AsyncError(:final error) => ErrorState(
        failure: AppFailure.from(error),
        onRetry: onRetry,
      ),
      AsyncLoading() => loading ?? const _DefaultLoading(),
    };
  }
}

class _DefaultLoading extends StatelessWidget {
  const _DefaultLoading();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: Space.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Skeleton(width: 180, height: 22),
          SizedBox(height: Space.sm),
          Skeleton(),
          SizedBox(height: Space.xs),
          Skeleton(width: 240),
        ],
      ),
    );
  }
}
