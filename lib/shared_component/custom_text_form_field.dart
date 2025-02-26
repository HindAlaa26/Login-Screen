import 'package:first_project_test/shared_component/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
   String text;
   bool isPassword;
   TextEditingController controller;
   CustomTextFormField({super.key, required this.text, required this.controller,
   this.isPassword = false, });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
   bool visibleIcon = true;
   
  @override
  Widget build(BuildContext context) {
    
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: TextFormField(
      cursorColor: Colors.green.shade900,
    textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller ,
      obscureText: widget.isPassword? visibleIcon : false,
      validator: (value)
      {
        if(value == null || value.isEmpty)
        {
          return '${widget.text} Should not be Empty';
        }
        return null;
      },
      decoration: InputDecoration(
    
         label: customText(text: widget.text,textColor: Colors.green.shade600,textSize: 18) ,
        filled: true,
        
        fillColor: Colors.grey.shade100,
        suffixIcon:widget.isPassword? IconButton(onPressed: (){
         
         setState(() {
           visibleIcon = !visibleIcon;
          
         });
        }, icon: Icon( visibleIcon? Icons.visibility_off : Icons.visibility, color: Colors.green.shade600,)) : SizedBox(),
         focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(30),borderSide: BorderSide(color: Colors.green.shade900)),
         errorBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(30),borderSide: BorderSide(color: Colors.red.shade500)),
         border: UnderlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(30))
      ),
    ),
  );

  }
}
