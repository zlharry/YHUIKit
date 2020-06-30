//
//  YHSelectedOneListItem.m
//  SmartMeter
//
//  Created by sunshine on 2019/1/26.
//  Copyright © 2019 com.eybond. All rights reserved.
//

#import "YHSelectedOneListItem.h"

@implementation YHSelectedOneListItem

- (instancetype)initWithShowName:(NSString *)name val:(NSString *)val  {
    if (self = [super init]) {
        self.showName = name;
        self.val = val;
    }
    return self;
}

+ (instancetype)itemWithShowName:(NSString *)name val:(NSString *)val {
    return [[self alloc] initWithShowName:name val:val];
}
@end
