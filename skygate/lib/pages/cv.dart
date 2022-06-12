// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:skygate/extras/experience_card.dart';
import 'package:skygate/extras/progress.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class CV extends StatefulWidget {
  const CV({Key? key}) : super(key: key);

  @override
  State<CV> createState() => _CVState();
}

class _CVState extends State<CV> {
  final List _experience = [
    [
      'Kotrem',
      'Grafik | Programista',
      'wykonanie reklamy 3D\nwykonanie grafik reklamowych\nstworzenie aplikacji mobilnej'
    ],
    [
      'Youtube',
      'Grafik | Montażysta',
      'wykonanie grafik dla youtuberów\nmontaż filmów dla youtuberów'
    ],
    ['Ground Game', 'Grafik', 'prace graficzne\nobróbka zdjęć'],
    ['Fiverr', 'Grafik | Montażysta', 'freelancer'],
  ];

  final Uri _git = Uri.parse('https://github.com/BennyM88');
  final Uri _web = Uri.parse('https://patrykpiatkowski14cf.myportfolio.com/');
  final Uri _mail = Uri(
      scheme: 'mailto',
      path: 'sosodexx@gmail.com',
      query: 'subject=Hello&body=World');

  void _launchUrl(Uri uri) async {
    if (!await launchUrl(uri)) throw 'Could not launch $uri';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Patryk Piątkowski',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: DefaultTextStyle(
                style: TextStyle(color: Color(0xFFe5bce7), fontSize: 14),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TyperAnimatedText('flutter developer'),
                    TyperAnimatedText('graphic designer'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Skills',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Progress(label: 'Adobe Photoshop', value: 0.7),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Progress(label: 'Adobe After Effects', value: 0.7),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Progress(label: 'Flutter', value: 0.4),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Progress(label: 'Android Studio', value: 0.2),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Experience',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 140,
              child: ListView.builder(
                  itemCount: _experience.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ExperienceCard(
                      companyName: _experience[index][0],
                      worksite: _experience[index][1],
                      toDo: _experience[index][2],
                    );
                  }),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Education',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                    child: TimelineTile(
                      isFirst: true,
                      endChild: Text(
                        'GIMNAZJUM IM. JANA PAWŁA II W KŁOBUCKU',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      afterLineStyle:
                          LineStyle(thickness: 2, color: Colors.grey.shade500),
                      indicatorStyle: IndicatorStyle(
                          width: 20,
                          height: 20,
                          padding: EdgeInsets.all(5),
                          color: Colors.grey.shade500),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: TimelineTile(
                      endChild: Text(
                        'IV LO IM. H. SIENKIEWICZA W CZĘSTOCHOWIE',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      beforeLineStyle:
                          LineStyle(thickness: 2, color: Colors.grey.shade500),
                      afterLineStyle: LineStyle(
                        thickness: 2,
                        color: Color(0xFFe5bce7),
                      ),
                      indicatorStyle: IndicatorStyle(
                          width: 20,
                          height: 20,
                          padding: EdgeInsets.all(5),
                          color: Colors.grey.shade500),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: TimelineTile(
                      isLast: true,
                      endChild: Text(
                        'UNIWERSYTET EKONOMICZNY W KATOWICACH\nkierunek: informatyka\nspecjalizacja: programowanie gier i aplikacji mobilnych',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFe5bce7),
                        ),
                      ),
                      beforeLineStyle: LineStyle(
                        thickness: 2,
                        color: Color(0xFFe5bce7),
                      ),
                      indicatorStyle: IndicatorStyle(
                        width: 20,
                        height: 20,
                        padding: EdgeInsets.all(5),
                        color: Color(0xFFe5bce7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Contact',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () => _launchUrl(_git),
                        splashColor: Color(0xFFe5bce7),
                        icon: Image.asset(
                          'lib/icons/git.png',
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () => _launchUrl(_mail),
                        splashColor: Color(0xFFe5bce7),
                        icon: Image.asset(
                          'lib/icons/mail.png',
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () => _launchUrl(_web),
                        splashColor: Color(0xFFe5bce7),
                        icon: Image.asset(
                          'lib/icons/www.png',
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
