//
//  Table.h
//  LR_parser
//
//  Created by Aleksey Goncharov on 24.05.15.
//  Copyright (c) 2015 Me. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const kActionTypeShift = @"s";
static NSString *const kActionTypeReduce = @"r";
static NSString *const kActionTypeAccept = @"a";

typedef NS_ENUM(NSUInteger, ActionType) {
  ActionTypeShift,
  ActionTypeReduce,
  ActionTypeAccept,
  ActionTypeError
};

@class Grammar;

@interface Table : NSObject

@property (nonatomic) Grammar *grammar;

- (instancetype)initWithGrammar:(Grammar *)grammar;

- (NSString *)actionTypeForState:(NSUInteger)state
                          symbol:(NSString *)symbol;

@end
