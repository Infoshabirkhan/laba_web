part of 'contact_us_cubit.dart';

@immutable
abstract class ContactUsState {}

class ContactUsInitial extends ContactUsState {}
class ContactUsLoading extends ContactUsState {}
class ContactUsError extends ContactUsState {
  final String error;

  ContactUsError({required this.error});
}
class ContactUsLoaded extends ContactUsState {}
