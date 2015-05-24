//
//  Token.h
//  LR_parser
//
//  Created by Aleksey Goncharov on 24.05.15.
//  Copyright (c) 2015 Me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Token : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) BOOL isTerminal;

@end