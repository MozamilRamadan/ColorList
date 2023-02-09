abstract class AppStates {}
class InitialAppStates extends AppStates{}
class StoreAppStates extends AppStates{}
class ColorsLoadingState extends AppStates{}
class ColorsSuccessStates extends AppStates{}
class ColorsStoreBoxSuccessStates extends AppStates{}
class ColorsErrorStates extends AppStates{
  final String error;
  ColorsErrorStates(this.error);
}