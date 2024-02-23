import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDropDownButton extends StatefulWidget {
  final List<String> items;
  final Function(String?) onChange;
  final int? selectedIndex;
  final bool isEnabled;
  const MyDropDownButton({
    Key? key,
    required this.items,
    required this.onChange,
    this.selectedIndex,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  State<MyDropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  String selectedItem = '';
  @override
  void initState() {
    selectedItem = widget.items.first;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 36.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.sp),
          border: Border.all(
            color: const Color(0xffD8D5CD),
          ),
          color: Colors.white,
        ),
        child: DropdownButton<String>(
         // iconEnabledColor: AppColors.green,
          underline: const SizedBox(),
          borderRadius: BorderRadius.circular(4.sp),
          isExpanded: true,
          value: widget.selectedIndex != null
              ? widget.items.elementAt(widget.selectedIndex!)
              : selectedItem,
          items: widget.items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Container(
                padding: EdgeInsets.only(left: 5.sp),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FittedBox(
                    child: Text(
                      value,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: widget.isEnabled
              ? (value) {
            setState(() {
              selectedItem = value!;
              widget.onChange(value!);
            });
          }
              : null,
        ),
      ),
    );
  }
}
