import 'package:acacia/data/network/error/app_failures.dart';
import 'package:acacia/data/responses/base_response/data_response.dart';
import 'package:acacia/data/responses/base_response/item_response.dart';
import 'package:acacia/data/responses/base_response/pagination_response.dart';
import 'package:dartz/dartz.dart';

typedef Json = Map<String, dynamic>;

typedef ItemType<X> = ItemModel<X>;
typedef FailureOr<X> = Future<Either<Failure, X>>;
typedef FailureOrItem<X> = Future<Either<Failure, ItemModel<X>>>;

typedef FailureOrList<X> = FailureOr<List<X>>;
typedef FutureBaseRes<X> = Future<DataResponse<X>>;
typedef FutureItemBaseRes<X> = Future<DataResponse<ItemModel<X>>>;
typedef FutureBasePaginationRes<X> = FutureBaseRes<PaginationResponse<X>>;
