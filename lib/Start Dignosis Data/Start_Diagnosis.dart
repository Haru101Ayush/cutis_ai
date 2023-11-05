import 'package:flutter/material.dart';
import 'package:cutis_ai/DashBoard Data/DashBoard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Message.dart';
import 'Palm_Api.dart';

class Start_Diagnosis extends StatefulWidget {
  const Start_Diagnosis({super.key});

  @override
  State<Start_Diagnosis> createState() {
    return _Start_Diagnosis_State();
  }
}

class _Start_Diagnosis_State extends State<Start_Diagnosis> {

  final textcontroler = TextEditingController();

  List<Message> message = [
    Message(user: true, message: 'I am having red skin and red rings and patches,'),
    Message(user: false, message: 'I have red skin and ache,'),
    Message(user: true, message: 'I have red skin and melenoma,'),
    Message(user: false, message: 'I have red skin and mugine,')

    //im a patient suffering from ringworm give me a step by step first Aid  guide?
  ];


  void Image_dignosis() async {

    final String diseaseName = await uploadImage();

    final response = await AI_report(diseaseName);
    setState(() {
      message.add(Message(user: false, message:' You have been Dignosed with '+ diseaseName));
      message.add(Message(user: false, message:response));
    });


  }

  void ai_resp(prompt)async {
      final answere = await Prompt_Symptom(prompt);
      setState(() {
        message.add(Message(user: false, message:answere));
      });
  }

  void send_message()async {
    if (textcontroler.text.isNotEmpty) {
      final prompt=textcontroler.text;
      setState(() {
        message.add(Message(user: true, message:prompt));
        });
      ai_resp(prompt);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 7, 104, 79),
        title: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: 20),
          child: Text('Begin Diagnosis',
              style: GoogleFonts.robotoCondensed(
                  textStyle: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                letterSpacing: 2,
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ))),
        ),
      ),
      body: Container(
        child: Column(children: [
          Expanded(
              child: ListView( reverse:true,
                children: message.reversed.map((value) {
                return Align(alignment: value.user!? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: value.user! ? Colors.blue : Colors.green,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      value.message!,
                      style: TextStyle(color: Colors.white,fontSize: 16),
                    ),
                  ),
                );
              }).toList(),

              )
          ),
          Container(
            alignment: Alignment.center,
            padding:
                const EdgeInsets.only(left: 2, right: 2, top: 2, bottom:3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: Image_dignosis ,
                    icon: const Icon(
                      Icons.add_circle_outlined,
                      color: Color.fromARGB(255, 7, 104, 79),
                      size: 30,
                    )),
                Container(
                  alignment: Alignment.bottomCenter,
                  width: 250,
                  // height: 50,
                  child: TextField(
                      controller: textcontroler,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                textcontroler.clear();
                              },
                              icon: Icon(Icons.clear),color: Colors.black),
                          hintText: 'Prompt your symptoms...',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const  BorderSide(
                                  color: Colors.lightGreen, width: 1)))),
                ),
                IconButton(
                    onPressed: () {
                      send_message();
                      textcontroler.clear();
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Color.fromARGB(255, 7, 104, 79),
                      size: 30,
                    )),
              ],
            ),
          )
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
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashBord(),
                      ));
                },
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
                onPressed: () {},
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
                onPressed: () {
                },
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
