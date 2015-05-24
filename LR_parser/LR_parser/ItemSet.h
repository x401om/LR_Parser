//
//  ItemSet.h
//  LR_parser
//
//  Created by Aleksey Goncharov on 24.05.15.
//  Copyright (c) 2015 Me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rule.h"

@class Grammar;

@interface ItemSet : NSObject

@property (nonatomic) NSUInteger index;
@property (nonatomic) Grammar *grammar;
@property (nonatomic) NSUInteger bulletIndex;
@property (nonatomic) Rule *baseRule;

- (NSArray *)configure;

@end
