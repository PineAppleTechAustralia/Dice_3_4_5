//
//  Dice.m
//  Dice_Rolling_3
//
//  Created by Lisa Cao on 8/14/15.
//  Copyright (c) 2015 Lisa Cao. All rights reserved.
//

#import "Dice.h"

@implementation Dice

//synthesize
@synthesize pColor, pNumber = _pNumber;

//NSArray
+ (NSArray *)validNumber
{
    //return @[@"1",@"2",@"3",@"4",@"5",@"6"];
    return @[@1,@2,@3,@4,@5,@6];
}

+ (NSArray *)validColor
{
    return @[@"DICE1",@"DICE2",@"DICE3"];
}

- (void)setPNumber:(NSNumber *)pNumber
{
    if ([[Dice validNumber] containsObject:pNumber]) {
        _pNumber = pNumber;
    }
    else
    {
        NSLog(@"Must be 1-6");
    }
}

@end
