import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  AddTask({super.key});
  final TextEditingController _tcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Dialog(
      backgroundColor: Colors.deepPurpleAccent[100],
      child: SizedBox(
        height: height * .29,
        width: width * .50,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              "Add a new task here!!",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: width * .47,
              child: TextField(
                controller: _tcontroller,
                decoration: const InputDecoration(
                  hintText: "ex: Read new story",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledButton(
                  onPressed: () {
                    if (_tcontroller.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("task can't be blank"),
                        ),
                      );
                    } else {
                      Navigator.of(context).pop(_tcontroller.text);
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
