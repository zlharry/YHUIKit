//
//  YHSelectedOneListItem.h
//  SmartMeter
//
//  Created by sunshine on 2019/1/26.
//  Copyright © 2019 com.eybond. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHSelectedOneListItem : NSObject
/** <#text#> */
@property (nonatomic, copy) NSString *showName;
/** <#text#> */
@property (nonatomic, copy) NSString *val;


- (instancetype)initWithShowName:(NSString *)name val:(NSString *)val;
+ (instancetype)itemWithShowName:(NSString *)name val:(NSString *)val;
@end

NS_ASSUME_NONNULL_END
