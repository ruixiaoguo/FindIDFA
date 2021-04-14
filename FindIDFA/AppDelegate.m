//
//  AppDelegate.m
//  FindIDFA
//
//  Created by grx on 2021/3/23.
//

#import "AppDelegate.h"
#import <AdSupport/ASIdentifierManager.h>
#import "DeviceUUID.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    NSString *idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
//    NSLog(@"IDFA=====%@",idfa);

    NSLog(@"IDFA=====%@",[DeviceUUID getIDFA]);
    
    NSLog(@"UUID=====%@",[DeviceUUID getUUID]);
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"weixin://app/wxd8dc9f174ba09a9e/pay/?nonceStr=xk4ytzr9psqk7lvi9l47qadbg21qj26d&package=Sign%3DWXPay&partnerId=1518950851&prepayId=wx01205109030709529915720ed96b480000&timeStamp=1617281469&sign=Sign%3DWXPay&signType=MD5"] options:@{} completionHandler:^(BOOL success) {
              }];
    
    return YES;
}


@end

