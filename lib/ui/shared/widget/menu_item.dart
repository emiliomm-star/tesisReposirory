import 'package:flutter/material.dart';

class MenuItems extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool isActive;
  final Function onPressed;

   const MenuItems({
    Key? key,
    required this.text, 
    required this.icon, 
     this.isActive = false, 
    required this.onPressed
    }) : super(key: key);

   

  @override
  State<MenuItems> createState() => _MenuItemsState();
}






class _MenuItemsState extends State<MenuItems> {

  bool isHoverd = false;

  @override
  void initState() {
    super.initState();
    
  }

  @override
  void dispose() {
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      color: isHoverd ? Colors.white.withOpacity(0.1)
                      :Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            //if (widget.isActive == true )  widget.onPressed;
              //print('isActive en false');
              widget.onPressed;
            
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: MouseRegion(
              onEnter: (_) =>setState( () => isHoverd = true),
              onExit: (_) =>setState( () => isHoverd = false),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(widget.icon, color: Colors.white.withOpacity(0.3),),
                  SizedBox(width: 10,),
                  Text(widget.text,style: TextStyle(color: Colors.white.withOpacity(0.5)),),
                  
                ],
              ),
            ),
            ),
        ),
      ),
    );
  }
}