import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_profile.dart';
import '../services/discovery_service.dart';
import '../services/swipe_service.dart';
import '../utils/swap_fit.dart';
import 'auth_providers.dart';
import 'profile_providers.dart';

final discoveryServiceProvider = Provider<DiscoveryService>((ref) {
  ref.keepAlive();
  return DiscoveryService(firestore: ref.watch(firestoreProvider));
});

final swipeServiceProvider = Provider<SwipeService>((ref) {
  ref.keepAlive();
  return SwipeService(firestore: ref.watch(firestoreProvider));
});

final candidatesProvider =
    FutureProvider.autoDispose<List<UserProfile>>((ref) async {
  final user = ref.watch(authStateProvider).value;
  if (user == null) return [];

  final candidates = await ref
      .watch(discoveryServiceProvider)
      .fetchCandidates(currentUid: user.uid);

  // Sort by swap fit descending — wait for profile, fall back to unsorted
  final myProfile = await ref.watch(currentProfileProvider.future);
  if (myProfile == null) return candidates;

  candidates.sort((a, b) {
    final fitA = swapFitPercent(
      mySkillsOffered: myProfile.skillsOffered,
      mySkillsWanted: myProfile.skillsWanted,
      theirSkillsOffered: a.skillsOffered,
      theirSkillsWanted: a.skillsWanted,
    );
    final fitB = swapFitPercent(
      mySkillsOffered: myProfile.skillsOffered,
      mySkillsWanted: myProfile.skillsWanted,
      theirSkillsOffered: b.skillsOffered,
      theirSkillsWanted: b.skillsWanted,
    );
    return fitB.compareTo(fitA);
  });

  return candidates;
});
