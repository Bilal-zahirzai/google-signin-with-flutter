String? validateAlphabetic(String? value) {
  if (value == null || value.isEmpty) {
    return 'Field is required';
  }
  // Check if the input contains only alphabetic characters
  if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
    return 'Only alphabetic characters are allowed';
  }
  return null; // Return null for valid input
}