//
//  AppDelegate.m
//  WhiteStory 1.1.0
//
//  Created by Anastasiya on 14.11.17.
//  Copyright © 2017 Anastasiya. All rights reserved.
//

#import "AppDelegate.h"
#import "Firebase.h"
@import GoogleMaps;
@import UserNotifications;
@interface AppDelegate () <UNUserNotificationCenterDelegate>
@end

@implementation AppDelegate

NSString *const kGCMMessageIDKey = @"gcm.message_id";

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
     [[UIApplication sharedApplication] registerForRemoteNotifications];
    
   // [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
   // [[UIApplication sharedApplication] registerForRemoteNotifications];
    
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setTintColor:[UIColor blackColor]];
    [bar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                 [UIFont fontWithName:@"Helvetica-Light" size:15.0], NSFontAttributeName, nil]];
     [GMSServices provideAPIKey:@"AIzaSyCE1qLfjSv27BW0yBfFiGIAoXkjTaVlRpM"];
    
    [FIRApp configure];
    
    [FIRMessaging messaging].delegate = self;
    // [END set_messaging_delegate]
    [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
    [[UIApplication sharedApplication] registerForRemoteNotifications];

    // Register for remote notifications. This shows a permission dialog on first run, to
    // show the dialog at a more appropriate time move this registration accordingly.
    
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1) {
        // iOS 7.1 or earlier. Disable the deprecation warnings.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        UIRemoteNotificationType allNotificationTypes =
        (UIRemoteNotificationTypeSound |
         UIRemoteNotificationTypeAlert |
         UIRemoteNotificationTypeBadge);
        [application registerForRemoteNotificationTypes:allNotificationTypes];
#pragma clang diagnostic pop
    } else {
        // iOS 8 or later
        // [START register_for_notifications]
        if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_9_x_Max) {
            UIUserNotificationType allNotificationTypes =
            (UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge);
            UIUserNotificationSettings *settings =
            [UIUserNotificationSettings settingsForTypes:allNotificationTypes categories:nil];
            [application registerUserNotificationSettings:settings];
        } else {
            // iOS 10 or later
#if defined(__IPHONE_10_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
            // For iOS 10 display notification (sent via APNS)
            [UNUserNotificationCenter currentNotificationCenter].delegate = self;
            UNAuthorizationOptions authOptions =
            UNAuthorizationOptionAlert
            | UNAuthorizationOptionSound
            | UNAuthorizationOptionBadge;
            [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:authOptions completionHandler:^(BOOL granted, NSError * _Nullable error) {
            }];
#endif
        }
        
        [application registerForRemoteNotifications];
        // [END register_for_notifications]
    }
    return YES;
}

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [FIRMessaging messaging].APNSToken = deviceToken;
}
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"Failed to get token, error: %@", error);
}
-(void)MessageBox:(NSString *)title message:(NSString *)messageText
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:messageText delegate:self
                                          cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}


- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    if (userInfo[kGCMMessageIDKey]) {
        NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
    }
    
    // Print full message.
    NSLog(@"%@", userInfo);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    // Print message ID.
    if (userInfo[kGCMMessageIDKey]) {
        NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
    }
    
    // Print full message.
    NSLog(@"%@", userInfo);
    
    completionHandler(UIBackgroundFetchResultNewData);
}

// Handle incoming notification messages while app is in the foreground.
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    NSDictionary *userInfo = notification.request.content.userInfo;
    
    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // [[FIRMessaging messaging] appDidReceiveMessage:userInfo];
    
    // Print message ID.
    if (userInfo[kGCMMessageIDKey]) {
        NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
    }
    
    // Print full message.
    NSLog(@"%@", userInfo);
    
    // Change this to your preferred presentation option
    completionHandler(UNNotificationPresentationOptionNone);
}
// Handle notification messages after display notification is tapped by the user.
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
#if defined(__IPHONE_11_0)
         withCompletionHandler:(void(^)(void))completionHandler {
#else
withCompletionHandler:(void(^)())completionHandler {
#endif
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    if (userInfo[kGCMMessageIDKey]) {
        NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
    }
    
    // Print full message.
    NSLog(@"%@", userInfo);
    
    completionHandler();
}
    - (void)messaging:(FIRMessaging *)messaging didReceiveRegistrationToken:(NSString *)fcmToken {
        NSLog(@"FCM registration token: %@", fcmToken);
        
        // TODO: If necessary send token to application server.
        // Note: This callback is fired at each app startup and whenever a new token is generated.
    }
    // [END refresh_token]
    
    // [START ios_10_data_message]
    // Receive data messages on iOS 10+ directly from FCM (bypassing APNs) when the app is in the foreground.
    // To enable direct data messages, you can set [Messaging messaging].shouldEstablishDirectChannel to YES.
    - (void)messaging:(FIRMessaging *)messaging didReceiveMessage:(FIRMessagingRemoteMessage *)remoteMessage {
        NSLog(@"Received data message: %@", remoteMessage.appData);
    }
    // [END ios_10_data_message]
    
   
@end
