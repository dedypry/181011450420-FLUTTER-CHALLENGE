import 'package:chalenge_dedy_priyatna_181011450420/component/list.dart';
import 'package:chalenge_dedy_priyatna_181011450420/models/users.dart';
import 'package:chalenge_dedy_priyatna_181011450420/services/apiUser.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int page = 1;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Users> listUser = [];
  GlobalKey _contentKey = GlobalKey();
  GlobalKey _refreshKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiUser.getUsers(1).then((value) => {
          setState(() {
            listUser = value;
          })
        });
  }

  void _onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    var list = await ApiUser.getUsers(1);
    page = 1;
    listUser.clear();
    listUser.addAll(list);
    setState(() {
      _refreshController.refreshCompleted();
    });
  }

  void _onLoading() async {
    page++;
    await Future.delayed(Duration(seconds: 2));
    var list = await ApiUser.getUsers(page);
    listUser.addAll(list);
    setState(() {
      _refreshController.refreshCompleted();
    });
  }

  Widget buildCtn() {
    return ListView.separated(
        key: _contentKey,
        itemBuilder: (context, index) {
          return MyList(
              avatar: listUser[index].avatarUrl,
              login: listUser[index].login,
              type: listUser[index].url);
        },
        separatorBuilder: (context, index) {
          return Container();
        },
        itemCount: listUser.length);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration.copyAncestor(
      enableLoadingWhenFailed: true,
      context: context,
      child: Scaffold(
        appBar: AppBar(
          title: Text('List User Github'),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: CostumSearch());
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: SmartRefresher(
          key: _refreshKey,
          controller: _refreshController,
          enablePullUp: true,
          child: buildCtn(),
          physics: BouncingScrollPhysics(),
          footer: ClassicFooter(
            loadStyle: LoadStyle.ShowWhenLoading,
          ),
          onRefresh: _onRefresh,
          onLoading: _onLoading,
        ),
      ),
      headerBuilder: () => WaterDropMaterialHeader(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      footerTriggerDistance: 30,
    );
  }
}

class CostumSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Users> userList = [];
    print(query);
    return ListView.builder(itemBuilder: (context, index) {
      return MyList(
          avatar: userList[index].avatarUrl,
          login: userList[index].login,
          type: userList[index].url);
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Users>>(
        future: ApiUser.searchUsers(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Users> list = snapshot.data!;
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext contex, int index) => MyList(
                    avatar: list[index].avatarUrl,
                    login: list[index].login,
                    type: list[index].url));
          }
        });
  }
}
