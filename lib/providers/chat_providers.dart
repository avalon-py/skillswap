import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/message.dart';
import '../services/chat_service.dart';
import 'profile_providers.dart';

final chatServiceProvider = Provider<ChatService>((ref) {
  ref.keepAlive();
  return ChatService(firestore: ref.watch(firestoreProvider));
});

final messagesStreamProvider =
    StreamProvider.family<List<Message>, String>((ref, matchId) {
  ref.keepAlive();
  return ref.watch(chatServiceProvider).streamMessages(matchId: matchId);
});

final lastMessageProvider =
    StreamProvider.family<Message?, String>((ref, matchId) {
  ref.keepAlive();
  return ref.watch(chatServiceProvider).streamLastMessage(matchId: matchId);
});
