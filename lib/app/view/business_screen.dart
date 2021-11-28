// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, missing_return, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:newsapp/app/static/component/component.dart';

class BusinessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return buildCategoryArticle("business",context);
  }
}
