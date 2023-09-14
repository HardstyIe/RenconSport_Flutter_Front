import 'package:flutter/material.dart';
import 'package:renconsport/services/theme.dart';

Widget buildTextField(String label, String hint,
    TextEditingController controller, BuildContext context,
    {bool isDateField = false, bool obscureText = false}) {
  return Column(
    children: [
      Text(label),
      SizedBox(height: 15),
      GestureDetector(
        child: AbsorbPointer(
          absorbing: isDateField,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: TextFormField(
              controller: controller,
              obscureText: obscureText,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Veuillez remplir ce champ";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: hint,
                fillColor: CustomTheme.tertiaryColor,
                filled: true,
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: 10),
    ],
  );
}
