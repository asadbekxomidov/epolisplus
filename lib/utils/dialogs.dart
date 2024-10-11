// import 'package:flutter/material.dart';

// void showErrorMessageDialog(BuildContext context, String message) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Error'),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('ok'),
//           ),
//         ],
//       );
//     },
//   );
// }

import 'package:flutter/material.dart';

void showErrorMessageSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.redAccent,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    duration: Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

// import 'package:flutter/material.dart';

// void showErrorMessageSnackBar(BuildContext context, String message) {
//   // Create an overlay entry
//   final overlay = Overlay.of(context);
//   final overlayEntry = OverlayEntry(
//     builder: (context) => Positioned(
//       top: 0,
//       left: 0,
//       right: 0,
//       child: SafeArea(
//         child: Material(
//           color: Colors.transparent,
//           child: SlideInSnackBar(
//             message: message,
//           ),
//         ),
//       ),
//     ),
//   );

//   overlay.insert(overlayEntry);

//   Future.delayed(Duration(seconds: 3)).then((_) => overlayEntry.remove());
// }

// class SlideInSnackBar extends StatefulWidget {
//   final String message;

//   const SlideInSnackBar({Key? key, required this.message}) : super(key: key);

//   @override
//   _SlideInSnackBarState createState() => _SlideInSnackBarState();
// }

// class _SlideInSnackBarState extends State<SlideInSnackBar>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _offsetAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );

//     _offsetAnimation = Tween<Offset>(
//       begin: Offset(0.0, -1.0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeOut,
//     ));

//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SlideTransition(
//       position: _offsetAnimation,
//       child: Container(
//         margin: const EdgeInsets.all(16),
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.redAccent,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Text(
//                 widget.message,
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               ),
//             ),
//             IconButton(
//               icon: Icon(Icons.close, color: Colors.white),
//               onPressed: () {
//                 _controller.reverse().then((_) {
//                   Overlay.of(context).dispose();
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
