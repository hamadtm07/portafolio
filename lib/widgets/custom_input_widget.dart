import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String labelText;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextEditingController textController;
  final TextInputType textInputType;
  final int maxLines;
  final String? Function(String?)? customValidator;

  const CustomInput({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    required this.textController,
    this.textInputType = TextInputType.text,
    this.maxLines = 1,
    this.customValidator,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  String? _validar(String? value) {
    if (widget.customValidator != null) {
      return widget.customValidator!(value);
    }

    final text = value?.trim() ?? '';

    if (text.isEmpty) {
      return 'Este campo no puede estar vacío.';
    }

    if (widget.textInputType == TextInputType.emailAddress && !_validarCorreo(text)) {
      return 'Por favor ingresa un correo electrónico válido.';
    }

    return null;
  }

  bool _validarCorreo(String text) {
    return RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: widget.textController,
        keyboardType: widget.textInputType,
        obscureText: _obscureText,
        maxLines: widget.maxLines,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: _validar,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          prefixIcon: Icon(widget.icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Theme.of(context).cardColor,
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
