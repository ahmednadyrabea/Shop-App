import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shop/constants.dart';
import 'package:shop/view%20model/home_view_model.dart';
import 'package:shop/widgets/custom_text.dart';
import 'package:get/get.dart';

class Screen1 extends StatelessWidget {
  Screen1({Key? key}) : super(key: key);
  final controller = Get.put(HomeViewMModel());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.1,
        left: 20,
        right: 20,
      ),
      child: GetBuilder<HomeViewMModel>(
        init: HomeViewMModel(),
        builder: (_) => Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                  fillColor: Colors.grey[150],
                  filled: true,
                  contentPadding: EdgeInsets.all(20),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomText(
              text: "Categories",
              size: 20,
              isbold: true,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 120,
              width: 400,
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 20,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categoryModel.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: Image.network(
                              controller.categoryModel[index].img.toString()),
                        ),
                        Text(
                            '${controller.categoryModel[index].name.toString()}')
                      ],
                    );
                  }),
            ),
            //     SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Best Selling',
                  size: 20,
                  isbold: true,
                ),
                CustomText(
                  text: 'See All',
                  size: 20,
                  isbold: true,
                )
              ],
            ),
            SizedBox(height: 30,),
            Container(
              height: 350,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.prodactsModel.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10)),
                        width: Get.width * 0.4,
                        child: Image.network(
                          controller.prodactsModel[index].img.toString(),
                        ),
                      ),
                      Text(
                        controller.prodactsModel[index].name.toString(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        controller.prodactsModel[index].description.toString(),
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        '\$' + controller.prodactsModel[index].price.toString(),
                        style: const TextStyle(
                            fontSize: 18,
                            color: mainColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 20,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
