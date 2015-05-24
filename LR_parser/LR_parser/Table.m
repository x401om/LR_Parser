//
//  Table.m
//  LR_parser
//
//  Created by Aleksey Goncharov on 24.05.15.
//  Copyright (c) 2015 Me. All rights reserved.
//

#import "Table.h"
#import "Grammar.h"
#import "ItemSet.h"

@interface Table ()

@property (nonatomic) NSArray *actionTable;

@end

@implementation Table

- (instancetype)initWithGrammar:(Grammar *)grammar {
  self = [super init];
  if (self) {
    self.grammar = grammar;
    [self build];
  }
  return self;
}

- (NSString *)actionTypeForState:(NSUInteger)state
                          symbol:(NSString *)symbol {
  NSDictionary *actions = self.actionTable[state];
  return actions[symbol];
}

- (void)build {
  self.actionTable = @[
                       @{@"x" : @"s1", @"*" : @"s2", @"N" : @"4", @"E" : @"5", @"V" : @"3"},
                       @{@"$" : @"r4", @"=" : @"r4"},
                       @{@"x" : @"s1", @"*" : @"s2", @"E" : @"6", @"V" : @"7"},
                       @{@"$" : @"r3", @"=" : @"s8"},
                       @{@"$" : kActionTypeAccept},
                       @{@"$" : @"r2"},
                       @{@"$" : @"r5", @"=" : @"r5"},
                       @{@"$" : @"r3", @"=" : @"r3"},
                       @{@"x" : @"s1", @"*" : @"s2", @"E" : @"9", @"V" : @"7"},
                       @{@"$" : @"r1"},
                       ];
//  return;
  self.actionTable = nil;
  [self buildItemSets];
  
}

- (void)buildItemSets {
  ItemSet *itemSet = [ItemSet new];;
  itemSet.index = 0;
  itemSet.grammar = self.grammar;
  itemSet.bulletIndex = 0;
  itemSet.baseRule = [self.grammar.rules firstObject];
  NSArray *linkedSets = [itemSet configure];
}


@end
