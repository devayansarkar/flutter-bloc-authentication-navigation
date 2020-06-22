import 'package:flutter_mobile_application/common/constants/env.dart';
import 'package:flutter_mobile_application/common/network/api_provider.dart';
import 'package:flutter_mobile_application/common/network/response.dart';
import 'package:flutter_mobile_application/feature/home/models/home_page_info.dart';
import 'package:meta/meta.dart';
import 'dart:async';

class HomeService {
  HomeService({@required this.env, @required this.apiProvider});

  ApiProvider apiProvider;
  Env env;

  Future<DataResponse<HomePageInfo>> fetchHomePageInfo() async {
    final response = await _fetchHomePageInfo();

    if (response == null) {
      return DataResponse.connectivityError();
    }

    if (response['amount'] != null) {
      final HomePageInfo _homePageInfo = HomePageInfo.fromJson(response);
      return DataResponse.success(_homePageInfo);
    } else {
      return DataResponse.error("Error");
    }
  }

  Future<Map<String, dynamic>> _fetchHomePageInfo() async {
    // TODO uncomment when actual API is ready
    //return apiProvider.get('${env.baseUrl}/home');
    return await _testSignInData();
  }

  Future<Map<String, dynamic>> _testSignInData() {
    print("Test data: API is not connected, returning test data....");
    return Future.delayed(
      Duration(seconds: 2),
      () => {
        "amount": {"value": "130,123", "currency": "KIN"},
        "activities": [
          {
            "avatar":
                "https://external-preview.redd.it/iDdntscPf-nfWKqzHRGFmhVxZm4hZgaKe5oyFws-yzA.png?auto=webp&s=38648ef0dc2c3fce76d5e1d8639234d8da0152b2",
            "name": "ANDREW",
            "activityType": "CREDIT",
            "activityStatus": "COMPLETED",
            "amount": {"value": "130", "currency": "KIN"},
            "activityTime": "2 days ago",
            "tracker": "GLHF"
          },
          {
            "avatar":
                "https://cdn3.iconfinder.com/data/icons/social-network-30/512/social-08-512.png",
            "name": "JOHN",
            "activityType": "DEBIT",
            "activityStatus": "COMPLETED",
            "amount": {"value": "132,110", "currency": "KIN"},
            "activityTime": "50 minutes ago",
            "tracker": "GLHF"
          },
          {
            "avatar":
                "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Facebook_logo_36x36.svg/100px-Facebook_logo_36x36.svg.png",
            "name": "SAM",
            "activityType": "CREDIT",
            "activityStatus": "COMPLETED",
            "amount": {"value": "10", "currency": "KIN"},
            "activityTime": "2 minutes ago",
            "tracker": "GLHF"
          },
          {
            "avatar":
                "https://i.ya-webdesign.com/images/discord-logo-png-white-6.png",
            "name": "LISA",
            "activityType": "DEBIT",
            "activityStatus": "COMPLETED",
            "amount": {"value": "100", "currency": "KIN"},
            "activityTime": "1 hour ago",
            "tracker": "GLHF"
          },
          {
            "avatar":
                "https://external-preview.redd.it/iDdntscPf-nfWKqzHRGFmhVxZm4hZgaKe5oyFws-yzA.png?auto=webp&s=38648ef0dc2c3fce76d5e1d8639234d8da0152b2",
            "name": "ANDREW",
            "activityType": "CREDIT",
            "activityStatus": "COMPLETED",
            "amount": {"value": "130", "currency": "KIN"},
            "activityTime": "2 days ago",
            "tracker": "GLHF"
          },
          {
            "avatar":
                "https://cdn3.iconfinder.com/data/icons/social-network-30/512/social-08-512.png",
            "name": "JOHN",
            "activityType": "DEBIT",
            "activityStatus": "COMPLETED",
            "amount": {"value": "132,110", "currency": "KIN"},
            "activityTime": "50 minutes ago",
            "tracker": "GLHF"
          },
          {
            "avatar":
                "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Facebook_logo_36x36.svg/100px-Facebook_logo_36x36.svg.png",
            "name": "SAM",
            "activityType": "CREDIT",
            "activityStatus": "COMPLETED",
            "amount": {"value": "10", "currency": "KIN"},
            "activityTime": "2 minutes ago",
            "tracker": "GLHF"
          },
          {
            "avatar":
                "https://i.ya-webdesign.com/images/discord-logo-png-white-6.png",
            "name": "LISA",
            "activityType": "DEBIT",
            "activityStatus": "COMPLETED",
            "amount": {"value": "100", "currency": "KIN"},
            "activityTime": "1 hour ago",
            "tracker": "GLHF"
          },
          {
            "avatar":
                "https://external-preview.redd.it/iDdntscPf-nfWKqzHRGFmhVxZm4hZgaKe5oyFws-yzA.png?auto=webp&s=38648ef0dc2c3fce76d5e1d8639234d8da0152b2",
            "name": "ANDREW",
            "activityType": "CREDIT",
            "activityStatus": "COMPLETED",
            "amount": {"value": "130", "currency": "KIN"},
            "activityTime": "2 days ago",
            "tracker": "GLHF"
          },
          {
            "avatar":
                "https://cdn3.iconfinder.com/data/icons/social-network-30/512/social-08-512.png",
            "name": "JOHN",
            "activityType": "DEBIT",
            "activityStatus": "COMPLETED",
            "amount": {"value": "132,110", "currency": "KIN"},
            "activityTime": "50 minutes ago",
            "tracker": "GLHF"
          },
          {
            "avatar":
                "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Facebook_logo_36x36.svg/100px-Facebook_logo_36x36.svg.png",
            "name": "SAM",
            "activityType": "CREDIT",
            "activityStatus": "COMPLETED",
            "amount": {"value": "10", "currency": "KIN"},
            "activityTime": "2 minutes ago",
            "tracker": "GLHF"
          },
          {
            "avatar":
                "https://i.ya-webdesign.com/images/discord-logo-png-white-6.png",
            "name": "LISA",
            "activityType": "DEBIT",
            "activityStatus": "COMPLETED",
            "amount": {"value": "100", "currency": "KIN"},
            "activityTime": "1 hour ago",
            "tracker": "GLHF"
          },
          {
            "avatar":
                "https://external-preview.redd.it/iDdntscPf-nfWKqzHRGFmhVxZm4hZgaKe5oyFws-yzA.png?auto=webp&s=38648ef0dc2c3fce76d5e1d8639234d8da0152b2",
            "name": "ANDREW",
            "activityType": "CREDIT",
            "activityStatus": "COMPLETED",
            "amount": {"value": "130", "currency": "KIN"},
            "activityTime": "2 days ago",
            "tracker": "GLHF"
          },
          {
            "avatar":
                "https://cdn3.iconfinder.com/data/icons/social-network-30/512/social-08-512.png",
            "name": "JOHN",
            "activityType": "DEBIT",
            "activityStatus": "COMPLETED",
            "amount": {"value": "132,110", "currency": "KIN"},
            "activityTime": "50 minutes ago",
            "tracker": "GLHF"
          },
          {
            "avatar":
                "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Facebook_logo_36x36.svg/100px-Facebook_logo_36x36.svg.png",
            "name": "SAM",
            "activityType": "CREDIT",
            "activityStatus": "COMPLETED",
            "amount": {"value": "10", "currency": "KIN"},
            "activityTime": "2 minutes ago",
            "tracker": "GLHF"
          },
          {
            "avatar":
                "https://i.ya-webdesign.com/images/discord-logo-png-white-6.png",
            "name": "LISA",
            "activityType": "DEBIT",
            "activityStatus": "COMPLETED",
            "amount": {"value": "100", "currency": "KIN"},
            "activityTime": "1 hour ago",
            "tracker": "GLHF"
          }
        ]
      },
    );
  }
}
