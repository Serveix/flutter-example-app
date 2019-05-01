import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(
      todos: List.generate(
        20, 
        (i) => Element(
          "Element $i",
          "Description item $i",
        ),
      ),
    ),
  ));
}

class Element {
  final String title;
  final String description;

  Element(this.title, this.description);
}

class FirstRoute extends StatelessWidget {
  final List<Element> todos;

  FirstRoute({Key key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondRoute(todo: todos[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  final Element todo;
  SecondRoute({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}