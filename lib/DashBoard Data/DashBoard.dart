import 'package:flutter/material.dart';
import 'package:cutis_ai/Start Dignosis Data/Start_Diagnosis.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBord extends StatefulWidget {
  const DashBord({super.key});
  @override
  State<DashBord> createState() {
    return _DashBordState();
  }
}

class _DashBordState extends State<DashBord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 104, 79),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.menu_rounded,
              size: 30,
              color: Colors.white,
            ),
            Container(
              child: Text('Cutis-AI',
                  style: GoogleFonts.spaceMono(
                      textStyle: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    letterSpacing: 8,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ))),
            ),
            const Icon(
              Icons.notifications_none_outlined,
              size: 30,
              color: Colors.white,
            ),
            const Image(image: AssetImage('lib/Assects/Ellipse 4.png'))
          ],
        ),
      ),
      body: Container(
        child: Column(children: [
          Expanded(
            child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 2, right: 20),
                  child: ListView(
                    children: [
                      Text('Greetings!!',
                          style: GoogleFonts.robotoCondensed(
                              color: Colors.black, fontSize: 45)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          'We have tailored best experience and Personalized \nCare at Your Fingertips!',
                          style: GoogleFonts.robotoCondensed(
                              color: Colors.black, fontSize: 16)),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: const Image(
                            image: AssetImage('lib/Assects/graph.png')),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color.fromARGB(50, 128, 128, 128)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: 130,
                                    width: 140,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color:
                                            Color.fromARGB(50, 128, 128, 128)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                            height: 70,
                                            width: 70,
                                            child: Image(
                                                image: AssetImage(
                                                    'lib/Assects/diagnostic.png'))),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text('Start diagnosis',
                                            style: GoogleFonts.robotoCondensed(
                                                color: Colors.black,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: 130,
                                    width: 140,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color:
                                            Color.fromARGB(50, 128, 128, 128)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                            height: 70,
                                            width: 70,
                                            child: Image(
                                                image: AssetImage(
                                                    'lib/Assects/skincare.png'))),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text('Skin Care',
                                            style: GoogleFonts.robotoCondensed(
                                                color: Colors.black,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  height: 130,
                                  width: 140,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: Color.fromARGB(50, 128, 128, 128)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                          height: 70,
                                          width: 70,
                                          child: Image(
                                              image: AssetImage(
                                                  'lib/Assects/medical-record.png'))),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text('View Report',
                                          style: GoogleFonts.robotoCondensed(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  height: 130,
                                  width: 140,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: Color.fromARGB(50, 128, 128, 128)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                          height: 70,
                                          width: 70,
                                          child: Image(
                                              image: AssetImage(
                                                  'lib/Assects/doctor.png'))),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text('Consult a Doctor',
                                          style: GoogleFonts.robotoCondensed(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('Trending Products ',
                          style: GoogleFonts.robotoCondensed(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1)),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 8, left: 8, top: 16, bottom: 8),
                        child: Container(
                          height: 60,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color.fromARGB(50, 128, 128, 128)),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: const Color.fromARGB(255, 7, 104, 79),
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.home_rounded,
                  size: 30,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.file_copy,
                  size: 30,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Start_Diagnosis(),
                      ));
                },
                icon: const Icon(
                  Icons.chat,
                  size: 30,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.receipt_long,
                  size: 30,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
