//
//  main.m
//  LR_parser
//
//  Created by Aleksey Goncharov on 24.05.15.
//  Copyright (c) 2015 Me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Grammar.h"
#import "Parser.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSString *grammarPath = @"/Users/agoncharov/Documents/LR_Parser/Grammar.txt";
    Grammar *grammar = [[Grammar alloc] initWithFilePath:grammarPath];
    
    Parser *parser = [[Parser alloc] initWithGrammar:grammar];
    [parser acceptString:@"x=*x$"];
  }
  return 0;
}
