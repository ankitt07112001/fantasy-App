import 'package:fantacy_user/commons/all.dart';
import 'model.dart';

class ChatController extends GetxController {



  // TODO: Implement ChatController
  List<ChatUsers> chatUser = [
    ChatUsers(
        name: "Jane Russel",
        messageText: "Awesome Setup",
        image: ImagePath.chatdp,
        time: "Now"),
    ChatUsers(
        name: "Glady's Murphy",
        messageText: "That's Great",
        image: ImagePath.chatdp,
        time: "Yesterday"),
    ChatUsers(
        name: "Jorge Henry",
        messageText: "Hey where are you?",
        image: ImagePath.chatdp,
        time: "31 Mar"),
    ChatUsers(
        name: "Philip Fox",
        messageText: "Busy! Call me in 20 mins",
        image: ImagePath.chatdp,
        time: "28 Mar"),
    ChatUsers(
        name: "Debra Hawkins",
        messageText: "Thankyou, It's awesome",
        image: ImagePath.chatdp,
        time: "23 Mar"),
    ChatUsers(
        name: "Jacob Pena",
        messageText: "will update you in evening",
        image: ImagePath.chatdp,
        time: "17 Mar"),
    ChatUsers(
        name: "Andrey Jones",
        messageText: "Can you please share the file?",
        image: ImagePath.chatdp,
        time: "24 Feb"),
    ChatUsers(
        name: "John Wick",
        messageText: "How are you?",
        image: ImagePath.chatdp,
        time: "18 Feb"),
    ChatUsers(
        name: "Jane Russel",
        messageText: "Awesome Setup",
        image: ImagePath.chatdp,
        time: "Now"),
    ChatUsers(
        name: "Glady's Murphy",
        messageText: "That's Great",
        image: ImagePath.chatdp,
        time: "Yesterday"),
    ChatUsers(
        name: "Jorge Henry",
        messageText: "Hey where are you?",
        image: ImagePath.chatdp,
        time: "31 Mar"),
    ChatUsers(
        name: "Philip Fox",
        messageText: "Busy! Call me in 20 mins",
        image: ImagePath.chatdp,
        time: "28 Mar"),
    ChatUsers(
        name: "Debra Hawkins",
        messageText: "Thankyou, It's awesome",
        image: ImagePath.chatdp,
        time: "23 Mar"),
    ChatUsers(
        name: "Jacob Pena",
        messageText: "will update you in evening",
        image: ImagePath.chatdp,
        time: "17 Mar"),
    ChatUsers(
        name: "Andrey Jones",
        messageText: "Can you please share the file?",
        image: ImagePath.chatdp,
        time: "24 Feb", ),
    ChatUsers(
        name: "John Wick",
        messageText: "How are you?",
        image: ImagePath.chatdp,
        time: "18 Feb"),
  ];

// final   title;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
