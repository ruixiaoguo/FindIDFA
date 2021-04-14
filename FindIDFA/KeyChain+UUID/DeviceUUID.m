#import "DeviceUUID.h"

#import "KeyChainStore.h"
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import <AdSupport/AdSupport.h>
#define IIDF @"00000000-0000-0000-0000-000000000000"




@implementation DeviceUUID

+(NSString *)getIDFA{
    NSString *LYKJIA = (NSString *)[KeyChainStore load:@"GTIFA"];
    if ([LYKJIA isEqualToString:@""] || !LYKJIA || [LYKJIA isEqualToString:IIDF])
    {
        NSString *LYKJaa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
        //将该idfa保存到keychain
        [KeyChainStore save:@"GTIFA" data:LYKJaa];
//        if (@available(iOS 14, *)) {
//                // iOS14及以上版本需要先请求权限
//                [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
//                    // 获取到权限后，依然使用老方法获取idfa
//                    if (status == ATTrackingManagerAuthorizationStatusAuthorized) {
//                        NSString *LYKJaa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
//                        //将该idfa保存到keychain
//                        [KeyChainStore save:@"GTIFA" data:LYKJaa];
//
//                    } else {
//                        [KeyChainStore save:@"GTIFA" data:IIDF];
//                             NSLog(@"请在设置-隐私-跟踪中允许App请求跟踪");
//
//                    }
//                }];
//            } else {
//                // iOS14以下版本依然使用老方法
//                // 判断在设置-隐私里用户是否打开了广告跟踪
//                if ([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
//                    NSString *LYKJbb = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
//                    //将该idfa保存到keychain
//                    [KeyChainStore save:@"GTIFA" data:LYKJbb];
//                } else {
//                    //将该idfa保存到keychain
//                    [KeyChainStore save:@"GTIFA" data:IIDF];
//                    NSLog(@"请在设置-隐私-广告中打开广告跟踪功能");
//                }
//            }
    }
    return LYKJIA;
}

+(NSString *)getAppVersion{
//获取app版本
NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
return app_Version;
}



+(NSString *)getUUID
{
//获取项目的bundle ID
NSString *bundleId = [[NSBundle mainBundle] bundleIdentifier];
//根据bundle ID拼接一个自定义的key用来作为keychain里面的唯一标示
//NSString *keyUUid = [NSString stringWithFormat:@"%@.uuid",bundleId];
//将bundle ID作为唯一key在keychain里面获取保存的uuid
NSString * strUUID = (NSString *)[KeyChainStore load:bundleId];
//首次执行该方法时，uuid为空
if ([strUUID isEqualToString:@""] || !strUUID)
{
//生成一个uuid的方法
CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
CFRelease(uuidRef);
//将该uuid保存到keychain
[KeyChainStore save:bundleId data:strUUID];
}
return strUUID;
}
@end
