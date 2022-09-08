import 'package:flutter/material.dart';

const String apiKey = 'add_your_api_key';
const String baseUrl = 'https://newsapi.org/v2/top-headlines?';
const String language = 'language=en';
const String country = 'country=us';

var personAppbar = Container(
  height: 50,
  width: 50,
  decoration: const BoxDecoration(
    shape: BoxShape.circle,
  ),
  child: Image.asset(
    'assets/images/profile.png',
    fit: BoxFit.cover,
  ),
);
