import 'package:enquete/controllers/enquete_controller.dart';
import 'package:enquete/models/enquete_model.dart';
import 'package:flutter/material.dart';

class EnquetePage extends StatefulWidget {
  const EnquetePage({super.key});

  @override
  State<EnquetePage> createState() => _EnquetePageState();
}

class _EnquetePageState extends State<EnquetePage> {
  final EnqueteController enqueteController = EnqueteController();
  final PageController _pageController = PageController();

  @override
  void initState() {
    enqueteController.getEnquete();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: const Color.fromRGBO(20, 21, 25, 1),
      child: Center(
          child: EnqueteBuild(enqueteController, _pageController,
context)
              .buildEnquete()),
    ));
  }
}
