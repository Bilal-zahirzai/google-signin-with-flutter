import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function function;
  final bool isLoading;

   const CustomButton({required this.function,this.isLoading=false, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => function(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          width: double.infinity,
          height: 42,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
          child: isLoading ? const CircularProgressIndicator(strokeWidth: 3,color:Colors.white)
              :Text(
             title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
