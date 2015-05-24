//
//  Rule.m
//  LR_parser
//
//  Created by Aleksey Goncharov on 24.05.15.
//  Copyright (c) 2015 Me. All rights reserved.
//

#import "Rule.h"

@implementation Rule

+ (instancetype)ruleWithString:(NSString *)ruleString {
  Rule *rule = [Rule new];
  
  unichar separator[1] = {[ruleString characterAtIndex:1]};
  NSArray *comps = [ruleString componentsSeparatedByString:[NSString stringWithCharacters:separator length:1]];
  
  // Left Side
  rule.leftToken = [Token new];
  rule.leftToken.name = [comps firstObject];

  // Right Side
  NSMutableArray *tokens = [NSMutableArray new];
  NSArray *tokenNames = [[comps lastObject] componentsSeparatedByString:@" "];
  for (NSString *tokenName in tokenNames) {
    Token *token = [Token new];
    token.name = tokenName;
    [tokens addObject:token];
  }
  rule.rightTokens = [NSArray arrayWithArray:tokens];
  
  rule.string = [NSString stringWithFormat:@"%@ -> %@", rule.leftToken.name, [tokenNames componentsJoinedByString:@""]];
  return rule;
}

- (NSString *)description {
  return self.string;
}

@end
