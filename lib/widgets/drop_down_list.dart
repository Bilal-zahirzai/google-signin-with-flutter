import 'package:flutter/material.dart';
class AppDropdownInput<T> extends StatelessWidget {
  final String hintText;
  final List<T> options;
  final String? Function(T? value)? validator;
  final void Function(T? value)? onSaved;
  final T? value;
  final String Function(T) getLabel;
  final void Function(T) onChanged;

  const AppDropdownInput({
    super.key,
    this.hintText = 'Please select an Option',
    this.options = const [],
    required this.getLabel,
    this.validator,
    this.onSaved,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      validator: validator,
      onSaved: onSaved,
      initialValue: value,
      builder: (FormFieldState<T> state) {
        return InputDecorator(
          decoration: InputDecoration(
            hintText: hintText,
            // show error text only if the user interacted with the form
            errorText: state.errorText,
          ),
          isEmpty: value == null || value == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              borderRadius: BorderRadius.circular(12.0),
              dropdownColor: Colors.white,
              value: value,
              isDense: true,
              onChanged: (i) => onChanged(i as T),
              items: options.map((T value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Row(
                    children: [
                      Center(
                        child: Text(
                          getLabel(value),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class AppDropdownInputWithIcon extends StatelessWidget {
  final String hintText;
  final List<IconDropDownItem> items;
  final IconDropDownItem? value;
  final void Function(IconDropDownItem) onChanged;

  const AppDropdownInputWithIcon(
      {super.key,
        required this.hintText,
        required this.onChanged,
        required this.items,
        required this.value});

  @override
  Widget build(BuildContext context) {
    return FormField<IconDropDownItem>(
      builder: (FormFieldState<IconDropDownItem> state) {
        return InputDecorator(
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            hintText: hintText,
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
          isEmpty: value == null || value=='',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<IconDropDownItem>(
              borderRadius: BorderRadius.circular(12.0),
              dropdownColor: Colors.white,
              value: value,
              isDense: true,
              icon:const Icon(
                Icons.arrow_drop_down,
                color: Colors.grey,
              ),
              onChanged: (i) => onChanged(i!),
              items: items.map((IconDropDownItem value) {
                return DropdownMenuItem<IconDropDownItem>(
                  value: value,
                  child: Row(
                    children: [
                      value.icon,
                      const SizedBox(
                        width: 7,
                      ),
                      Center(
                        child: Text(
                          value.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF808080),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class IconDropDownItem {
  late Widget icon;
  late String title;
  late String value;

  IconDropDownItem();
  IconDropDownItem.make(
      {required this.icon, required this.title, required this.value});
}
