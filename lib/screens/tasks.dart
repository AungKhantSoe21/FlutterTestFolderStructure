// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:provider/provider.dart';

// import 'package:thaik_mobile/persistence/local_storage.dart';

// class TaskView extends StatefulWidget {

//   @override
//   _TaskViewState createState() => _TaskViewState();
// }

// class _TaskViewState extends State<TaskView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Tasks'),
//         ),
//         body: Column(
//           children: <Widget>[
//             Expanded(child: _buildTaskList(context)),
//             // NewTaskInput(
//             //   key: ,
//             // ),
//           ],
//         ));
//   }

//   StreamBuilder<List<Task>> _buildTaskList(BuildContext context) {
//     final database = Provider.of<AppDatabase>(context);
//     return StreamBuilder(
//       stream: database.watchAllTasks(),
//       builder: (context, AsyncSnapshot<List<Task>> snapshot) {
//         final tasks = snapshot.data ?? [];

//         return ListView.builder(
//           itemCount: tasks.length,
//           itemBuilder: (_, index) {
//             final itemTask = tasks[index];
//             return _buildListItem(itemTask, database);
//           },
//         );
//       },
//     );
//   }

//   Widget _buildListItem(Task itemTask, AppDatabase database) {
//     return Slidable(
//       actionPane: SlidableDrawerActionPane(),
//       secondaryActions: <Widget>[
//         IconSlideAction(
//           caption: 'Delete',
//           color: Colors.red,
//           icon: Icons.delete,
//           onTap: () => database.deleteTask(itemTask),
//         )
//       ],
//       child: CheckboxListTile(
//         title: Text(itemTask.name),
//         subtitle: Text(itemTask.dueDate?.toString() ?? 'No date'),
//         value: itemTask.completed,
//         onChanged: (newValue) {
//           database.updateTask(itemTask.copyWith(completed: newValue));
//         },
//       ),
//     );
//   }
// }