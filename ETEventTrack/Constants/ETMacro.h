//
//  ETMacro.h
//  ETEventTrackDemo
//
//  Created by huangqun on 2018/9/24.
//  Copyright © 2018年 freedom. All rights reserved.
//

#ifndef ETMacro_h
#define ETMacro_h

#if __has_feature(objc_arc)

#define dET_SINGLETON_FOR_CLASS_HEADER(classname) \
\
+ (classname *)sharedInstance;

#define dET_SINGLETON_FOR_CLASS(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)sharedInstance \
{ \
static dispatch_once_t pred; \
dispatch_once(&pred, ^{ shared##classname = [[classname alloc] init]; }); \
return shared##classname; \
}

#else

#define dET_SINGLETON_FOR_CLASS_HEADER(classname) \
\
+ (classname *)sharedInstance;

#define dET_SINGLETON_FOR_CLASS(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)sharedInstance \
{ \
static dispatch_once_t pred; \
dispatch_once(&pred, ^{ shared##classname = [[classname alloc] init]; }); \
return shared##classname; \
} \

#endif


#endif /* ETMacro_h */
