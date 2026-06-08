import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/rating.dart';
import '../services/rating_service.dart';
export '../services/rating_service.dart' show RatingAggregate;
import 'profile_providers.dart';

final ratingServiceProvider = Provider<RatingService>((ref) {
  ref.keepAlive();
  return RatingService(firestore: ref.watch(firestoreProvider));
});

class MyRatingArgs {
  const MyRatingArgs({required this.matchId, required this.raterUid});
  final String matchId;
  final String raterUid;

  @override
  bool operator ==(Object other) =>
      other is MyRatingArgs &&
      other.matchId == matchId &&
      other.raterUid == raterUid;

  @override
  int get hashCode => Object.hash(matchId, raterUid);
}

final myRatingForMatchProvider =
    StreamProvider.family<Rating?, MyRatingArgs>((ref, args) {
  ref.keepAlive();
  return ref.watch(ratingServiceProvider).streamMyRatingForMatch(
        matchId: args.matchId,
        raterUid: args.raterUid,
      );
});

final userRatingAggregateProvider =
    StreamProvider.family<RatingAggregate, String>((ref, uid) {
  ref.keepAlive();
  return ref.watch(ratingServiceProvider).streamAggregateForUser(uid);
});
