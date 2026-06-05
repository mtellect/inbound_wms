import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:inbound_ms/core/resources/app_colors.dart';

class AppDropDownButton<T> extends StatefulWidget {
  final T? value;
  final List<DropdownItem<T>>? items;
  final ValueChanged<T?>? onChanged;
  final Widget? customButton;
  final DropdownStyleData? dropdownStyleData;
  final MenuItemStyleData? menuItemStyleData;
  final ButtonStyleData? buttonStyleData;
  final Widget? hint;
  final Widget? icon;
  final bool isSearchable;
  final String? searchHint;

  const AppDropDownButton({
    super.key,
    this.value,
    required this.items,
    this.onChanged,
    this.customButton,
    this.dropdownStyleData,
    this.menuItemStyleData,
    this.buttonStyleData,
    this.hint,
    this.icon,
    this.isSearchable = false,
    this.searchHint,
  });

  @override
  State<AppDropDownButton<T>> createState() => _AppDropDownButtonState<T>();
}

class _AppDropDownButtonState<T> extends State<AppDropDownButton<T>> {
  final TextEditingController textEditingController = TextEditingController();
  late ValueNotifier<T?> _valueNotifier;

  @override
  void initState() {
    super.initState();
    _valueNotifier = ValueNotifier(widget.value);
  }

  @override
  void didUpdateWidget(AppDropDownButton<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _valueNotifier.value = widget.value;
    }
  }

  @override
  void dispose() {
    textEditingController.dispose();
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        valueListenable: _valueNotifier,
        items: widget.items,
        onChanged: (newValue) {
          _valueNotifier.value = newValue;
          if (widget.onChanged != null) {
            widget.onChanged!(newValue);
          }
        },
        customButton: widget.customButton,
        isExpanded: true,
        hint: widget.hint,
        iconStyleData: IconStyleData(
          icon: widget.icon ?? const Icon(Icons.arrow_forward_ios_outlined),
          iconSize: 14,
          iconEnabledColor: Colors.black,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: widget.dropdownStyleData ??
            DropdownStyleData(
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                border: Border.all(color: AppColors.separatorColor),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              offset: const Offset(0, 8),
            ),
        menuItemStyleData: widget.menuItemStyleData ??
            const MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 14),
            ),
        buttonStyleData: widget.buttonStyleData ??
            ButtonStyleData(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.surfaceLight,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.separatorColor),
              ),
            ),
        dropdownSearchData: widget.isSearchable
            ? DropdownSearchData(
                searchController: textEditingController,
                searchBarWidgetHeight: 50,
                searchBarWidget: Container(
                  height: 50,
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 4,
                    right: 8,
                    left: 8,
                  ),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: textEditingController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      hintText: widget.searchHint ?? 'Search...',
                      hintStyle: const TextStyle(fontSize: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  return item.value.toString().toLowerCase().contains(searchValue.toLowerCase());
                },
              )
            : null,
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            textEditingController.clear();
          }
        },
      ),
    );
  }
}

class AppDropDownMenuItem extends StatelessWidget {
  const AppDropDownMenuItem({
    super.key,
    required this.icon,
    required this.label,
    this.isDestructive = false,
  });

  final IconData icon;
  final String label;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final color = isDestructive ? Colors.red : AppColors.textPrimaryLight;
    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 12),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
      ],
    );
  }
}
