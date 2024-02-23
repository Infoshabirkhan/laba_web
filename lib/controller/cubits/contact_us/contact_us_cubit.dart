import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/repo/contact_us_repo.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitial());

  submitForm()async{

    try {
      emit(ContactUsLoading());
        var response = await   ContactUsRepo.submitRequest();

        if(response == true){
          emit(ContactUsLoaded());


        }else{
          emit(ContactUsError(error: 'something went wrong'));
        }
    } on Exception catch (e) {
      emit(ContactUsError(error: e.toString()));
      // TODO
    }




  }
}
