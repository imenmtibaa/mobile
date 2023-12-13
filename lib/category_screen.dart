import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("Romans"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              // go to url
              launch('https://www.amazon.com/Rich-Dad-Poor-Teach-Middle/dp/1612680194');
            },
            child: Card(
              color: Colors.white.withOpacity(0.8),
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.network(
                      'https://m.media-amazon.com/images/W/MEDIAX_792452-T2/images/I/81bsw6fnUiL._SY466_.jpg',
                      width: 80.0,
                      height: 120.0,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 20.0),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rich Dad Poor Dad',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'What the Rich Teach Their Kids About Money That the Poor and Middle Class Do Not!',
                            style: TextStyle(fontSize: 14.0),
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
