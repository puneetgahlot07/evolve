import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton2<T> extends StatelessWidget {
  final String hintText;
  final List<T> items;
  final T? value;
  final String Function(T)? displayText;
  final void Function(T?)? onChanged;
  final TextEditingController? searchController;

  const CustomDropdownButton2({
    Key? key,
    required this.hintText,
    required this.items,
    required this.value,
    required this.displayText,
    required this.onChanged,
    this.searchController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        isExpanded: true,
        hint: Text(
          hintText,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: items.map((item) => DropdownMenuItem<T>(
          value: item,
          child: Text(
            displayText!(item) ?? '',
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        )).toList(),
        value: value,
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(border: Border.all()),
          height: 40,
          width: 200,
        ),
        dropdownStyleData: const DropdownStyleData(
          maxHeight: 200,
          width: double.infinity,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
        dropdownSearchData: searchController != null
            ? DropdownSearchData<T>(
          searchController: searchController!,
          searchInnerWidgetHeight: 50,
          searchInnerWidget: Container(
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
              controller: searchController,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                hintText: 'Search for an item...',
                hintStyle: const TextStyle(fontSize: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          searchMatchFn: (item, searchValue) {
            return displayText!(item.value as T).toLowerCase().contains(searchValue.toLowerCase());
          },
        )
            : null,
        // This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          if (!isOpen && searchController != null) {
            searchController!.clear();
          }
        },
      ),
    );
  }
}
