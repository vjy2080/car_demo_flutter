import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'animated_scroll_page.dart';
import 'car_data/car_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Scroll Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              // color: Colors.blue,
              fontWeight: FontWeight.w600,
              fontSize: 25,
            ),
          ),
          bodyLarge: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              // color: Colors.amber,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          bodyMedium: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              // color: Colors.green,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          bodySmall: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              // color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
      ),
      home: const CarListPage(),
    );
  }
}

class CarListPage extends StatelessWidget {
  const CarListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Car List',
        style: Theme.of(context).textTheme.headlineLarge,
      )),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimatedScrollPage(carModel: car),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Hero(
                      tag: 'imageHero${car.title}',
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(car.imageUrl),
                        radius: 40,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            car.title,
                            style: Theme.of(context).textTheme.bodyLarge,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            car.description,
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
