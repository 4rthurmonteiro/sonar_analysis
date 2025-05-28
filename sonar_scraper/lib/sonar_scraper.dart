import 'dart:io';

import 'package:web_scraper/web_scraper.dart';
import 'package:webdriver/async_io.dart';

Future<String?> getRuleByUrl(String url) async {
  late WebDriver driver;
  late Process process;
  String? content;
  try {
    process = await Process.start('chromedriver', [
      '--port=4444',
      '--url-base=wd/hub',
      '--verbose',
    ], mode: ProcessStartMode.detached);

    driver = await createDriver(
      uri: Uri.parse('http://localhost:4444/wd/hub/'),
      desired: {'browserName': 'chrome'},
    );

    await driver.get(url);
    WebElement buttonToClick = await driver.findElement(
      By.xpath("//h2[contains(text(),'More Info')]"),
    );

    await buttonToClick.click();
    await Future.delayed(Duration(seconds: 1));

    WebElement dynamicContentElement = await driver.findElement(
      By.xpath("//a[contains(text(),'Dart Linter rule')]"),
    );
    final result = await dynamicContentElement.text;
    content = result.split('-').last.trim();
  } catch (e) {
    print('Erro com WebDriver: $e');
  } finally {
    await driver.quit(closeSession: true);
    process.kill();
    await Future.delayed(Duration(seconds: 1));
  }
  return content;
}

Future<List<String>> getRulesLinks() async {
  final scraper = WebScraper();
  final url = 'https://rules.sonarsource.com/dart/';

  if (await scraper.loadFullURL(url)) {
    final links = scraper.getElement('a', ['href']);
    final rulesLinks =
        links
            .map((link) {
              final href = link['attributes']['href'] as String?;
              if (href != null && href.startsWith('/dart/RSPEC-')) {
                return 'https://rules.sonarsource.com$href';
              }
              return null;
            })
            .whereType<String>()
            .toList();
    return rulesLinks;
  }

  return [];
}
