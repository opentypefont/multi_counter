import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter(this.name, {super.key});

  final String name;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  String name = "";
  int count = 0;
  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    name = widget.name;
    _nameController.text = widget.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("What is new name?"),
                          content: TextField(controller: _nameController),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                setState(() => name = _nameController.text);
                              },
                              child: const Text("Change"),
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text("Cancel"),
                            )
                          ],
                        ),
                      ),
                      child: Text(name, style: TextStyle(fontSize: 18)),
                    ),
                    Text("$count", style: TextStyle(fontSize: 42)),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => setState(() => count++),
                      icon: Icon(Icons.add),
                      iconSize: 40,
                    ),
                    IconButton(
                      onPressed: () => setState(() => count--),
                      icon: Icon(Icons.remove),
                      iconSize: 40,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
