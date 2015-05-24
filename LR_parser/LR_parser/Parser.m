//
//  Parser.m
//  LR_parser
//
//  Created by Aleksey Goncharov on 24.05.15.
//  Copyright (c) 2015 Me. All rights reserved.
//

#import "Parser.h"
#import "Table.h"
#import "Rule.h"
#import "Grammar.h"

@interface Parser ()

@property (nonatomic) Table *table;

@end

@implementation Parser

- (instancetype)initWithGrammar:(Grammar *)grammar {
  if (self = [super init]) {
    self.table = [[Table alloc] initWithGrammar:grammar];
  }
  return self;
}

- (BOOL)acceptString:(NSString *)input {
  NSMutableArray *output = [NSMutableArray array];
  NSMutableArray *stack = [NSMutableArray array];
  [stack addObject:@"0"];
  
  NSLog(@"Input\t\t\tOutput\t\t\tStack\n");
  
  while (input.length) {
    NSString *log = [NSString stringWithFormat:@"%@\t\t\t%@\t\t\t%@", input, [output componentsJoinedByString:@", "], [stack componentsJoinedByString:@", "]];
    
    NSInteger state = [[stack lastObject] integerValue];
    NSString *firstSymbol = [input substringWithRange:NSMakeRange(0, 1)];
    NSString *nextRule = [self.table actionTypeForState:state symbol:firstSymbol];
    
    if ([nextRule hasPrefix:kActionTypeShift]) {
      // Shift
      NSString *number = [nextRule substringFromIndex:1];
      [stack addObject:number];
      input = [input substringFromIndex:1];
      NSLog(@"%@\t\t\tShift%@\n", log, number);
    } else if ([nextRule hasPrefix:kActionTypeReduce]) {
      // Reduce
      NSString *number = [nextRule substringFromIndex:1];
      [output addObject:number];
      Rule *rule = [self.table.grammar ruleAtIndex:[number integerValue]];
      
      NSInteger tokensCount = rule.rightTokens.count;
      while (tokensCount-- > 0) {
        [stack removeLastObject];
      }
      
      NSString *symbol = rule.leftToken.name;
      
      NSString *action = [self.table actionTypeForState:[[stack lastObject] integerValue] symbol:symbol];
      [stack addObject:action];
      NSLog(@"%@\t\t\tReduce%@\n", log, number);
    } else if ([nextRule hasPrefix:kActionTypeAccept]) {
      // Accept
      NSLog(@"%@\t\t\tAccept\n", log);
      return YES;
    } else {
      // Parse error
      NSLog(@"%@\t\t\tSyntax error\n", log);
      return NO;
    }
  }
  return YES;
}

@end
