import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'model/reply.dart';
import 'user/user.dart';

class SpecialSearchView extends StatefulWidget {
  const SpecialSearchView({Key? key}) : super(key: key);
  @override
  State<SpecialSearchView> createState() => _SpecialSearchViewState();
}

class _SpecialSearchViewState extends State<SpecialSearchView> {
  late final SearchUserReply searchUserReply;

  List<User> _searchedUsers = [];
  List<Reply> _searchedReplies = [];

  final _listFirstTitle = 'User List';
  final _listSecondTitle = 'Reply List';

  @override
  void initState() {
    super.initState();
    searchUserReply = SearchUserReply(users: User.users, replies: Reply.replies);
    _searchListUpdate(searchUserReply);
  }

  void _searchListUpdate(SearchUserReply searchUserReply) {
    _searchedUsers = searchUserReply.users.toList();
    _searchedReplies = searchUserReply.replies.toList();
  }

  void _searchKey(String key) {
    final newSearch = searchUserReply.find(key);
    setState(() {
      _searchListUpdate(newSearch);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(slivers: [
        TextField(
          onChanged: _searchKey,
        ).toSliver,
        Text(
          _listFirstTitle,
          style: context.textTheme.headline3,
        ).toSliver,
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: _searchedUsers.length,
            (context, index) {
              return Card(
                child: Text(_searchedUsers[index].name ?? ''),
              );
            },
          ),
        ),
        const SizedBox(
          height: 100,
        ).toSliver,
        Text(
          _listSecondTitle,
          style: context.textTheme.headline3,
        ).toSliver,
        SliverList(
            delegate: SliverChildBuilderDelegate(
          childCount: _searchedReplies.length,
          (context, index) {
            return Card(
              child: Text(_searchedReplies[index].result ?? ''),
            );
          },
        ))
      ]),
    );
  }
}

extension WidgetExtension on Widget {
  Widget get toSliver => SliverToBoxAdapter(
        child: this,
      );
}

class SearchUserReply {
  final List<User> users;
  final List<Reply> replies;

  SearchUserReply({required this.users, required this.replies});

  SearchUserReply find(String key) {
    final items = users.where((element) => element.name?.contains(key) ?? false).toList();

    final itemSearchReply = replies.where((element) => element.result?.contains(key) ?? false).toList();
    return SearchUserReply(users: items, replies: itemSearchReply);
  }
}
