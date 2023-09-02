part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}
class MessageSuccess extends ChatState {
  List<MessageModel> messages;
  MessageSuccess({required this.messages});
}
