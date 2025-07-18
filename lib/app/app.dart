import 'package:acacia/app/config/flavors/app_config.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  //named constructor
  const MyApp._internal();

  //singleton instance
  static MyApp? _instance;

  factory MyApp() {
    _instance ??= MyApp._internal();
    return _instance!;
  }

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    /// the following will make the code work without generating critical errors but it's not the right behavior
    // context.setLocale(LocalizationManager.englishLocal);
    // context.setLocale(context.locale);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // PrintManager.print(
    //   AppConfig.instance.flavor.name,
    //   color: ConsoleColor.brightCyanBg,
    // );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MyHomePage(title: AppConfig.instance.flavor.name),
    );

    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(
    //       create: (context) => getIt<LocalCubit>()..getCurrentRoute(),
    //       lazy: false,
    //     ),
    //     BlocProvider(create: (context) => getIt<CarCubit>()),
    //
    //     /// ToDo: get rid of this because in the future with multi User interfaces it might not be necessary
    //     BlocProvider(
    //       create: (context) => getIt<PaginatedCubit<UserCarModel>>(),
    //     ),
    //     BlocProvider(create: (context) => getIt<CartCubit>()),
    //   ],
    //   child: ScreenUtilInit(
    //     designSize: const Size(
    //       AppConstants.screenUtilWidth,
    //       AppConstants.screenUtilHeight,
    //     ),
    //     minTextAdapt: true,
    //     splitScreenMode: true,
    //     builder: (context, child) => BlocBuilder<LocalCubit, LocalState>(
    //       builder: (context, state) {
    //         final customLocalizationDelegate = context.localizationDelegates;
    //         customLocalizationDelegate.addAll([
    //           MaterialLocalizationSoDelegate(),
    //           CupertinoLocalizationSoDelegate(),
    //         ]);
    //         return MaterialApp(
    //           localizationsDelegates: customLocalizationDelegate,
    //           supportedLocales: context.supportedLocales,
    //           navigatorKey: MyApp.navigatorKey,
    //           navigatorObservers: [
    //             FirebaseAnalyticsObserver(
    //               analytics: getIt<FirebaseAnalytics>(),
    //             ),
    //             MyNavigatorObserver(),
    //           ],
    //           locale: context.locale,
    //           debugShowCheckedModeBanner: false,
    //
    //           title: AppStrings.appTitle.tr(),
    //           onGenerateTitle: (_) {
    //             return AppStrings.appTitle.tr();
    //           },
    //           darkTheme: getApplicationTheme(),
    //           themeMode: ThemeMode.dark,
    //           home: child,
    //           onGenerateRoute: RouteGenerator.getRoute,
    //           initialRoute: state.openingRoutePath,
    //           // initialRoute: Routes.notification.path,
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
