import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './widgets/bottom_bar.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import './providers/categories.dart';
import './screens/category_select_screen.dart';
import './screens/loading_screen.dart';
import './providers/quiz_provider.dart';

void main() => runApp(QuizandoApp());

// final primaryColor = Color.fromRGBO(97, 80, 139, 1);
// final secondaryColor = Color.fromRGBO(230, 154, 141, 1);
final textTitleColor = Color(0xff404040);
final primaryColor = Color.fromRGBO(40, 51, 74, 1.00);
final secondaryColor = Color.fromRGBO(251, 222, 68, 1.00);
// final questionColor = Color.fromRGBO(246, 80, 88, 1.00);
final scaffoldColor = Color(0xffffffe4);

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
            headline4: GoogleFonts.satisfy(
              color: secondaryColor,
              letterSpacing: 1.2,
              fontSize: 45,
            ),
            headline5: GoogleFonts.merienda(
              color: secondaryColor,
              fontWeight: FontWeight.w600,
            ),
            headline6: GoogleFonts.merienda(
              color: textTitleColor,
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
          iconTheme: IconThemeData(
            color: secondaryColor,
            size: 30,
          ),
          scaffoldBackgroundColor: scaffoldColor,
          primaryColor: primaryColor,
          accentColor: secondaryColor,
          textSelectionColor: textTitleColor,
        ),
        home: LoadingScreen(),
        routes: {
          CategorySelectScreen.routeName: (ctx) => CategorySelectScreen(),
          HomeScreen.routeName : (ctx) => HomeScreen(),
          BottomBar.routeName: (ctx) => BottomBar(),
        },
      ),
    );
  }
}
