import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:project_test/Models/notes.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    notesDescriptionMaxLength=notesDescriptionMaxLines*notesDescriptionMaxLines;
  }

  // @override
  // void dispose(){
  //  super.dispose();
  //  notesDescriptionController.dispose();
  //  notesHeadingController.dispose();
 // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
          elevation: 0,
          title: notesHeader(),
      ),
      body: notesHeading.isNotEmpty ? buildNotes():
            const Center(
              child: Text("Add Notes"),
            ),
            floatingActionButton: FloatingActionButton(backgroundColor: Colors.green,onPressed: (){
              _settingModalBottomSheet(context);
            },
            child: const Icon(Icons.create),
            ),
    );
  }
  Widget buildNotes(){
    return Padding(padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
    child: ListView.builder(
      itemCount: notesHeading.length,
      itemBuilder: (context, int index){
        return Padding(padding: const EdgeInsets.only(bottom:5.5),
        child: Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.horizontal,
          onDismissed: (direction){
            setState(() {
              deletedNoteHeading=notesHeading[index];
              deletedNoteDescription=notesDescription[index];
              notesHeading.removeAt(index);
              notesDescription.removeAt(index);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.blueGrey, content:
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Note Deleted"),
                      deletedNoteHeading!=""?GestureDetector(onTap: (){
                        setState(() {
                          if(deletedNoteHeading!=""){
                            notesHeading.add(deletedNoteHeading);
                            notesDescription.add(deletedNoteDescription);
                          }
                          deletedNoteHeading="";
                          deletedNoteDescription="";
                        });
                      },
                        child: const Text("Undo"),
                      )
                          :const SizedBox(),
                    ],
                  ),),);
            });
          },
          background: ClipRRect(borderRadius: BorderRadius.circular(5.5),
          child: Container(color: Colors.redAccent,
          child: Align(alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.delete,
                    color: Colors.white,
                  ),
                  Text("Delete",style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          ),
          ),
          ),
         secondaryBackground: ClipRRect(borderRadius: BorderRadius.circular(5.5),
         child: Container(color: Colors.redAccent,
             child: Align(alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                 child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                    Icon(Icons.delete,
                    color: Colors.white,
                    ),
                    Text("Delete",style: TextStyle(color: Colors.white),
                    ),
                    ],
                ),
                ),
                 ),
   ),),

          child: noteList(index),
        ),
        );
      }
    ),
    );
  }
  Widget noteList(int index){
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.5),
      child: Container(
        width: double.infinity,
        height: 100,
      decoration: BoxDecoration(color: noteColor[(index%noteColor.length).floor()],
      borderRadius: BorderRadius.circular(5.5),
      ),
        child: Center(child: Row(children: [
          Container(color: noteMarginColor[(index%noteMarginColor.length).floor()],
            width: 3.5,
            height: double.infinity,
          ),
          Flexible(
              child: Padding(padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(child: Text(
                          notesHeading[index],
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        ),

                        const SizedBox(height: 2.5),

                        Flexible(
                          child: SizedBox(
                          height: double.infinity,
                          child: AutoSizeText((notesDescription[index]),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        ),
                      ],
                      ),
          ),
          ),
            ],
          ),
        ),
      ),
    );
  }

void _settingModalBottomSheet(context)
{
  showModalBottomSheet(context: context,
  isScrollControlled: true,
  elevation: 50,
  isDismissible: true,
  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
    topRight: Radius.circular(30),
    topLeft: Radius.circular(30),
  ),
  ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext bc){
        return Padding(padding: const EdgeInsets.only(left: 25, right: 25,
        ),
        child: Form(key: _formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: (MediaQuery.of(context).size.height),
            ),

            child: Padding(padding: const EdgeInsets.only(bottom: 250, top: 50),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  const Text("New Note",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  GestureDetector(
                    onTap:(){
                      if(_formKey.currentState!.validate())
                        {
                          setState(() {
                            notesHeading.add(notesHeadingController.text);
                            notesDescription.add(notesDescriptionController.text);
                            notesHeadingController.clear();
                            notesDescriptionController.clear();
                          });
                          Navigator.pop(context);
                        }
                    },
                    child: Row(
                      children: const [
                        Text("Save",
                        style: TextStyle(
                          fontSize:20,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const Divider(
                color: Colors.black,
                thickness: 2.5,
              ),

              TextFormField(
                maxLength: notesHeaderMaxLength,
                controller: notesHeadingController,
                decoration: const InputDecoration(hintText: "Add Title",
                  hintStyle: TextStyle(
                    fontSize: 30,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),

               // prefixIcon: Icon(Icons.text_fields),

                ),

                validator: (String ? notesHeading){
                  if(notesHeading!.isEmpty) {
                    return "Enter Note Heading";
                  }
                  else if(notesHeading.startsWith(" ")){
                    return "Please avoid whitespaces";
                  }
                },
                onFieldSubmitted: (String value){
                  FocusScope.of(context).requestFocus(
                      textSecondFocusMode);
                },
              ),

              Padding(padding: const EdgeInsets.only(top: 35),
              child: Container(
                margin: const EdgeInsets.all(1),
                height: 20*24,
                child: TextFormField(
                  focusNode: textSecondFocusMode,
                  maxLines: notesDescriptionMaxLines,
                  maxLength: notesDescriptionMaxLength,
                  controller: notesDescriptionController,
                  decoration: const InputDecoration(border: OutlineInputBorder(),
                    hintText: "Description",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  validator: (String ? notesDescription) {
                    if (notesDescription!.isEmpty) {
                      return "Enter Note Description";
                    }
                    else if (notesDescription.startsWith(" ")) {
                      return "Avoid whitespace";
                    }
                  },
                ),
              ),
              ),
            ],
            ),
            ),
          ),
        ),

        ),
        );
      },);
}

}

Widget notesHeader() {
  return Padding(
      padding: const EdgeInsets.only(top: 20, left: 2.5, right: 2.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("NOTES", style: TextStyle(color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w500),
          ),
          Divider(color: Colors.black,
            thickness: 2.5,)
        ],
      )
  );
}


