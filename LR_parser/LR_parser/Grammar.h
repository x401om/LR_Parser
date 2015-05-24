//
//  Grammar.h
//  LR_parser
//
//  Created by Aleksey Goncharov on 24.05.15.
//  Copyright (c) 2015 Me. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Rule;

@interface Grammar : NSObject

@property (nonatomic) NSDictionary *tokens;
@property (nonatomic) NSArray *rules;

- (instancetype)initWithFilePath:(NSString *)filePath;

- (Rule *)ruleAtIndex:(NSInteger)index;

@end
