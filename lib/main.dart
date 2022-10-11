import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Students',

      home: Scaffold(
          appBar: AppBar(title: Text("Students List"),),
          body: ListDisplay()
      ) ,
    );
  }
}

class ListDisplay extends StatefulWidget{

  @override
  _ListDisplayState createState() => _ListDisplayState();

}

class _ListDisplayState extends State<ListDisplay>{

  List<Student> students = [
    Student("s1.png", "191110", "Ghainaa", 1),
    Student("s2.png", "198812", "Ahmad", 3),
    Student("s3.png", "191234", "Amal", 0),
    Student("s4.png", "192345", "Kamel", 2),
    Student("s5.png", "192378", "Salma", 4),
    Student("s6.png", "195645", "Mohammed", 3)
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: students.length,
        itemBuilder: (BuildContext context, int index){
          return Dismissible(
              key: Key(this.students[index].id),
              onDismissed: (direction){
                this.students.removeAt(index);
              },
              child: StudentItem(student: this.students[index])
          );

        });
  }

}

class Student {
  String image;
  String id;
  String name;
  int absences;

  Student(this.image, this.id, this.name, this.absences);
}

class StudentItem extends StatelessWidget{

  final Student student;

  StudentItem({required this.student});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      height: 120,
      child: Card(
        child: Row(
          children: [
            Image.asset('assets/images/' + this.student.image),
            Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Name : ', style: TextStyle(color: Colors.blue)),
                          Text(this.student.id, style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Row(
                        children: [
                          Text('ID : ', style: TextStyle(color: Colors.blue)),
                          Text(this.student.name),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.add),
                          Icon(Icons.remove)
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(this.student.absences.toString()),
                      ),

                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );


  }

}