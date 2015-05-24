//
//  Parser.h
//  LR_parser
//
//  Created by Aleksey Goncharov on 24.05.15.
//  Copyright (c) 2015 Me. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Grammar;

@interface Parser : NSObject

- (instancetype)initWithGrammar:(Grammar *)grammar;

- (BOOL)acceptString:(NSString *)string;

@end
