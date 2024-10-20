import 'package:flutter/material.dart';

import '../../data/course_model.dart';
import 'custom_search_bar_widget.dart';

class SearchFilterSheet extends StatefulWidget {
  const SearchFilterSheet({super.key, required this.courses, required  this.searchContent});
  final List<CourseModel> courses;
  final String searchContent;
  

  @override
  _SearchFilterSheetState createState() => _SearchFilterSheetState();
}

class _SearchFilterSheetState extends State<SearchFilterSheet> {
  double _minPrice = 90;
  double _maxPrice = 200;
  String selectedCategory = 'Design';
  String selectedDuration = '3-8 Hours';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  const Text(
                    'Search Filter',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Categories', style: TextStyle(fontSize: 16)),
              Wrap(
                spacing: 10.0,
                children: [
                  categoryChip('Design'),
                  categoryChip('Painting'),
                  categoryChip('Coding'),
                  categoryChip('Music'),
                  categoryChip('Visual identity'),
                  categoryChip('Mathmatics'),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Price', style: TextStyle(fontSize: 16)),
              RangeSlider(
                min: 50,
                max: 500,
                divisions: 50,
                values: RangeValues(_minPrice, _maxPrice),
                labels: RangeLabels('\$${_minPrice.toStringAsFixed(0)}',
                    '\$${_maxPrice.toStringAsFixed(0)}'),
                onChanged: (values) {
                  setState(() {
                    _minPrice = values.start;
                    _maxPrice = values.end;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${_minPrice.toStringAsFixed(0)}'),
                  Text('\$${_maxPrice.toStringAsFixed(0)}'),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Duration', style: TextStyle(fontSize: 16)),
              Wrap(
                spacing: 10.0,
                children: [
                  durationChip('3-8 Hours'),
                  durationChip('8-14 Hours'),
                  durationChip('14-20 Hours'),
                  durationChip('20-24 Hours'),
                  durationChip('24-30 Hours'),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      _minPrice = 90;
                      _maxPrice = 200;
                      selectedCategory = 'Design';
                      selectedDuration = '3-8 Hours';
                      setState(() {});
                    },
                    child: const Text('Clear'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      searchBarOnChange(context,widget.searchContent,widget.courses , _minPrice , _maxPrice);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text('Apply Filter'),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget categoryChip(String category) {
    return ChoiceChip(
      label: Text(category),
      selected: selectedCategory == category,
      onSelected: (isSelected) {
        setState(() {
          selectedCategory = isSelected ? category : '';
        });
      },
    );
  }

  Widget durationChip(String duration) {
    return ChoiceChip(
      label: Text(duration),
      selected: selectedDuration == duration,
      onSelected: (isSelected) {
        setState(() {
          selectedDuration = isSelected ? duration : '';
        });
      },
    );
  }
}