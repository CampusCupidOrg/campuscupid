import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 100,
          ),
          const Text(
            'Campus Cupid',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: const Text('Signup'),
            onPressed: () async {
              Navigator.pushReplacementNamed(context, '/home');
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return const OPT();
              // }));
            },
          ),
        ],
      ),
    ));
  }
}

// class OPT extends StatefulWidget {
//   const OPT({super.key});

//   @override
//   State<OPT> createState() => _OPTState();
// }

// class _OPTState extends State<OPT> {
//   final _otpController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: Hero(
//         tag: "otp",
//         child: Column(
//           children: <Widget>[
//             const SizedBox(
//               height: 100,
//             ),
//             const Text(
//               'Campus Cupid',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(
//               height: 50,
//             ),
//             TextField(
//               controller: _otpController,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Enter OTP',
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               child: const Text('OTP'),
//               onPressed: () async {
//                 Navigator.pushReplacementNamed(context, '/home');
//                 // final pref = await SharedPreferences.getInstance();
//                 // final userId = _otpController.text.split('@')[0];
//                 // pref.setString('userId', userId);
//               },
//             ),
//           ],
//         ),
//       ),
//     ));
//     ;
//   }
// }
