import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});
  

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 6',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 55',
  ];
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                "images/vtr_logo.png",
                width: 300,
              ),  
              const Center(
                child: Text("Produtos",
                    style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w700)),
              ),
              Expanded(
                child: SingleChildScrollView(
                child: Column(
                  children: items.map((item) => Row(
                    children: [
    Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
      child: Material(
        color: Colors.blue,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            // gradient: LinearGradient(
            //   colors: [
            //     Color(0xFF7D71F8)
            //   ],
            //   stops: [0, 1],
            //   begin: AlignmentDirectional(0, -1),
            //   end: AlignmentDirectional(0, 1),
            // ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              // child: Image.network(
              //   // columnProductRecord.image!,
              //   width: 100,
              //   height: 70,
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
        ),
      ),
    ),
    Expanded(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    "Teste2"
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Text(
                      '\$ Teste'
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.blue,
            size: 19,
          ),
        ],
      ),
    ),
  ],
                  )).toList(),
                ),
              ),
              ),
              
              // Expanded(
              //   child: SingleChildScrollView(
              //     child: ListView.builder(
              //       physics: NeverScrollableScrollPhysics(),
              //       shrinkWrap: true,
              //       itemCount: items.length,
              //       itemBuilder: (context, index) {
              //         return ListTile(
              //           title: Text(items[index]),
              //         );
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
    );
  }
}
