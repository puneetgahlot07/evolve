
import 'package:evolve/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextAlign? textAlign;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>?inputFormatters;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final int? maxLines;
  final bool? readOnly;
  final bool? obscureText;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function()? onTapPreffixIcon;
  final Function()? onTapSuffixIcon;
  final String? Function(String?)? validator;
  final BorderRadius? borderRadius;
  final TextStyle? labelStyle;

    CustomTextField({Key? key,
    this.controller,
    this.textAlign = TextAlign.start,
    this.keyboardType,
    this.onChanged,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.readOnly = false,
    this.obscureText = false,
    this.hintText,
    this.labelText,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.onTapPreffixIcon,
    this.onTapSuffixIcon,
    this.validator,
    this.borderRadius,
    this.fillColor,
    this.labelStyle
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        enableSuggestions: false,
        controller: widget.controller, // to hold text values
        textAlign: widget.textAlign!, // align text ex: center , left, right
        keyboardType: widget.keyboardType, // keyboard type
        inputFormatters: widget.inputFormatters, // here you can specify length of textfield input values, what he takes
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted, // what happens on keyboard check button
        readOnly: widget.readOnly!, //
        maxLines: widget.maxLines,
        autocorrect: false,
        enabled: true,
        validator: widget.validator,
        obscureText: widget.obscureText!,
        obscuringCharacter: '*',
        style: TextStyle(color: AppColors.primaryColor),
        // style: TextStyle(fontSize: 15),
        decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.auto, // to show label text always
        labelText: widget.labelText,
        labelStyle: widget.labelStyle??TextStyle(color: AppColors.txtFieldLabelColor),
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: 14.sp),
        filled: true,
        fillColor: widget.fillColor??AppColors.txtFieldFillColor,
        focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: AppColors.txtFieldBorder),
              borderRadius: widget.borderRadius ?? BorderRadius.circular(10.sp),
            ),
        enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Colors.transparent),
              borderRadius: widget.borderRadius ?? BorderRadius.circular(10.sp),
            ),
        enabled: true,
        // prefixIconConstraints: BoxConstraints(minWidth: 76), // to show value after add dropdown in country picker on login and signup
        prefixIcon:widget.prefixIcon !=null?
        GestureDetector(
            onTap:  widget.onTapPreffixIcon ,
            child: widget.prefixIcon): null ,
        suffixIcon: widget.suffixIcon !=null? GestureDetector(
              onTap: widget.onTapSuffixIcon,
              child: widget.suffixIcon) : null ,
        contentPadding: EdgeInsets.only(
            left: widget.prefixIcon == null? 12.sp:12.sp,
              right:
              // widget.suffixIcon == null?12.sp:
              12.sp,
            top: widget.maxLines != null ? 12.sp :0.sp,bottom: 24.sp),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.sp)
        ),
        errorMaxLines: 2,
        ),
      ),
    );
  }
}



// import 'package:evolve/resources/app_color.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomTextField extends StatefulWidget {
//   final TextEditingController? controller;
//   final TextAlign? textAlign;
//   final Color? fillColor;
//   final TextInputType? keyboardType;
//   final List<TextInputFormatter>?inputFormatters;
//   final Function(String)? onChanged;
//   final Function(String)? onFieldSubmitted;
//   final int? maxLines;
//   final bool? readOnly;
//   final bool? obscureText;
//   final String? hintText;
//   final String? labelText;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final Function()? onTapPreffixIcon;
//   final Function()? onTapSuffixIcon;
//   final String? Function(String?)? validator;
//   final BorderRadius? borderRadius;

//   CustomTextField({Key? key,
//     this.controller,
//     this.textAlign = TextAlign.start,
//     this.keyboardType,
//     this.onChanged,
//     this.onFieldSubmitted,
//     this.maxLines = 1,
//     this.readOnly = false,
//     this.obscureText = false,
//     this.hintText,
//     this.labelText,
//     this.inputFormatters,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.onTapPreffixIcon,
//     this.onTapSuffixIcon,
//     this.validator,
//     this.borderRadius,
//     this.fillColor
//   }) : super(key: key);

//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }

// class _CustomTextFieldState extends State<CustomTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       enableSuggestions: false,
//       controller: widget.controller, // to hold text values
//       textAlign: widget.textAlign!, // align text ex: center , left, right
//       keyboardType: widget.keyboardType, // keyboard type
//       inputFormatters: widget.inputFormatters, // here you can specify length of textfield input values, what he takes
//       onChanged: widget.onChanged,
//       onFieldSubmitted: widget.onFieldSubmitted, // what happens on keyboard check button
//       readOnly: widget.readOnly!, //
//       maxLines: widget.maxLines,
//       autocorrect: false,
//       enabled: true,
//       validator: widget.validator,
//       obscureText: widget.obscureText!,
//       // style: TextStyle(fontSize: 15),
//       decoration: InputDecoration(
//       floatingLabelBehavior: FloatingLabelBehavior.always, // to show label text always
//       labelText: widget.labelText,
//       hintText: widget.hintText,
//       hintStyle: TextStyle(fontSize: 14),
//       filled: true,
//       fillColor: widget.fillColor??AppColors.whiteColor,
//       focusedBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//                 color: AppColors.secondaryColor),
//             borderRadius: widget.borderRadius ?? BorderRadius.circular(10.sp),
//           ),
//       enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//                 color: AppColors.txtFieldBorderColor),
//             borderRadius: widget.borderRadius ?? BorderRadius.circular(10.sp),
//           ),
//       enabled: true,
//       // prefixIconConstraints: BoxConstraints(minWidth: 76), // to show value after add dropdown in country picker on login and signup
//       prefixIcon:widget.prefixIcon !=null?
//       GestureDetector(
//           onTap:  widget.onTapPreffixIcon ,
//           child: widget.prefixIcon): null ,
//       suffixIcon: widget.suffixIcon !=null? GestureDetector(
//             onTap: widget.onTapSuffixIcon,
//             child: widget.suffixIcon) : null ,
//       contentPadding: EdgeInsets.only(
//           left: widget.prefixIcon == null? 12.sp:12.sp,
//             right:
//             // widget.suffixIcon == null?12.sp:
//             12.sp,top: widget.maxLines != null?12.sp:0.sp,bottom: 0.sp),
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.sp)
//       )
//       ),
//     );
//   }
// }
