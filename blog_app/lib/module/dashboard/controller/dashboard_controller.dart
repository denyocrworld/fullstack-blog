import 'package:flutter/material.dart';
import 'package:hyper_ui/service/blog_service/blog_service.dart';
import '../view/dashboard_view.dart';

class DashboardController extends State<DashboardView> {
  static late DashboardController instance;
  late DashboardView view;

  @override
  void initState() {
    instance = this;
    getBlogs();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List blogs = [];
  bool loading = false;
  getBlogs() async {
    loading = true;
    setState(() {});

    blogs = await BlogService().getBlogs();

    loading = false;
    setState(() {});
  }
}
