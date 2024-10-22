import 'package:get_it/get_it.dart';
import 'package:learnhub/features/signup/data/repo/sign_up_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<SignUpRepo>(SignUpRepo());
  
}