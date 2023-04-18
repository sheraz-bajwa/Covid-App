import 'package:flutter/material.dart';

class Round extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback ontap;
  const Round(
      {super.key,
      required this.title,
      required this.ontap,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 45),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 253, 152, 0),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: loading
              ? CircularProgressIndicator()
              : Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
        ),
      ),
    );
  }
}
