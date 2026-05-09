import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final String title;
  final int initialValue;

  const CustomContainer({
    super.key,
    required this.title,
    required this.initialValue, required this.value, required this.onIncrement, required this.onDecrement,
  });

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff1A1F38),
          boxShadow: const [
            BoxShadow(
              color: Color(0xff1A1F38),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),

        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.initialValue.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton( style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
                  onPressed: (){
                    widget.onDecrement();
                  },
                  icon: const Icon(
                    Icons.remove,
                    color: Color(0xff1A1F38),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                  onPressed: (){
                    widget.onIncrement();
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Color(0xff1A1F38),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}