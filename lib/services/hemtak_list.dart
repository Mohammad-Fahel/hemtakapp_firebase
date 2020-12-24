import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hemtak_app/HomePage/HomePageOfVolunteer.dart';
import 'package:hemtak_app/services/hemtak.dart';
import 'package:hemtak_app/services/hemtak_tile.dart';
import 'package:hemtak_app/services/user.dart';
import 'package:provider/provider.dart';

class HemtakList extends StatefulWidget {
  @override
  _HemtakListState createState() => _HemtakListState();
}

class _HemtakListState extends State<HemtakList> {
  @override
  Widget build(BuildContext context) {

    final hemtakInfo = Provider.of<List<Customer>>(context) ?? [];
    return ListView.builder(
        itemCount: hemtakInfo.length,
        itemBuilder: (context, index) {
          return MainName(emailUser: hemtakInfo[index]);
        }
    );
  }
}