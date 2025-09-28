import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../screens/product/product_list_screen.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _controller = TextEditingController();
  List suggestions = [];

  @override
  Widget build(BuildContext context) {
    final pp = Provider.of<ProductProvider>(context, listen: false);
    return Column(
      children: [
        TextField(
          controller: _controller,
          onChanged: (v) {
            setState(() {
              suggestions = v.isEmpty ? [] : pp.search(v);
            });
          },
          onSubmitted: (v) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => ProductListScreen(query: v)),
            );
          },
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: 'Search for products or restaurants',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            suffixIcon: IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {},
            ),
          ),
        ),
        if (suggestions.isNotEmpty)
          Container(
            height: 100,
            margin: const EdgeInsets.only(top: 8),
            child: ListView.builder(
              itemCount: suggestions.length,
              itemBuilder: (ctx, i) {
                final p = suggestions[i];
                return ListTile(
                  leading: SizedBox(
                    width: 40,
                    child: Image.network(p.imageUrl, fit: BoxFit.cover),
                  ),
                  title: Text(p.title),
                  subtitle: Text('₹${p.price.toStringAsFixed(0)}'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ProductListScreen(query: p.title),
                      ),
                    );
                  },
                );
              },
            ),
          ),
      ],
    );
  }
}
