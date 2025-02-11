import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

Padding searchPath() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 20),
    child: TextField(
      decoration: InputDecoration(
          hintText: 'Cari...',
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          prefixIcon: Icon(
            Iconsax.search_normal,
            size: 24,
            color: Colors.black,
          )),
      onChanged: (value) => {},
      onSubmitted: (value) => {},
    ),
  );
}
