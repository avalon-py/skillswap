import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'providers/auth_providers.dart';
import 'providers/profile_providers.dart';
import 'screens/me_screen.dart';
import 'screens/profile_edit_screen.dart';
import 'screens/profile_setup_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/swaps_screen.dart';

// TODO: Add remaining imports as teammates contribute their screens

class _RouterRefresh extends ChangeNotifier {
  _RouterRefresh(Ref ref) {
    ref.listen(authStateProvider, (_, __) => notifyListeners());
    ref.listen(currentProfileProvider, (_, __) => notifyListeners());
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  ref.keepAlive();
  final refresh = _RouterRefresh(ref);

  return GoRouter(
    initialLocation: '/me',
    refreshListenable: refresh,
    routes: [
      GoRoute(path: '/me',            builder: (_, __) => const MeScreen()),
      GoRoute(path: '/profile-edit',  builder: (_, __) => const ProfileEditScreen()),
      GoRoute(path: '/profile-setup', builder: (_, __) => const ProfileSetupScreen()),
      GoRoute(path: '/settings',      builder: (_, __) => const SettingsScreen()),
      GoRoute(path: '/swaps',         builder: (_, __) => const SwapsScreen()),
    ],
  );
});