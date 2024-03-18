
// import 'package:evolve/resources/app_assets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class CustomRadioButton extends StatefulWidget {
//   final bool isSelected;
//   final VoidCallback onTap;

//   CustomRadioButton({required this.isSelected, required this.onTap});

//   @override
//   _CustomRadioButtonState createState() => _CustomRadioButtonState();
// }

// class _CustomRadioButtonState extends State<CustomRadioButton> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: widget.onTap,
//       child: Container(
//         width: 20.sp,
//         height: 20.sp,
//         child: widget.isSelected
//             ? SvgPicture.asset(AppAssets.selectedRadioIcon)
//             : SvgPicture.asset(AppAssets.unselectedRadioIcon),
//       ),
//     );
//   }
// }