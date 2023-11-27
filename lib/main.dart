import 'package:flutter/material.dart';

import '../utils/app_theme.dart';
import 'home_page.dart';

void main() => runApp(
      MaterialApp(
        theme: AppTheme.appTheme,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
