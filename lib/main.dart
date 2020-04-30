import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import './providers/categories.dart';
import './screens/category_select_screen.dart';
import './screens/loading_screen.dart';
import './providers/quiz_provider.dart';

void main() => runApp(QuizandoApp());

final primaryColor = Color.fromRGBO(97, 80, 139, 1);
final secondaryColor = Color.fromRGBO(230, 154, 141, 1);

class QuizandoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => QuizProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Categories(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quizando',
        theme: ThemeData(
          textTheme: TextTheme(
            headline4: GoogleFonts.merienda(
              color: secondaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          iconTheme: IconThemeData(
            color: secondaryColor,
            size: 35,
          ),
          primaryColor: primaryColor,
          accentColor: secondaryColor,
        ),
        home: LoadingScreen(),
        routes: {
          CategorySelectScreen.routeName: (ctx) => CategorySelectScreen(),
        },
      ),
    );
  }
}
