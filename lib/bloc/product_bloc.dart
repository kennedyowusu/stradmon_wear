import 'package:bloc/bloc.dart';
import 'package:stradmon_chairs/bloc/product_events.dart';
import 'package:stradmon_chairs/bloc/product_state.dart';
import 'package:stradmon_chairs/repositories/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitialState()) {
    final productRepo = ProductRepository();
    on<AddProductEvent>(
      (event, emit) {
        bool productExists = false;
        for (final product in productRepo.getProducts()) {
          if (product.shirt.id == event.product.shirt.id &&
              product.size == event.product.size) {
            product.quantity += event.product.quantity;
            productExists = true;
            break;
          }
        }

        if (!productExists) {
          productRepo.addProduct(event.product);
        }

        emit(ProductSuccessState(products: productRepo.getProducts()));
      },
    );

    on<RemoveProductEvent>(
      (event, emit) => emit(
        ProductSuccessState(
          products: productRepo.removeProduct(event.product),
        ),
      ),
    );

    on<CleanListProductEvent>(
      (event, emit) => emit(
        ProductSuccessState(
          products: productRepo.cleanListProduct(),
        ),
      ),
    );

    on<IncrementProductQuantityEvent>(
      (event, emit) {
        for (final product in productRepo.getProducts()) {
          if (product.shirt.id == event.product.shirt.id &&
              product.size == event.product.size) {
            product.quantity += 1;
            break;
          }
        }
        emit(ProductSuccessState(products: productRepo.getProducts()));
      },
    );

    on<DecrementProductQuantityEvent>(
      (event, emit) {
        for (final product in productRepo.getProducts()) {
          if (product.shirt.id == event.product.shirt.id &&
              product.size == event.product.size) {
            if (product.quantity > 0) {
              product.quantity -= 1;

              if (product.quantity <= 0) {
                add(RemoveProductEvent(product: product));
              }
            }
            break;
          }
        }
        emit(ProductSuccessState(products: productRepo.getProducts()));
      },
    );
  }
}
