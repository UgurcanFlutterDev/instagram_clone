class ButtonModel {
  final String label;
  final bool isExpanded;
  final void Function()? onPressed;

  const ButtonModel({required this.onPressed, this.isExpanded = true, required this.label});
}
