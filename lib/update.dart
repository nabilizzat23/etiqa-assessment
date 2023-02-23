import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etiqa_assestment/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//Update Page to edit existing todo items

class UpdTodo extends StatefulWidget {
  final Todo updtodos;
  const UpdTodo({super.key, required this.updtodos});

  @override
  State<UpdTodo> createState() => _UpdTodoState();
}

class _UpdTodoState extends State<UpdTodo> {
  final titleController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  //set state to initialize current data
  @override
  void initState() {
    super.initState();
    titleController.text = widget.updtodos.title;
    startDateController.text =
        DateFormat('yyyy-MM-dd').format(widget.updtodos.startdate);
    endDateController.text =
        DateFormat('yyyy-MM-dd').format(widget.updtodos.enddate);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFffffff),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 1,
          title: const Text("Update To-Do List"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      "To-Do Title",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: TextFormField(
                      controller: titleController,
                      minLines: null,
                      maxLines: null,
                      expands: true,
                      keyboardType: TextInputType.multiline,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          contentPadding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                          hintText: "Please key in your To-Do title here",
                          hintStyle: Theme.of(context).textTheme.bodyMedium),
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 12),
                    child: Text(
                      "Start Date",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  TextFormField(
                    controller: startDateController,
                    keyboardType: TextInputType.none,
                    onTap: () async {
                      DateTime? startDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2100));

                      if (startDate != null) {
                        setState(() {
                          startDateController.text =
                              DateFormat('yyyy-MM-dd').format(startDate);
                        });
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Select a date',
                        hintStyle: Theme.of(context).textTheme.bodyMedium,
                        contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(Icons.expand_more_rounded)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 12),
                    child: Text(
                      "Estimated End Date",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  TextFormField(
                    controller: endDateController,
                    keyboardType: TextInputType.none,
                    onTap: () async {
                      DateTime? endDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100));
                      if (endDate == null) return;

                      setState(() {
                        endDateController.text =
                            DateFormat('yyyy-MM-dd').format(endDate);
                      });
                    },
                    decoration: InputDecoration(
                        hintText: 'Select a date',
                        hintStyle: Theme.of(context).textTheme.bodyMedium,
                        contentPadding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        border: const OutlineInputBorder(),
                        suffixIcon: const Icon(Icons.expand_more_rounded)),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                    color: Colors.black,
                    width: double.infinity,
                    height: 60,
                    child: TextButton(
                        onPressed: () {
                          //Update data segment
                          final docTodo = FirebaseFirestore.instance
                              .collection('todo')
                              .doc(widget.updtodos.id);

                          docTodo.update({
                            'title': titleController.text,
                            'startdate':
                                DateTime.parse(startDateController.text),
                            'enddate': DateTime.parse(endDateController.text),
                          });

                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Save Changes",
                          style: TextStyle(color: Colors.white),
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
