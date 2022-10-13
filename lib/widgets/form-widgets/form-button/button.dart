import 'package:flutter/material.dart';
import 'package:instagram_clone/services/color_service.dart';
import 'package:instagram_clone/widgets/form-widgets/form-button/button_model.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.model, super.key, this.isLoading = false});
  final ButtonModel model;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: model.isExpanded ? double.infinity : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorService.instagramBlue,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        onPressed: model.onPressed,
        child: isLoading
            ? const SizedBox(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(model.label),
      ),
    );
  }
}
