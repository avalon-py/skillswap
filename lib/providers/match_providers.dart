import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/match.dart';
import '../models/user_profile.dart';
import '../services/match_service.dart';
import 'auth_providers.dart';
import 'profile_providers.dart';

final matchServiceProvider = Provider<MatchService>((ref) {
  ref.keepAlive();
  return MatchService(firestore: ref.watch(firestoreProvider));
});

final myMatchesStreamProvider = StreamProvider<List<Match>>((ref) {
  ref.keepAlive();
  final user = ref.watch(authStateProvider).value;
  if (user == null) return Stream.value(const []);
  return ref.watch(matchServiceProvider).streamMyMatches(myUid: user.uid);
});

final matchByIdProvider =
    StreamProvider.family<Match?, String>((ref, matchId) {
  ref.keepAlive();
  return ref.watch(matchServiceProvider).streamMatch(matchId: matchId);
});

final userByIdProvider =
    StreamProvider.family<UserProfile?, String>((ref, uid) {
  ref.keepAlive();
  return ref.watch(profileServiceProvider).watchProfile(uid);
});
