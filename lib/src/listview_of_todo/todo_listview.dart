import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoListview extends StatelessWidget {
  const TodoListview({
    super.key,
    required this.todoitem,
    required this.completedtask,
    required this.check,
    required this.deletef,
  });
  // final Function(BuildContext)? deletefunction;
  final Function(bool?)? check;
  final String todoitem;
  final bool completedtask;

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
                onChanged: check,
                side: const BorderSide(
                  width: 1.2,

                  // color: Colors.white,
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
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
