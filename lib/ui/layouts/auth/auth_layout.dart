// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:ultimateproject/ui/layouts/auth/widgets/background_twitter.dart';
import 'package:ultimateproject/ui/layouts/auth/widgets/custom_title.dart';
import 'package:ultimateproject/ui/layouts/auth/widgets/links_bar.dart';



class AuthLayout extends StatelessWidget {

  final Widget child;

  const AuthLayout({
    Key? key, 
    required this.child
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Scrollbar(
        // isAlwaysShown: true,
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [

            ( size.width > 1000 )
              ? _DesktopBody( child: child)
              : _MobileBody( child: child ),
            
            // LinksBar
            LinksBar()
          ],
        ),
      )
    );
  }
}


class _MobileBody extends StatelessWidget {

  final Widget child;

  const _MobileBody({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox( height: 20 ),
          CustomTitle(),
          Container(
            width: double.infinity,
            height: 420,
            child: child,
          ),

          Container(
            width: double.infinity,
            height: 400,
            child: BackgroundTwitter(),
          )
        ],
      ),
    );
  }
}


class _DesktopBody extends StatelessWidget {

  final Widget child;

  const _DesktopBody({
    Key? key, 
    required this.child
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.95,
      color: Colors.red,
      child: Row(
        children: [

          // Twitter Background
           BackgroundTwitter(),

        /*  Expanded(child: Container(
            color: Colors.blue,
          )),*/

          // View Container
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                SizedBox( height: 20 ),
                CustomTitle(),
                SizedBox( height: 50 ),
                Expanded(child: child ),
              ],
            ),
          )

        ],
      ),
    );
  }
}