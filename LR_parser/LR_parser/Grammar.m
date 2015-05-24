//
//  Grammar.m
//  LR_parser
//
//  Created by Aleksey Goncharov on 24.05.15.
//  Copyright (c) 2015 Me. All rights reserved.
//

#import "Grammar.h"
#import "Rule.h"
#import "Token.h"


@implementation Grammar

- (instancetype)initWithFilePath:(NSString *)filePath {
  self = [super init];
  if (self) {
    NSString *grammarString = [NSString stringWithContentsOfFile:filePath
                                                        encoding:NSUTF8StringEncoding
                                                           error:nil];
    
    NSArray *rulesStrings = [grammarString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    NSMutableArray *rules = [NSMutableArray arrayWithCapacity:rulesStrings.count];
    
    NSMutableDictionary *tokens = [@{} mutableCopy];
    
    for (NSString *ruleString in rulesStrings) {
      Rule *rule = [Rule ruleWithString:ruleString];
      [rules addObject:rule];
      tokens[rule.leftToken.name] = rule.leftToken;
      for (Token *token in rule.rightTokens) {
        tokens[token.name] = token;
      }
    }
    self.rules = [NSArray arrayWithArray:rules];
    
    NSArray *nonTerminals = [self.rules valueForKeyPath:@"leftToken.name"];
    for (Token *token in [tokens allValues]) {
      if ([nonTerminals indexOfObject:token.name] == NSNotFound) {
        token.isTerminal = YES;
      }
    }
    self.tokens = [NSDictionary dictionaryWithDictionary:tokens];
  }
  return self;
}

- (Rule *)ruleAtIndex:(NSInteger)index {
  return self.rules[index];
}

@end
