import 'package:fantacy_user/commons/all.dart';
import '../../../../commons/Headerwidget.dart';
import '../../../../responsive/scaling_query.dart';
import '../controllers/chat_controller.dart';
import '../controllers/chat_model.dart';
import 'Chat_conversion.dart';
import 'chat_header_view.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
       appBar: PreferredSize(
        preferredSize: ScalingQuery(context).height,
    child: Headerwidget(
    headername: Strings.chatHeader,
    )),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ChatHeaderView(),
                GetBuilder<ChatController>(
                  init: ChatController(),
                  builder: (controller) {
                    return ListView.builder(
                      shrinkWrap: true,
                    itemCount: controller.chatUser.length,
                    padding: EdgeInsets.only(top: 16),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      final user = controller.chatUser[index];
                      return ConversationList(
                        name: user.name,
                        messageText: user.messageText,
                        imageUrl: user.image,
                        time: user.time,
                        isMessageRead: (index == 0 || index == 3)?true:false,
                        onTap: (){
                          print("hii");
                          Get.to(() => ChatDetailPage(title: user.name, status: user.time,));
                          // controller.title = user;
                        },
                      );
                    },
                  );
                  }
                ),
              ],
            ),
          ),
        ),
    );
  }
}
