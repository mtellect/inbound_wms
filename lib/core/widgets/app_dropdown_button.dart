import 'package:flutter/material.dart';

class AppDropDownButton<T> extends StatefulWidget {
  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged;
  final Widget? hint;
  final bool isSearchable;
  final String? searchHint;

  const AppDropDownButton({
    super.key,
    this.value,
    required this.items,
    this.onChanged,
    this.hint,
    this.isSearchable = false,
    this.searchHint,
  });

  @override
  State<AppDropDownButton<T>> createState() => _AppDropDownButtonState<T>();
}

class _AppDropDownButtonState<T> extends State<AppDropDownButton<T>> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: widget.value,
          items: widget.items,
          onChanged: widget.onChanged,
          hint: widget.hint,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black87),
        ),
      ),
    );
  }
}
