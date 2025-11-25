class BlocFormItem {
  final String value;
  final String? error;

  const BlocFormItem({this.value = '', this.error});

  BlocFormItem copyWith({value, error}) {
    return BlocFormItem(value: value ?? this.value, error: error ?? this.error);
  }
}
