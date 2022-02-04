import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration buildInputDecoration_1({hint_text = ""}) {
    return InputDecoration(
        hintText: hint_text,

        hintStyle: TextStyle(fontSize: 12.0, color: Colors.black45),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black45, width: 0.5),
          borderRadius: const BorderRadius.all(
            const Radius.circular(5.0),
          ),
        ),
       // suffixIcon: Icon(Icons.import_contacts_sharp),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 1.0),
          borderRadius: const BorderRadius.all(
            const Radius.circular(5.0),
          ),
        ),
        contentPadding: EdgeInsets.only(left: 16.0)

    );
  }

  static InputDecoration buildInputDecoration_phone({hint_text = ""}) {
    return InputDecoration(
        hintText: hint_text,
        hintStyle: TextStyle(fontSize: 12.0, color: Colors.black45),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black45, width: 0.5),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0)),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black45, width: 1.0),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0))),
        contentPadding: EdgeInsets.only(left: 16.0));
  }
}

class InputDecorationsForPassword {
  static InputDecoration buildInputDecoration_1({hint_text = "",bool? showPassword}) {
    return InputDecoration(
        hintText: hint_text,

        suffixIcon: Container(
          padding: EdgeInsets.only(top: 15),
          child: showPassword==true?Text("Show"):Text("Hide"),
        ),

        hintStyle: TextStyle(fontSize: 12.0, color: Colors.black45),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black45, width: 0.5),
          borderRadius: const BorderRadius.all(
            const Radius.circular(5.0),
          ),
        ),
        // suffixIcon: Icon(Icons.import_contacts_sharp),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 1.0),
          borderRadius: const BorderRadius.all(
            const Radius.circular(5.0),
          ),
        ),
        contentPadding: EdgeInsets.only(left: 16.0)

    );
  }

  static InputDecoration buildInputDecoration_phone({hint_text = ""}) {
    return InputDecoration(
        hintText: hint_text,
        hintStyle: TextStyle(fontSize: 12.0, color: Colors.black45),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black45, width: 0.5),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0)),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black45, width: 1.0),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0))),
        contentPadding: EdgeInsets.only(left: 16.0));
  }
}
