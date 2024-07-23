import 'package:flutter/material.dart';
import 'data.dart'; // Ensure this is the correct path to your data file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;
  int counterSebha = 0;
  int roundSebha = 0;

  late String firstText; // Use late to indicate it will be initialized later

  @override
  void initState() {
    super.initState();
    // Initialize the firstText variable here
    firstText = texts[count];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage('assets/v.jfif'), // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (count > 0) {
                              count--;
                              firstText = texts[count];
                            }
                          });
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_sharp),
                      ),
                      Expanded(
                        child: Text(
                          firstText,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: true,
                          maxLines: 10,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (count < texts.length - 1) {
                              count++;
                              firstText = texts[count];
                            }
                          });
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text("$counterSebha / 32",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 47, 150, 190),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
              Text("round:$roundSebha",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 47, 150, 190),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 30,
              ),
              CircleAvatar(
                backgroundColor: Colors.red,
                radius: 25,
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        count = counterSebha = roundSebha = 0;
                        firstText = texts[count];
                      });
                    },
                    child: const Text("Reset",
                        style: TextStyle(
                          color: Color.fromARGB(255, 10, 7, 7),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ))),
              ),
              const SizedBox(
                height: 30,
              ),
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 70,
                child: TextButton(
                  child: const Text("سبح",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: () {
                    setState(() {
                      if (counterSebha < 32) {
                        counterSebha++;
                      } else {
                        roundSebha++;
                        counterSebha = 0;
                      }
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
