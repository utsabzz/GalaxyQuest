import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
// import 'consts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Monteserrat',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        // useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        '/view_solar_system': (context) => SolarSystemScreen(),
        '/black_hole': (context) => BlackHoleScreen(),
        '/space_game': (context) => SpaceGameScreen(),
        '/education_center': (context) => EducationCenterScreen(),
        '/quiz': (context) => QuizScreen(),
        '/nasa': (context) => NasaScreen(),
        '/isro': (context) => IsroScreen(),
        '/space_discoveries': (context) => SpaceDiscoveriesScreen(),
        '/space_instruments': (context) => SpaceInstrumentsScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Galaxy Quest',
          style: TextStyle(
            // Use your custom font family name
            fontWeight: FontWeight.bold, // Set the font weight to bold
          ),
        ),
      ),
      body: Column(
        children: [
          // Add your team logo above the card grid
          Padding(
            padding: const EdgeInsets.all(16.0), // Adjust the padding as needed
            child: Image.asset(
              'assets/images/team.png', // Replace with the actual path to your team logo image.
              width: 500, // Adjust the width as needed
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: calculateCrossAxisCount(context),
              children: [
                CardItem(
                  title: 'View Solar System',
                  routeName: '/view_solar_system',
                  imageAsset: 'assets/images/solar_system_image.png',
                ),
                CardItem(
                  title: 'Black Hole',
                  routeName: '/black_hole',
                  imageAsset: 'assets/images/black_hole_image.png',
                ),
                CardItem(
                  title: 'Space Game',
                  routeName: '/space_game',
                  imageAsset: 'assets/images/space_game_image.png',
                ),
                CardItem(
                  title: 'Education Center',
                  routeName: '/education_center',
                  imageAsset: 'assets/images/education_center_image.png',
                ),
                CardItem(
                  title: 'Quiz',
                  routeName: '/quiz',
                  imageAsset: 'assets/images/quiz_image.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int calculateCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 600) {
      return 4; // For larger screens, show more cards in a row.
    } else {
      return 2; // For smaller screens, show fewer cards in a row.
    }
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final String routeName;
  final String imageAsset;

  CardItem(
      {super.key,
      required this.title,
      required this.routeName,
      required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(routeName);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageAsset, height: 100),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class SolarSystemScreen extends StatelessWidget {
  SolarSystemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'View Solar System',
            style: TextStyle(
              // Use your custom font family name
              fontWeight: FontWeight.bold, // Set the font weight to bold
            ),
          ),
        ),
        body: ModelViewer(
          src: "assets/dhut.glb",
          backgroundColor: Colors.black,
          autoPlay: true,
          autoRotate: true,
        )
        // BabylonJSViewer(src: "assets/solarsystem.glb",)
        );
  }
}

class BlackHoleScreen extends StatelessWidget {
  BlackHoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Black Hole',
          style: TextStyle(
            // Use your custom font family name
            fontWeight: FontWeight.bold, // Set the font weight to bold
          ),
        ),
      ),
      body: Center(
          child: ModelViewer(
        src: "assets/blackhole.glb",
        backgroundColor: Colors.black,
        autoPlay: true,
        autoRotate: true,
      )),
    );
  }
}

class SpaceGameScreen extends StatelessWidget {
  SpaceGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Space Game',
          style: TextStyle(
            // Use your custom font family name
            fontWeight: FontWeight.bold, // Set the font weight to bold
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 5000,
          child: HtmlWidget(
            '<iframe src="https://spaceshootertitans.netlify.app/"></iframe>',
            factoryBuilder: () => MyWidgetFactory(),
          ),
        ),
      ),
    );
  }
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {}

class EducationCenterScreen extends StatelessWidget {
  EducationCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Education Center',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 1000,
          child: ListView(
            children: [
              CardItem(
                title: 'Nasa',
                // Add the route name or action you want for NASA here
                routeName: '/nasa',
                imageAsset: 'assets/images/nasa.png',
              ),
              CardItem(
                title: 'Hyporthetical Theories',
                // Add the route name or action you want for ISRO here
                routeName: '/isro',
                imageAsset: 'assets/images/isro.png',
              ),
              CardItem(
                title: 'Space Discoveries',
                // Add the route name or action you want for Space Discoveries here
                routeName: '/space_discoveries',
                imageAsset: 'assets/images/discoveries.png',
              ),
              CardItem(
                title: 'Space Instruments',
                // Add the route name or action you want for Space Instruments here
                routeName: '/space_instruments',
                imageAsset: 'assets/images/instruments.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NasaScreen extends StatelessWidget {
  NasaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nasa',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 1475,
          child: HtmlWidget(
            '<iframe src="https://www.nasa.gov/learning-resources/"></iframe>',
            factoryBuilder: () => MyWidgetFactory(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the HelpScreen when the button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Doubtner()),
          );
        },
        child: Icon(Icons.help_outline), // Use the question mark icon
      ),
    );
  }
}

class IsroScreen extends StatelessWidget {
  IsroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hypothetical Theories',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 1475,
          child: HtmlWidget(
            '<iframe src="https://multimedia29.home.blog/the-standard-model-of-the-universe/"></iframe>',
            factoryBuilder: () => MyWidgetFactory(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the HelpScreen when the button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Doubtner()),
          );
        },
        child: Icon(Icons.help_outline), // Use the question mark icon
      ),
    );
  }
}

class SpaceDiscoveriesScreen extends StatelessWidget {
  SpaceDiscoveriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Space Discoveries',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 1475,
          child: HtmlWidget(
            '<iframe src="https://www.britannica.com/science/space-exploration/Major-milestones"></iframe>',
            factoryBuilder: () => MyWidgetFactory(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the HelpScreen when the button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Doubtner()),
          );
        },
        child: Icon(Icons.help_outline), // Use the question mark icon
      ),
    );
  }
}

class SpaceInstrumentsScreen extends StatelessWidget {
  SpaceInstrumentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Space Instruments',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 1475,
          child: HtmlWidget(
            '<iframe src="https://science.nasa.gov/mission/hubble/observatory/design/instruments/"></iframe>',
            factoryBuilder: () => MyWidgetFactory(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the Doubtner screen when the button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Doubtner()),
          );
        },
        child: Icon(Icons.help_outline), // Use the question mark icon
      ),
    );
  }
}

class Doubtner extends StatefulWidget {
  @override
  _DoubtnerState createState() => _DoubtnerState();
}

class _DoubtnerState extends State<Doubtner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Doubtner',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: 5000,
        child: HtmlWidget(
          '<iframe src="https://www.chatbase.co/chatbot-iframe/QFuthtBvG6peQ80WaGiWz"></iframe>',
          factoryBuilder: () => MyWidgetFactory(),
        ),
      ),
    );
  }
}

class QuizScreen extends StatelessWidget {
  QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz',
          style: TextStyle(
            // Use your custom font family name
            fontWeight: FontWeight.bold, // Set the font weight to bold
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 5000,
          child: HtmlWidget(
            '<iframe src="https:/quiz-galaxy-quest.netlify.app"></iframe>',
            factoryBuilder: () => MyWidgetFactory(),
          ),
        ),
      ),
    );
  }
}
