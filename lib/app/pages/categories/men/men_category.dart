import 'package:flutter/material.dart';
import 'package:shopp_app/app/pages/categories/sub_category_page/sub_category_page.dart';
import 'package:shopp_app/app/pages/utilities/categ_list/categ_list.dart';


class MenCategory extends StatelessWidget {
  const MenCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            left: 0.0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      'men',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.67,
                    child: GridView.count(
                      mainAxisSpacing: 70,
                      crossAxisSpacing: 15,
                      crossAxisCount: 3,
                      children:
                          List.generate(CategoryListName.men.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SubCategegoryPage(
                                  subCategName: CategoryListName.men[index],
                                  mainCategName: 'men',
                                ),
                                // subCategName: subCategName,
                                // mainCategName: mainCategName),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                // color: Colors.blue,
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/men/men$index.jpg'),
                                  // image: AssetImage(assetName),
                                ),
                              ),
                              Text(CategoryListName.men[index]),
                              // Text(subCategLabel),
                            ],
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}