
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novels/Reusable/pdf_screen.dart';


void navigateTo (context ,widget)=>Navigator.push(
  context,
  MaterialPageRoute(
      builder: (context)=>widget),);


Widget buildNovelsItem(context, {
  String? title ,
  String? description ,
  String? image ,
  String? link ,


})=>InkWell(
  onTap:(){
    navigateTo(context, PdfViewer(link!));
  } ,
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children:  [
            Expanded(
              child: Container(
                height: 110.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$title',
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: Text(
                        '$description',
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Container(
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage('$image'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ),
);


