import 'package:dawak_3lyna/modules/mainPage/main_page_screen.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:dawak_3lyna/shared/network/local/cache_helper.dart';

// Function print Full Text
void printFullText(String text) {
  final pattern = RegExp(' .{1,800');
  pattern.allMatches(text).forEach((match) => (match.group(0)));
}

void singOut(context) {
  CacheHelper.removeData(key: 'uId').then((value) {
    if (value) {
      navigatAndFinish(context, const MainPageScreen());
    }
  });
}

String uId = '';
