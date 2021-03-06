//
//  ETApplicationListener.h
//  ETEventTrackDemo
//
//  Created by huangqun on 2018/8/28.
//  Copyright © 2018年 freedom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ETApplicationListener : NSObject

+ (ETApplicationListener *)sharedInstance;

/**
 启动应用程序生命周期事件的监听
 */
+ (void)startApplicationListeners;

@end
