// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/featured_each_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';

// ignore: must_be_immutable
class Featured extends HookConsumerWidget {
  CarouselController buttonCarouselController = CarouselController();
  Featured({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('courseCard').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          return Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 32, left: 8),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Featured',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                      onPressed: () => buttonCarouselController.previousPage(
                        duration: Duration(milliseconds: 300),
                      ),
                      icon: const Icon(Icons.navigate_before),
                    ),
                  ),
                  CarouselSlider(
                    // TODO:
                    // items: featuredEach(snapshot),
                    items: [Text('hoge'), Text('hoge')],
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      onPressed: () => buttonCarouselController.nextPage(
                        duration: Duration(milliseconds: 300),
                      ),
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
