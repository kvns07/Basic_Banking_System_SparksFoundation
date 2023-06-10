import 'package:flutter/material.dart';

class eCustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Widget addIcon;
  final VoidCallback onpressed;
  final bool isSuccess;

  eCustomDialog({
    required this.title,
    required this.description,
    required this.buttonText,
    required this.addIcon,
    required this.onpressed,
    this.isSuccess = false,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 100,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: const EdgeInsets.only(
            top: 16,
          ),
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: isSuccess ? Colors.blue : Colors.red,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: onpressed,
                  child: Text(buttonText),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: 0,
            left: 16,
            right: 16,
            child: CircleAvatar(
              backgroundColor: isSuccess ? Colors.blue : Colors.red,
              radius: 50,
              child: addIcon,
            ))
      ],
    );
  }
}
