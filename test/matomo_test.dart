import 'package:flutter_test/flutter_test.dart';
import 'package:matomo/matomo.dart';

void main() {
  group('Campaign', () {
    test('should be able to handle multiple identifiers', () {
      final utmParameters = <String, dynamic>{
        'utm_campaign': 'mock_utm_campaign',
        'utm_term': 'mock_utm_term',
        'identifiers': <String, String>{
          'gclid': 'mock_gclid_value',
          'ob_click_id': 'mock_outbrain_click_id',
        },
      };

      final campaign = Campaign.fromUtmParameters(utmParameters);
      expect(campaign.name, 'mock_utm_campaign');
      expect(campaign.keyword, 'mock_utm_term');
      expect(campaign.identifiers, isNotNull);
      expect(campaign.identifiers?.containsKey('gclid'), isTrue);
      expect(campaign.identifiers?['gclid'], 'mock_gclid_value');
      expect(campaign.identifiers?.containsKey('ob_click_id'), isTrue);
      expect(campaign.identifiers?['ob_click_id'], 'mock_outbrain_click_id');
    });
  });
}
