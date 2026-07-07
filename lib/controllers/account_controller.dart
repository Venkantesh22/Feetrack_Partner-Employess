import 'package:get/get.dart';
import 'package:vlr/data/repositories/account_repo.dart';

class AccountController extends GetxController implements GetxService {
  final AccountRepo accountRepo;

  AccountController({required this.accountRepo});

  final isLoading = false;

  bool isCheckIn = true;
  bool isCheckout = true;
}
