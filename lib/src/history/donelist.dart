import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DoneList extends StatelessWidget {
  const DoneList(
      {super.key,
      required this.todoitem,
      required this.completedtask,
      required this.deletef,
      required this.check});

  final String todoitem;
  final bool completedtask;
  final Function(bool?)? check;
  final Function(BuildContext)? deletef;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          onPressed: deletef,
          icon: Icons.delete,
          backgroundColor: Colors.red,
        ),
      ]),
      child: SizedBox(
        height: 80,
        child: Card(
          color: Colors.deepPurple,
          child: Row(
            children: [
              Checkbox(
                activeColor: Colors.grey,
                value: completedtask,
                onChanged: (check) {
                  AlertDialog(
                    title: const Text("data"),
                    actions: [
                      Row(
                        children: [
                          FilledButton(
                            onPressed: () {
                              check;
                            },
                            child: const Text("ok"),
                          ),
                          FilledButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("ok"),
                          ),
                        ],
                      )
                    ],
                  );
                },
                side: const BorderSide(
                  width: 1.2,
                ),
              ),
              Text(
                todoitem,
                style: TextStyle(
                  fontSize: 18,
                  decoration: completedtask
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationThickness: 3,
                  decorationColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
