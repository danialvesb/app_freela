import 'package:flutter/material.dart';
part 'widgets/_elevated_buttom_category_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // collapsedHeight: 200,
            stretch: true,
            // backgroundColor: Colors.transparent,
            flexibleSpace: SafeArea(
              child: GridView.count(
                crossAxisCount: 3,
                children: [
                  _ElevatedButtomCategoryWidget(
                    title: 'Lanches',
                    image: 'assets/images/foods.jpeg',
                    onPressed: () {},
                  ),
                  _ElevatedButtomCategoryWidget(
                    title: 'Pizza',
                    image: 'assets/images/foods.jpeg',
                    onPressed: () {},
                  ),
                  _ElevatedButtomCategoryWidget(
                    title: 'Sorvetes',
                    image: 'assets/images/foods.jpeg',
                    onPressed: () {},
                  ),
                  _ElevatedButtomCategoryWidget(
                    title: 'Açai',
                    image: 'assets/images/foods.jpeg',
                    onPressed: () {},
                  ),
                  _ElevatedButtomCategoryWidget(
                    title: 'Marmita',
                    image: 'assets/images/foods.jpeg',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              child: PageView(
                controller: controller,
                children: const [
                  Center(
                    child: Text('First Page'),
                  ),
                  Center(
                    child: Text('Second Page'),
                  ),
                  Center(
                    child: Text('Third Page'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
