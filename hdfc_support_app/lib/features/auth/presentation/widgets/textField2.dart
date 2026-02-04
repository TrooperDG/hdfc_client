// import 'dart:async';
// import 'package:flutter/material.dart';
//
// class LabeledInputField extends StatefulWidget {
//   final String label;
//   final String hintText;
//   final TextEditingController controller;
//   final bool isPassword;
//   final double fieldWidth;
//
//   const LabeledInputField({
//     super.key,
//     required this.label,
//     required this.hintText,
//     required this.controller,
//     this.isPassword = false,
//     this.fieldWidth = 450,
//   });
//
//   @override
//   State<LabeledInputField> createState() => _LabeledInputFieldState();
// }
//
// class _LabeledInputFieldState extends State<LabeledInputField> {
//   String _displayText = '';
//   Timer? _timer;
//   final FocusNode _focusNode = FocusNode();
//
//   void _handleChange(String value) {
//     if (!widget.isPassword) return;
//
//     _timer?.cancel();
//
//     // 🔒 Force cursor to always stay at the end
//     widget.controller.selection = TextSelection.collapsed(
//       offset: value.length,
//     );
//
//     setState(() {
//       _displayText = value.isNotEmpty
//           ? '*' * (value.length - 1) + value.characters.last
//           : '';
//     });
//
//     _timer = Timer(const Duration(milliseconds: 250), () {
//       if (!mounted) return;
//
//       setState(() {
//         _displayText = '*' * value.length;
//       });
//
//       // 🔒 Force cursor again after rebuild
//       widget.controller.selection = TextSelection.collapsed(
//         offset: widget.controller.text.length,
//       );
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     _focusNode.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Transform.translate(
//           offset: const Offset(-10, 0),
//           child: Text(
//             widget.label,
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//               fontFamily: 'Lexend',
//               color: Colors.white,
//             ),
//           ),
//         ),
//         const SizedBox(height: 15),
//
//         SizedBox(
//           width: widget.fieldWidth,
//           height: 58,
//           child: Stack(
//             alignment: Alignment.centerLeft,
//             children: [
//               TextField(
//                 focusNode: _focusNode,
//                 controller: widget.controller,
//                 onChanged: _handleChange,
//                 obscureText: false,
//                 cursorColor: const Color(0x8a004c8f),
//
//                 // ⚠️ MUST match overlay text metrics
//                 style: const TextStyle(
//                   fontSize: 28,
//                   fontFamily: 'Lexend',
//                   color: Colors.transparent,
//                 ),
//
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   contentPadding: const EdgeInsets.symmetric(
//                     vertical: 18,
//                     horizontal: 12,
//                   ),
//                   hintText: widget.hintText,
//                   hintStyle: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     fontFamily: 'Lexend',
//                     color: Color(0xff8F8A8A),
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(
//                       color: Color(0xffE5E0E0),
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(
//                       color: Color(0x8a004c8f),
//                       width: 1.5,
//                     ),
//                   ),
//                 ),
//               ),
//
//               if (widget.isPassword)
//                 IgnorePointer(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 12),
//                     child: Text(
//                       _displayText,
//                       style: const TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.w500,
//                         fontFamily: 'Lexend',
//                         color: Colors.black54,
//                       ),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// import 'dart:async';
// import 'package:flutter/material.dart';
//
// import 'appColor.dart';
//
// class LabeledInputField extends StatefulWidget {
//   final String label;
//   final String hintText;
//   final TextEditingController controller;
//   final bool isPassword;
//   final double fieldWidth;
//   final Widget ? suffix;
//   /// Callback to expose real password (ONLY used when isPassword = true)
//   final ValueChanged<String>? onPasswordChanged;
//
//   const LabeledInputField({
//     super.key,
//     required this.label,
//     required this.hintText,
//     required this.controller,
//     this.isPassword = false,
//     this.fieldWidth = 450,
//     this.onPasswordChanged,
//     this.suffix,
//   });
//
//   @override
//   State<LabeledInputField> createState() => _LabeledInputFieldState();
// }
//
// class _LabeledInputFieldState extends State<LabeledInputField> {
//   Timer? _timer;
//   final FocusNode _focusNode = FocusNode();
//
//   String _realText = '';
//   bool _showLastChar = false;
//
//   void _handleChange(String value) {
//     if (!widget.isPassword) return;
//
//     _timer?.cancel();
//
//     // Backspace handling
//     if (value.length < _realText.length) {
//       _realText = _realText.substring(0, value.length);
//     }
//     // New character
//     else if (value.isNotEmpty) {
//       _realText += value.characters.last;
//       _showLastChar = true;
//     }
//
//     // real password to parent
//     widget.onPasswordChanged?.call(_realText);
//
//     _updateMaskedText();
//
//     _timer = Timer(const Duration(milliseconds: 250), () {
//       if (!mounted) return;
//       _showLastChar = false;
//       _updateMaskedText();
//     });
//   }
//
//   void _updateMaskedText() {
//     final masked = _showLastChar && _realText.isNotEmpty
//         ? '*' * (_realText.length - 1) + _realText.characters.last
//         : '*' * _realText.length;
//
//     widget.controller.value = TextEditingValue(
//       text: masked,
//       selection: TextSelection.collapsed(offset: masked.length),
//     );
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     _focusNode.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Transform.translate(
//           offset: const Offset(-10, 0),
//           child: Text(
//             widget.label,
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//               fontFamily: 'Lexend',
//               color: AppColors.textOnPrimary,
//             ),
//           ),
//         ),
//         const SizedBox(height: 15),
//         SizedBox(
//           width: widget.fieldWidth,
//           height: 58,
//           child: TextField(
//             focusNode: _focusNode,
//             controller: widget.controller,
//             onChanged: _handleChange,
//             obscureText: false,
//             cursorColor: AppColors.secondary,
//             textAlignVertical: TextAlignVertical.center,
//             style: const TextStyle(
//               fontSize: 16,
//               fontFamily: 'Lexend',
//               color: AppColors.black,
//             ),
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: AppColors.textOnPrimary,
//               contentPadding:
//               const EdgeInsets.fromLTRB(12, 14, 12, 12),
//               hintText: widget.hintText,
//               hintStyle: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 fontFamily: 'Lexend',
//                 color: AppColors.textSecondary,
//               ),
//               suffixIcon: widget.suffix,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide(color: AppColors.border),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: const BorderSide(
//                   color: AppColors.secondary,
//                   width: 1.5,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/constants/appColor.dart';

class LabeledInputField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final double fieldWidth;
  final Widget? suffix;

  /// Callback to expose real password
  final ValueChanged<String>? onPasswordChanged;

  const LabeledInputField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.fieldWidth = 450,
    this.suffix,
    this.onPasswordChanged,
  });

  @override
  State<LabeledInputField> createState() => _LabeledInputFieldState();
}

class _LabeledInputFieldState extends State<LabeledInputField> {
  Timer? _timer;
  final FocusNode _focusNode = FocusNode();

  String _realText = '';
  bool _showLastChar = false;
  bool _isPasswordVisible = false;

  void _handleChange(String value) {
    if (!widget.isPassword) return;

    _timer?.cancel();

    if (value.length < _realText.length) {
      _realText = _realText.substring(0, value.length);
    } else if (value.isNotEmpty) {
      _realText += value.characters.last;
      _showLastChar = true;
    }

    widget.onPasswordChanged?.call(_realText);

    _updateDisplayedText();

    _timer = Timer(const Duration(milliseconds: 250), () {
      if (!mounted) return;
      _showLastChar = false;
      _updateDisplayedText();
    });
  }

  void _updateDisplayedText() {
    final text = _isPasswordVisible
        ? _realText
        : (_showLastChar && _realText.isNotEmpty
              ? '*' * (_realText.length - 1) + _realText.characters.last
              : '*' * _realText.length);

    widget.controller.value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.translate(
          offset: const Offset(-10, 0),
          child: Text(
            widget.label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'Lexend',
              color: AppColors.textOnPrimary,
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: widget.fieldWidth,
          height: 58,
          child: TextField(
            focusNode: _focusNode,
            controller: widget.controller,
            onChanged: _handleChange,
            cursorColor: AppColors.secondary,
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Lexend',
              color: AppColors.black,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.textOnPrimary,
              contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Lexend',
                color: AppColors.textSecondary,
              ),

              suffixIcon: widget.isPassword
                  ? Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: IconButton(
                        style: ButtonStyle(
                          overlayColor:
                          WidgetStateProperty.all(Colors.transparent),
                        ),
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.textSecondary,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                          _updateDisplayedText();
                        },
                      ),
                    )
                  : widget.suffix == null
                  ? null
                  : Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: widget.suffix,
                    ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.secondary,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
