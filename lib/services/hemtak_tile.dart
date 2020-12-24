// import 'package:hemtak_app/services/hemtak.dart';
// import 'package:flutter/material.dart';
//
// class HemtakTile extends StatelessWidget {
//
//   final Hemtak hemah;
//   HemtakTile({ this.hemah });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 8.0),
//       child: Card(
//         margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
//         child: ListTile(
//           leading: CircleAvatar(
//             radius: 25.0,
//             backgroundColor: Colors.brown[hemah.phone],
//           ),
//           title: Text(hemah.fullName),
//           subtitle: Text('Takes ${hemah.phone} sugar(s)'),
//         ),
//       ),
//     );
//   }
// }