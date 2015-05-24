//
//  Rule.h
//  LR_parser
//
//  Created by Aleksey Goncharov on 24.05.15.
//  Copyright (c) 2015 Me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Token.h"

@interface Rule : NSObject

@property (nonatomic) Token *leftToken;
@property (nonatomic) NSArray *rightTokens;

@property (nonatomic) NSString *string;

+ (instancetype)ruleWithString:(NSString *)ruleString;

@end
