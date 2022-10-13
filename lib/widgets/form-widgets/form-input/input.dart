import 'package:flutter/material.dart';
import 'package:instagram_clone/services/color_service.dart';
import 'package:instagram_clone/widgets/form-widgets/form-input/input_model.dart';

class CustomInput extends StatefulWidget {
  const CustomInput({required this.model, super.key, this.onSaved, this.validator, this.keyboardType, this.textInputAction, this.onFieldSubmitted});
  final InputModel model;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder inputBorderType = OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: Color.fromRGBO(18, 18, 18, 1),
        ));
    return TextFormField(
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      cursorColor: const Color.fromRGBO(160, 160, 160, 1),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        overflow: TextOverflow.clip,
      ),
      obscureText: widget.model.isObsecured && isPasswordHidden,
      decoration: InputDecoration(
          suffixIcon: !widget.model.isObsecured
              ? null
              : Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Material(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                      child: Icon(
                        isPasswordHidden ? Icons.visibility_off_rounded : Icons.visibility,
                        color: isPasswordHidden ? ColorService.gray : Colors.blue,
                      ),
                    ),
                  ),
                ),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          fillColor: const Color.fromRGBO(18, 18, 18, 1),
          border: inputBorderType,
          enabledBorder: inputBorderType,
          focusedBorder: inputBorderType,
          hintText: widget.model.hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            overflow: TextOverflow.visible,
          )),
    );
  }
}
