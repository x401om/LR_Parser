//
//  ItemSet.m
//  LR_parser
//
//  Created by Aleksey Goncharov on 24.05.15.
//  Copyright (c) 2015 Me. All rights reserved.
//

#import "ItemSet.h"
#import "Grammar.h"

@implementation ItemSet

- (NSArray *)configure {
  
  return nil;
}

- (NSString *)description {
  NSMutableArray *tokens = [[self.baseRule.rightTokens valueForKey:@"name"] mutableCopy];
  [tokens insertObject:@"•" atIndex:self.bulletIndex];
  return [NSString stringWithFormat:@"%@ -> %@", self.baseRule.leftToken.name, [tokens componentsJoinedByString:@""]];
}

@end
