import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageShimmerWidget extends StatelessWidget {
  const ImageShimmerWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
                                                              baseColor: Colors.grey,
                                                              highlightColor: Colors.white,
                                                              child: Container(color: Colors.white,),
                                                            );
  }
}