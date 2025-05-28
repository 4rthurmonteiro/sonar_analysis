import 'package:sonar_scraper/sonar_scraper.dart' as sonar_scraper;

void main() async {
  final links = await sonar_scraper.getRulesLinks();
  final rules = <String>[];
  for (final link in links.sublist(0, 10)) {
    final rule = await sonar_scraper.getRuleByUrl(link);
    if (rule != null) {
      rules.add(rule);
    }
  }
}
