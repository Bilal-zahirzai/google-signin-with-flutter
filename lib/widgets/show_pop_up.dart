import 'package:flutter/cupertino.dart';

import '../utils/constant.dart';

class ShowPopUp extends StatefulWidget {
  final VoidCallback onPressedCamera;
  final VoidCallback onPressedPhotos;
  const ShowPopUp({Key? key, required this.onPressedCamera, required this.onPressedPhotos}) : super(key: key);

  @override
  State<ShowPopUp> createState() => _ShowPopUpState();
}

class _ShowPopUpState extends State<ShowPopUp> {

  @override
  Widget build(BuildContext context) {
    return
      CupertinoActionSheet(
        title: Text(
          "Select Profile Picture",
          style: headingStyle2,
        ),
        message: Text("Select Any Action :",style:subTitleStyle ,),
        actions:  [
          CupertinoActionSheetAction(
            onPressed:widget.onPressedCamera,
            isDefaultAction: true,
            child:const Text("Open Camera"),
          ),
          CupertinoActionSheetAction(
            onPressed:widget.onPressedPhotos,
            isDefaultAction: true,
            child:const Text("Open Photos"),
          ),
        ],
        cancelButton:CupertinoActionSheetAction(
          onPressed: (){
            Navigator.pop(context);
          },
          isDestructiveAction: true,
          child:const Text("Cancel"),
        ),
      );

  }
}
