import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'website_list_state.dart';

class WebsiteListCubit extends Cubit<WebsiteListState> {
  WebsiteListCubit() : super(WebsiteListInitial());
}
