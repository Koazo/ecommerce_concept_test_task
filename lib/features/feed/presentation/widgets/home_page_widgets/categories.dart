import 'package:ecommerce_concept/common/constants/app_colors.dart';
import 'package:ecommerce_concept/features/feed/presentation/bloc/phone_list_cubit/phone_list_cubit.dart';
import 'package:ecommerce_concept/features/feed/presentation/bloc/phone_list_cubit/phone_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryModel {
  String text;
  IconData icon;
  bool isSelected;

  CategoryModel(this.text, this.icon, this.isSelected);
}

final List<CategoryModel> categoriesList = [
  CategoryModel('Phones', Icons.smartphone, true),
  CategoryModel('Computer', Icons.desktop_windows, false),
  CategoryModel('Health', Icons.monitor_heart, false),
  CategoryModel('Books', Icons.book_sharp, false),
];

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhonesListCubit, PhonesState>(
      builder: ((context, state) {
        return SizedBox(
          height: 100,
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: categoriesList.length,
            itemBuilder: (context, index) {
              return CategoryItem(
                  text: categoriesList[index].text,
                  icon: categoriesList[index].icon,
                  isSelected: categoriesList[index].isSelected,
                  index: index);
            },
          ),
        );
      }),
    );
  }
}

class CategoryItem extends StatefulWidget {
  const CategoryItem(
      {Key? key,
      required this.text,
      required this.icon,
      required this.isSelected,
      required this.index})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool isSelected;
  final int index;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: widget.isSelected ? AppColors.mainOrange : Colors.white,
              shape: const CircleBorder(),
              elevation: .0,
              padding: const EdgeInsets.all(20),
            ),
            onPressed: () => setState(() {
              for (var i = 0; i < categoriesList.length; i++) {
                categoriesList[i].isSelected = false;
              }
              categoriesList[widget.index].isSelected =
                  !categoriesList[widget.index].isSelected;
            }),
            child: Icon(
              widget.icon,
              color: widget.isSelected ? Colors.white : Colors.grey,
              size: 35,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          widget.text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
