import 'package:flutter/material.dart';

class ContainerImageWidget extends StatelessWidget {
  final Widget contentWidget;
  final String urlImage;
  const ContainerImageWidget({
    Key? key,
    required this.contentWidget,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(urlImage),
            fit: BoxFit.fill,
          ),
          borderRadius:const  BorderRadius.all(Radius.circular(10))),
      child: contentWidget,
    );
  }
}
