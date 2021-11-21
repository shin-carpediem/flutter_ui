// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_element, avoid_unnecessary_containers, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_ui/core/course_card_domain.dart';
import 'package:flutter_ui/models/course_card_modal.dart';
import 'package:flutter_ui/widgets/icon_logo_widget.dart';

class Featured extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CourseCard>(
      create: (_) => CourseCard()..fetchCourseCard(),
      child: Column(
        children: [
          Consumer<CourseCard>(builder: (context, model, child) {
            final List<CourseCardModel>? courseCards = model.courseCards;

            if (courseCards == null) {
              return CircularProgressIndicator();
            }

            final List<Widget> widgets = courseCards
                .map((courseCard) => Container(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 24),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 32,
                                    ),
                                    child: Container(
                                      width: 320,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          Text(
                                            courseCard.title,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 16),
                                          Text(
                                            courseCard.subtitle,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: IconLogo(
                                  size: 48,
                                  url: courseCard.logoUrl,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
                .toList();

            return Column(children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: 32,
                  left: 8,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Featured',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                      // TODO: error
                      onPressed: () => buttonCarouselController.previousPage(
                        duration: Duration(milliseconds: 300),
                      ),
                      icon: Icon(Icons.navigate_before),
                    ),
                  ),
                  CarouselSlider(
                    items: widgets,
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      // TODO: error
                      onPressed: () => buttonCarouselController.nextPage(
                        duration: Duration(milliseconds: 300),
                      ),
                      icon: Icon(Icons.navigate_next),
                    ),
                  ),
                ],
              ),
            ]);
          }),
        ],
      ),
    );
  }
}
