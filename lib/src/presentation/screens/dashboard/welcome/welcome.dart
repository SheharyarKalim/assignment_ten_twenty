import 'package:flutter/material.dart';

import '../../../../config/styles/app_text_styles.dart';

class Welcome extends StatelessWidget {
  static const String id = "/WELCOME";

  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Welcome", style: AppTextStyles.instance.bold16,),
    );
  }
}
