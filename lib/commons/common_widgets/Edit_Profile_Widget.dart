import 'package:fantacy_user/commons/all.dart';

class Edit_Profile_Widget extends StatelessWidget {
  final icon;
  final text;
  const Edit_Profile_Widget({super.key, this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      margin: EdgeInsets.symmetric(horizontal: 20.px),
      height: 51,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.symmetric(
            horizontal: BorderSide(color: Colors.grey, width: 0.2),
            vertical: BorderSide(color: Colors.grey, width: 0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.3),
            // color: Color(0xffDDDDDD),
            blurRadius: 5.0,
            spreadRadius: 1.0,
            offset: Offset(0.0, 0.0),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(width: 40, child: icon),
            // SvgPicture.string(pushnotification)),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        text,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3F2037),
                            fontFamily: "Dmsans",
                            fontSize: 20),
                      ),
                    ),
                  ),
                  //   Container(
                  //     child: CupertinoSwitch(
                  //       value: switchValue,
                  //       thumbColor: const Color.fromRGBO(
                  //           30, 157, 194, 0.59),
                  //       activeColor: Colors.white,
                  //       trackColor: Colors.white,
                  //       // Current state of the switch
                  //       onChanged: (value) {
                  //         setState(() {
                  //           switchValue =
                  //               value; // Update the switch state
                  //         });
                  //       },
                  //     ),
                  //   ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  
  }
}
