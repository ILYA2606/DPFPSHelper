//
//  DPFPSHelper.m
//
//  Created by ILYA2606 on 21.06.13.
//  Copyright (c) 2013 Darkness Production. All rights reserved.
//

#import "DPFPSHelper.h"

#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

@implementation DPFPSHelper

+(id)getFPSMethod:(NSString*)methodString withTarget:(id)target{
    return [DPFPSHelper getFPSMethod:methodString withTarget:target withObject:nil withObject:nil];
}

+(id)getFPSMethod:(NSString*)methodString withTarget:(id)target withObject:object{
    return [DPFPSHelper getFPSMethod:methodString withTarget:target withObject:object withObject:nil];
}

+(id)getFPSMethod:(NSString*)methodString withTarget:(id)target withObject:object1 withObject:object2{
    SEL selector = NSSelectorFromString(methodString);
    if([target respondsToSelector:selector]){
        NSMutableDictionary *d_methodInfo;
        BOOL isAlreadySaved = NO;
        int numberDictInArray = -1;
        NSMutableArray *a_MethodsInfo = [[NSMutableArray alloc] initWithArray: [DPCacheHelper arrayFromCacheFile:CACHE_FILE_NAME]];
        for(int i = 0; i < a_MethodsInfo.count; i++){
            NSMutableDictionary *dict = a_MethodsInfo[i];
            NSString *methodName = dict[@"methodName"];
            NSString *targetName = dict[@"targetName"];
            NSString *originalTargetName = NSStringFromClass([target class]);
            if([methodName isEqualToString:methodString] && [targetName isEqualToString:originalTargetName]){//already saved
                isAlreadySaved = YES;
                numberDictInArray = i;
                d_methodInfo = [[NSMutableDictionary alloc] initWithDictionary:dict];
                break;
            }
        }
        float totalFPS = 0;
        float count = 1;
        if(d_methodInfo != nil){
            count = [d_methodInfo[@"count"] floatValue] + 1;
            totalFPS = [d_methodInfo[@"totalFPS"] floatValue];
        }
        else{
            d_methodInfo = [NSMutableDictionary new];
        }
        NSTimeInterval time1 = [[NSDate date] timeIntervalSince1970];
        
        id resultObject = [target performSelector:selector withObject:object1 withObject:object2];
        
        NSTimeInterval time2 = [[NSDate date] timeIntervalSince1970];
        float delta = time2-time1;
        float FPS = 1.0/delta;
        totalFPS += FPS;
        float avgFPS = totalFPS / count;
        [d_methodInfo setObject:[NSNumber numberWithFloat:count] forKey:@"count"];
        [d_methodInfo setObject:[NSNumber numberWithFloat:totalFPS] forKey:@"totalFPS"];
        [d_methodInfo setObject:NSStringFromSelector(selector) forKey:@"methodName"];
        [d_methodInfo setObject:NSStringFromClass([target class]) forKey:@"targetName"];
        
        if(numberDictInArray == -1){
            [a_MethodsInfo addObject:d_methodInfo];
        }
        else{
            [a_MethodsInfo replaceObjectAtIndex:numberDictInArray withObject:d_methodInfo];
        }
        [DPCacheHelper saveArray:a_MethodsInfo toCacheFile:CACHE_FILE_NAME];
        
        NSLog(@"Method '%@' info: \nTime working: %f \nFPS = %.1f \navgFPS = %.1f", NSStringFromSelector(selector), delta, FPS, avgFPS);
        return resultObject;
    }
    else{
        NSLog(@"%@ not responded method '%@'",NSStringFromClass([target class]), NSStringFromSelector(selector));
        return nil;
    }
}

@end


@implementation DPCacheHelper

+(void)clearCache{
    NSString *pathToFile = [[DPCacheHelper applicationCacheDirectory] stringByAppendingPathComponent:CACHE_FILE_NAME];
    NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtPath:pathToFile error:&error];
}

+(BOOL)saveArray:(NSArray*)object toCacheFile:(NSString*)fileName{
    NSString *pathToFile = [[DPCacheHelper applicationCacheDirectory] stringByAppendingPathComponent:fileName];
    BOOL result = [object writeToFile:pathToFile atomically:NO];
    return result;
}

+(NSArray*)arrayFromCacheFile:(NSString*)fileName{
    NSString *pathToFile = [[DPCacheHelper applicationCacheDirectory] stringByAppendingPathComponent:fileName];
    NSArray *object = [NSArray arrayWithContentsOfFile:pathToFile];
    return object;
}

+ (NSString *)applicationCacheDirectory{
    return [[[[NSFileManager defaultManager] URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask] lastObject] relativePath];
}

@end
