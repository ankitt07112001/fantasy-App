import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ChatHeaderView extends GetView {
  const ChatHeaderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: <Widget>[
        //     Text("Conversations",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
        //     Container(
        //       padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
        //       height: 30,
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(30),
        //         color: Colors.pink[50],
        //       ),
        //       child: Row(
        //         children: <Widget>[
        //           Icon(Icons.add,color: Colors.pink,size: 20,),
        //           SizedBox(width: 2,),
        //           Text("Add New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
        //         ],
        //       ),
        //     )
        //   ],
        // ).paddingOnly(left: 16,right: 16,top: 16),
        TextField(
          decoration: InputDecoration(
            hintText: "Search...",
            hintStyle: TextStyle(color: Colors.grey.shade600),
            prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
            filled: true,
            fillColor: Colors.grey.shade100,
            contentPadding: EdgeInsets.all(8),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: Colors.grey.shade100
                )
            ),
          ),
        ).paddingOnly(top: 16,left: 16,right: 16),
      ],
    );
  }
}
