import 'package:fantacy_user/commons/all.dart';
import 'package:flutter/cupertino.dart';

class My_TextField_Widget extends StatelessWidget {
  final hintname;
  const My_TextField_Widget({super.key, this.hintname});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.px),
      child: Card(
        elevation: 1,
        child: TextFormField(
          // controller: myController.email,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (msg) {
            return null;
          },

          decoration: InputDecoration(
            hintText: hintname,
            hintStyle: TextStyle(color: Color(0xff979899), fontSize: 16.px),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.px)),
          ),
        ),
      ),
    );
  }
}
