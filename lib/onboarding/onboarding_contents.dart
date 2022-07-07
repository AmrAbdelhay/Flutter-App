import 'package:flutter/material.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents(
      {required this.title, required this.image, required this.desc});
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Communication ",
    image: "assets/images/image1.png",
    desc: "Communication with people is one of the most important arts because of their different natures.",
  ),
  OnboardingContents(
    title: "Stay organized with team",
    image: "assets/images/image2.png",
    desc:
    "One gets a good experience in life.",
  ),
  OnboardingContents(
    title: "Get notified when work happens",
    image: "assets/images/image3.png",
    desc:
    "Increases the bonding of valuable and lasting relationships.",
  ),
];
