import 'package:card_sample/color_filters.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Card Sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView(
        children: [buildBasicCard(), buildImageCard()],
      ),
    );
  }

  Widget buildBasicCard() => Card(
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.amber,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.indigo, Colors.black],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WordOfTheDayWidget(
                splitWords: ['あ', 'い', 'う', 'え'],
                definition: 'Well meaning and kindly.',
                type: 'adjective',
                example: 'a benevolent smile',
              ),
              SizedBox(
                height: 12,
              ),
              TextButton(onPressed: () {}, child: Text("Learn More"))
            ],
          ),
        ),
      );

  Widget buildImageCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            Stack(
              // Textの位置　指定
              // alignment: Alignment.center,
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://cdn.arstechnica.net/wp-content/uploads/2016/02/5718897981_10faa45ac3_b-640x624.jpg',
                  ),
                  //　モノクロ
                  colorFilter: ColorFilters.greyscale,
                  child: InkWell(
                    onTap: () {},
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Positioned(
                    bottom: 16,
                    right: 16,
                    left: 16,
                    child: Text(
                      "Card With Splash",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  child: Text("SHARE"),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text("LEARN MORE"),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      );
}

class WordOfTheDayWidget extends StatelessWidget {
  final List<String> splitWords;
  final String type;
  final String definition;
  final String example;

  const WordOfTheDayWidget(
      {Key? key,
      required this.splitWords,
      required this.type,
      required this.definition,
      required this.example})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bullet = "\u2022";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Word of the Day",
          style: TextStyle(fontSize: 22, color: Colors.white54),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          splitWords.join(bullet),
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: -1),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          type,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: -1),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          definition,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: -1),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          example,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: -1),
        ),
      ],
    );
  }
}
