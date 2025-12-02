import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/list/bloc/AdminProductListBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/AdminProductUpdateContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminProductUpdatePage extends StatefulWidget {
  const AdminProductUpdatePage({super.key});

  @override
  State<AdminProductUpdatePage> createState() => _AdminProductUpdatePageState();
}

class _AdminProductUpdatePageState extends State<AdminProductUpdatePage> {
  AdminProductUpdateBloc? _bloc;
  Product? product;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _bloc = BlocProvider.of<AdminProductUpdateBloc>(context);
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is Product) {
        product = args;
      } else {
        product = null;
      }
      _bloc?.add(AdminProductUpdateInitEvent(product: product));

      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AdminProductUpdateBloc, AdminProductUpdateState>(
        listener: (context, state) {
          if (!mounted) return;
          final responseState = state.response;
          if (responseState is Success) {
            Future.delayed(Duration(seconds: 2), () {
              if (!mounted) return;
              context.read<AdminProductListBloc>().add(
                GetProductsByCategory(idCategory: product!.idCategory),
              );
            });
            Fluttertoast.showToast(
              msg: 'Producto se actualizo correctamente',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          } else if (responseState is Error) {
            Fluttertoast.showToast(
              msg: responseState.message,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
        child: BlocBuilder<AdminProductUpdateBloc, AdminProductUpdateState>(
          builder: (context, state) {
            final responseState = state.response;
            if (responseState is Loading) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  AdminProductUpdateContent(_bloc, state, product),
                  Center(child: CircularProgressIndicator(color: Colors.black)),
                ],
              );
            }
            return AdminProductUpdateContent(_bloc, state, product);
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    Fluttertoast.cancel();
    _bloc?.add(AdminProductUpdateReset());
    super.dispose();
  }
}
