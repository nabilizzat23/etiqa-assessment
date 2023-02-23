import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etiqa_assestment/add_new.dart';
import 'package:etiqa_assestment/todo_model.dart';
import 'package:etiqa_assestment/update.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Main Landing Page where listview of todo list is projected

class ToDoList extends StatefulWidget {
  const ToDoList({super.key, required String title});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  late List<bool> _isChecked;

  @override
  void initState() {
    _isChecked = List.filled(100, false, growable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFf2f2f2),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 1,
          title: const Text("To-Do List"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: StreamBuilder<List<Todo>>(
                    stream: readTodo(),
                    builder: (context, snapshot) {
                      final todos = snapshot.data!;
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          //Segment to calculate Timer
                          var diff =
                              todos[index].enddate.difference(DateTime.now());
                          String strDigits(int n) =>
                              n.toString().padLeft(2, '0');
                          final days = strDigits(diff.inDays);
                          final hours = strDigits(diff.inHours.remainder(24));
                          final minutes =
                              strDigits(diff.inMinutes.remainder(60));
                          int daysChecker = int.parse(days);
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: InkWell(
                              onTap: () {
                                // Go to update pages
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UpdTodo(updtodos: todos[index])),
                                );
                              },
                              child: SizedBox(
                                height: 170,
                                child: Expanded(
                                  child: Stack(
                                    children: [
                                      // Main segment
                                      Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        color: Colors.white,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      16, 16, 0, 0),
                                              child: Text(
                                                todos[index].title,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      16, 24, 16, 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Start Date",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelSmall,
                                                      ),
                                                      const SizedBox(height: 4),
                                                      Text(
                                                        DateFormat(
                                                                'dd MMM yyyy')
                                                            .format(todos[index]
                                                                .startdate),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge,
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "End Date",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelSmall,
                                                      ),
                                                      const SizedBox(height: 4),
                                                      Text(
                                                        DateFormat(
                                                                'dd MMM yyyy')
                                                            .format(todos[index]
                                                                .enddate),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge,
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Time left",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelSmall,
                                                      ),
                                                      const SizedBox(height: 4),
                                                      Text(
                                                        diff <= Duration.zero
                                                            ? '00 hrs 00 min'
                                                            : daysChecker == 00
                                                                ? '$hours hrs $minutes min'
                                                                : '$days day $hours hrs',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            //Status segment
                                            Expanded(
                                              child: Stack(
                                                children: [
                                                  Positioned.fill(
                                                      top: 20,
                                                      child: Container(
                                                        decoration: const BoxDecoration(
                                                            color: Color(
                                                                0xFFE8E3D0),
                                                            borderRadius: BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        12),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        12))),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 16),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "Status",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .labelSmall,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            8),
                                                                child: Text(
                                                                  _isChecked[index] ==
                                                                          true
                                                                      ? 'Complete'
                                                                      : 'Incomplete',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodyLarge,
                                                                ),
                                                              ),
                                                              const Spacer(),
                                                              Text(
                                                                "Tick if completed",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .labelSmall,
                                                              ),
                                                              Checkbox(
                                                                  checkColor:
                                                                      Colors
                                                                          .black,
                                                                  value:
                                                                      _isChecked[
                                                                          index],
                                                                  onChanged:
                                                                      (val) {
                                                                    setState(
                                                                        () {
                                                                      _isChecked[
                                                                              index] =
                                                                          val!;
                                                                    });
                                                                  })
                                                            ],
                                                          ),
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  )),
            ),
          ],
        ),
        //Floating button to go tp 'add new todo list' page
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 255, 94, 0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddNew()),
                );
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  //Widget to read and display data
  Stream<List<Todo>> readTodo() => FirebaseFirestore.instance
      .collection('todo')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Todo.fromJson(doc.data())).toList());
}
