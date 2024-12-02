import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back)),
          actions: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.blueAccent, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search_rounded, color: Colors.black45),
                    const SizedBox(width: 8),
                    Text(
                      'Search for products',
                      style: TextStyle(color: Colors.black45),
                    ),
                    const SizedBox(width: 55),
                    Icon(Icons.mic_none_outlined, color: Colors.black54),
                    const SizedBox(width: 14),
                    Icon(Icons.camera_alt_outlined, color: Colors.black54),
                  ],
                ),
              ),
            ),
          ],
        ),
      body: Card(
        elevation: 1,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 17,left: 17,bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Recent Searches',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
              SizedBox(height: 15,),
             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Row(
                 children: [
                   Column(
                     children: [
                       Container(
                         height: 60,
                         width: 60,
                         decoration: BoxDecoration(
                             image: DecorationImage(
                                 image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-6ws-0DiCzLZ_kwOFiwIaJFxYjCWUnqhUmA&s'),
                                 fit: BoxFit.fitHeight),
                             borderRadius: BorderRadius.circular(31),
                             border: Border.all(
                                 color: Colors.grey,
                                 width: 1
                             )
                         ),
                       ),
                       SizedBox(height: 5,),
                       Text('Samsung',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w700),)
                     ],
                   ),
                   SizedBox(width: 22,),
                   Column(
                     children: [
                       Container(
                         height: 60,
                         width: 60,
                         decoration: BoxDecoration(
                             image: DecorationImage(
                                 image: NetworkImage('https://assets.ajio.com/medias/sys_master/root/20230621/LQwg/64928ba5d55b7d0c63909f4d/-473Wx593H-464114535-white-MODEL7.jpg'),
                                 fit: BoxFit.fitHeight),
                             borderRadius: BorderRadius.circular(31),
                             border: Border.all(
                                 color: Colors.grey,
                                 width: 1
                             )
                         ),
                       ),
                       SizedBox(height: 5,),
                       Text('asian shoes',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w700),)
                     ],
                   ),
                   SizedBox(width: 22,),
                   Column(
                     children: [
                       Container(
                         height: 60,
                         width: 60,
                         decoration: BoxDecoration(
                             image: DecorationImage(
                                 image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwWXit2t2E3swuqSHe3rC1-lsnnl4agcEhgA&s'),
                                 fit: BoxFit.fitHeight),
                             borderRadius: BorderRadius.circular(31),
                             border: Border.all(
                                 color: Colors.grey,
                                 width: 1
                             )
                         ),
                       ),
                       SizedBox(height: 5,),
                       Text('t shirt for\nmen',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w700),)
                     ],
                   ),
                   SizedBox(width: 22,),
                   Column(
                     children: [
                       Container(
                         height: 60,
                         width: 60,
                         decoration: BoxDecoration(
                             image: DecorationImage(
                                 image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-6ws-0DiCzLZ_kwOFiwIaJFxYjCWUnqhUmA&s'),
                                 fit: BoxFit.fitHeight),
                             borderRadius: BorderRadius.circular(31),
                             border: Border.all(
                                 color: Colors.grey,
                                 width: 1
                             )
                         ),
                       ),
                       SizedBox(height: 5,),
                       Text('Samsung',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w700),)
                     ],
                   ),
                   SizedBox(width: 22,),
                   Column(
                     children: [
                       Container(
                         height: 60,
                         width: 60,
                         decoration: BoxDecoration(
                             image: DecorationImage(
                                 image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-6ws-0DiCzLZ_kwOFiwIaJFxYjCWUnqhUmA&s'),
                                 fit: BoxFit.fitHeight),
                             borderRadius: BorderRadius.circular(31),
                             border: Border.all(
                                 color: Colors.grey,
                                 width: 1
                             )
                         ),
                       ),
                       SizedBox(height: 5,),
                       Text('Samsung',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w700),)
                     ],
                   ),
                   SizedBox(width: 22,),
                   Column(
                     children: [
                       Container(
                         height: 60,
                         width: 60,
                         decoration: BoxDecoration(
                             image: DecorationImage(
                                 image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-6ws-0DiCzLZ_kwOFiwIaJFxYjCWUnqhUmA&s'),
                                 fit: BoxFit.fitHeight),
                             borderRadius: BorderRadius.circular(31),
                             border: Border.all(
                                 color: Colors.grey,
                                 width: 1
                             )
                         ),
                       ),
                       SizedBox(height: 5,),
                       Text('Samsung',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w700),)
                     ],
                   ),
                   SizedBox(width: 22,),
                   Column(
                     children: [
                       Container(
                         height: 60,
                         width: 60,
                         decoration: BoxDecoration(
                             image: DecorationImage(
                                 image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-6ws-0DiCzLZ_kwOFiwIaJFxYjCWUnqhUmA&s'),
                                 fit: BoxFit.fitHeight),
                             borderRadius: BorderRadius.circular(31),
                             border: Border.all(
                                 color: Colors.grey,
                                 width: 1
                             )
                         ),
                       ),
                       SizedBox(height: 5,),
                       Text('Samsung',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w700),)
                     ],
                   ),
                   SizedBox(width: 22,),
                 ],
               ),
             ),
            ],
          ),
        ),
      )
    );
  }
}
