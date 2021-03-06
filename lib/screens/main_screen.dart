import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtrello/cubit/trello_cubit.dart';
import 'package:testtrello/const.dart';
import '../data/models/trello_card.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  String _username = "", _password = "";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: BlocBuilder<TrelloCubit, TrelloState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            actions: [
              state is TrelloShowCards
                  ? IconButton(
                      icon: Icon(Icons.logout),
                      onPressed: () =>
                          BlocProvider.of<TrelloCubit>(context).logout(),
                    )
                  : Container(),
            ],
            title: Text("Kanban"),
            bottom: state is TrelloShowCards ? _buildTabBar() : null,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Builder(
              builder: (context) {
                if (state is TrelloLogin)
                  return _buildLoginForm(context);
                else if (state is TrelloLoginError)
                  return _buildTrelloLoginError(state, context);
                else if (state is TrelloShowCards) {
                  return _buildCardTab(state);
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }

  Column _buildTrelloLoginError(TrelloLoginError state, BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.0),
        Text(
          state.errorText ?? "",
          style: TextStyle(color: Colors.red),
        ),
        _buildLoginForm(context),
      ],
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      isScrollable: true,
      tabs: [for (int i = 0; i < 4; i++) Tab(child: Text(TABS[i]))],
    );
  }

  TabBarView _buildCardTab(TrelloShowCards state) {
    return TabBarView(children: [
      for (int tab = 0; tab < 4; tab++)
        ListView.builder(
            itemCount: state.cards[tab].length,
            itemBuilder: (BuildContext context, int index) {
              TrelloCard card = state.cards[tab][index];
              return Container(
                color: Theme.of(context).backgroundColor,
                margin: EdgeInsets.only(bottom: 16.0),
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ID: ${card.id}",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      card.text,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              );
            })
    ]);
  }

  Form _buildLoginForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 30.0),
          _buildUsernameTextFormField(),
          SizedBox(height: 20.0),
          _buildPasswordTextFormField(),
          SizedBox(height: 20.0),
          _buildLoginButton(context)
        ],
      ),
    );
  }

  GestureDetector _buildLoginButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState.validate())
          BlocProvider.of<TrelloCubit>(context).login(_username, _password);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          color: myPrimaryColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
            child: Text(
          "Log in",
          style:
              Theme.of(context).textTheme.button.copyWith(color: Colors.black),
        )),
      ),
    );
  }

  TextFormField _buildPasswordTextFormField() {
    return TextFormField(
      key: _passwordKey,
      obscureText: true,
      textAlign: TextAlign.center,
      decoration: myLoginDecoration.copyWith(hintText: "Enter your password"),
      cursorColor: myPrimaryColor,
      validator: (v) {
        if (_password.length < 8) return "Minimum is 8 characters";
        return null;
      },
      onChanged: (v) {
        setState(() => _password = v);
        _passwordKey.currentState.validate();
      },
    );
  }

  TextFormField _buildUsernameTextFormField() {
    return TextFormField(
      key: _usernameKey,
      autofocus: true,
      textAlign: TextAlign.center,
      decoration: myLoginDecoration.copyWith(hintText: "Enter your username"),
      cursorColor: myPrimaryColor,
      validator: (v) {
        if (_username.length < 4) return "Minimum is 4 characters";
        return null;
      },
      onChanged: (v) {
        setState(() => _username = v);
        _usernameKey.currentState.validate();
      },
    );
  }
}
