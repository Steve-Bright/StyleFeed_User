import 'package:flutter/material.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:style_feed/Navigation/HomePage/SearchPage/filterDetail.dart';

enum SampleItem { filter1, filter2, filter3, filter4, filter5 }

class SearchOptimiseArea extends StatefulWidget {
  const SearchOptimiseArea({super.key});

  @override
  State<SearchOptimiseArea> createState() => _SearchOptimiseAreaState();
}

class _SearchOptimiseAreaState extends State<SearchOptimiseArea> {
  List<String> sortOptions = [
    "Best Match",
    "From Lowest Price",
    "From Highest Price",
    "From Recently added",
    "Distance: Nearest"
  ];
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          PopupMenuButton<SampleItem>(
            initialValue: selectedMenu,
            // Callback that sets the selected popup menu item.
            onSelected: (SampleItem item) {
              setState(() {
                selectedMenu = item;
              }
              );
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
              const PopupMenuItem<SampleItem>(
                value: SampleItem.filter1,
                child: Text('Best Match'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.filter2,
                child: Text('From Lowest Price'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.filter3,
                child: Text('From Highest Price'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.filter4,
                child: Text('From Recently added'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.filter5,
                child: Text('Distance: Nearest'),
              ),
            ],
          ),
          IconButton(
            onPressed: (){
              SideSheet.right(
                  width: MediaQuery.of(context).size.width * 0.65,
                  body: FilterDetail(),
                  context: context
              );
            },
            icon: Icon(Icons.filter_alt_off_outlined),
            iconSize: 40,
          ),
        ],
      ),
    );
  }
}
