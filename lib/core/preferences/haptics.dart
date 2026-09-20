import 'package:civicos/core/preferences/preferences_controllers.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A light selection tick, unless haptics are off or calm mode is on.
Future<void> selectionHaptic(WidgetRef ref) async {
  final enabled = ref.read(hapticsControllerProvider);
  final calm = ref.read(comfortControllerProvider).calmMode;
  if (enabled && !calm) {
    await HapticFeedback.selectionClick();
  }
}
