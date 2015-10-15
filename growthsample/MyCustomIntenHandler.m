//
//  MyCustomIntenHandler.m
//  growthsample
//
//  Created by uchidas on 2015/07/08.
//  Copyright (c) 2015年 Yosuke Uchiyama. All rights reserved.
//

#import "MyCustomIntenHandler.h"
#import <Growthbeat/GBCustomIntent.h>

@implementation MyCustomIntenHandler

- (BOOL)handleIntent:(GBIntent *)intent {
    
    if (intent.type != GBIntentTypeCustom)
        return false;
    
    GBCustomIntent *customIntent = (GBCustomIntent *)intent;
    NSLog(@"%@", customIntent.extra);
    
    NSString *action = [customIntent.extra objectForKey:@"action"];
    if(![action isEqualToString:@"open_view"])
        return false;
    
    NSString *view = [customIntent.extra objectForKey:@"view"];
    
    // TODO viewに対応する画面を開く処理
    
    return true;
    
}

@end
