import 'package:flutter/material.dart';
import 'package:multi_counter/counter_widget.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Multi Counter",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(primary: Colors.blueAccent),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Counter> counters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi Counter"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => setState(
              () => counters.add(
                Counter("Counter ${counters.length + 1}"),
              ),
            ),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: counters.length != 0
          ? ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => GestureDetector(
                onLongPress: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title:
                        Text("Are you sure to delete ${counters[index].name}?"),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() => counters.removeAt(index));
                        },
                        child: const Text("Yes"),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("No"),
                      ),
                    ],
                  ),
                ),
                child: counters[index],
              ),
              itemCount: counters.length,
            )
          : const Center(
              child: Text(
                "Click + button to add counter!",
                style: TextStyle(fontSize: 18),
              ),
            ),
    );
  }
}
