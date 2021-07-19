import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/src/app/data/model/blog.dart';
import 'package:flutter_getx_pattern/src/app/modules/search/search_controller.dart';
import 'package:flutter_getx_pattern/src/app/modules/search/widgets/item_search_blog.dart';
import 'package:flutter_getx_pattern/src/app/modules/search/widgets/search_by_header.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchTextController = TextEditingController();
  final FocusNode _node = FocusNode();
  SearchController _searchController = Get.put(SearchController());
  List<Blog> _list = [];

  @override
  void initState() {
    super.initState();
    _searchController.fetchBlog();
    _list = _searchController.list;
    _searchTextController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _node.dispose();
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            floating: true,
            pinned: true,
            delegate: SearchByHeader(
              stackPaddingTop: 175,
              titlePaddingTop: 50,
              title: RichText(
                text: TextSpan(
                  text: 'Search',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.headline1!.color,
                    fontSize: 24,
                  ),
                ),
              ),
              stackChild: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 3,
                      )
                    ]),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _searchTextController,
                  minLines: 1,
                  focusNode: _node,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    suffixIcon: IconButton(
                        onPressed: _searchTextController.text.isEmpty
                            ? null
                            : () {
                                _node.unfocus();
                                _searchTextController.clear();
                                _list = _searchController.list;
                              },
                        icon: Icon(Icons.close,
                            color: _searchTextController.text.isNotEmpty
                                ? Colors.red
                                : Colors.grey)),
                  ),
                  onChanged: (value) {
                    _searchTextController.text.toLowerCase();
                    setState(() {
                      _list = _searchController.searchQuery(value);
                    });
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: _searchTextController.text.isNotEmpty && _list.isEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Icon(Icons.search, size: 70),
                      const SizedBox(height: 20),
                      Text(
                        'No results found',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  )
                : GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 1,
                    childAspectRatio:
                        240 / (MediaQuery.of(context).size.height * 0.15),
                    children: List.generate(
                      _list.length,
                      (index) => ItemSearchBlog(blog: _list[index]),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
