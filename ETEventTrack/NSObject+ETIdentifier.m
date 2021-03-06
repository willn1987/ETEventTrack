//
//  NSObject+FFTrackIdentifier.m
//  ETEventTrack
//
//  Created by huangqun on 2018/3/27.
//  Copyright © 2018年 finupgroup. All rights reserved.
//

#import "NSObject+ETIdentifier.h"
#import <objc/runtime.h>

static void *const ETEventId = (void *) &ETEventId;
static void *const ETViewAppearTime = (void *) &ETViewAppearTime;
static void *const ETExpendData = (void *) &ETExpendData;

@implementation NSObject (ETIdentifier)

- (void)setEt_eventId:(NSString *)eventId {
    objc_setAssociatedObject(self, ETEventId, eventId, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)et_eventId {
    return objc_getAssociatedObject(self, ETEventId);
}

- (void)setEt_viewAppearTime:(NSString *)viewAppearTime {
    objc_setAssociatedObject(self, ETViewAppearTime, viewAppearTime, OBJC_ASSOCIATION_RETAIN);
}

- (NSString *)et_viewAppearTime {
    return objc_getAssociatedObject(self, ETViewAppearTime);
}

- (void)setEt_expendData:(NSDictionary *)expendData {
    objc_setAssociatedObject(self, ETExpendData, expendData, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDictionary *)et_expendData {
    return objc_getAssociatedObject(self, ETExpendData);
}

- (void)configInfoData:(id)obj {
    if (nil == obj) {
        return;
    }
    if ([obj isKindOfClass:[NSDictionary class]]) {
        self.et_expendData = obj;
    } else {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        unsigned count;
        objc_property_t *properties = class_copyPropertyList([obj class], &count);
        if (count == 0) {
            [dict setObject:obj forKey:@"object_key"];
            if (dict) {
                self.et_expendData = dict;
            }
            return;
        }
        for (int i = 0; i < count; i++) {
            NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
            if (key.length > 0 &&
                [obj valueForKey:key]) {
                [dict setObject:[obj valueForKey:key] forKey:key];
            }
        }
        free(properties);
        if (dict) {
            self.et_expendData = dict;
        }
    }
}


@end
