//
//  Dice.h
//  Dice_Rolling_3
//
//  Created by Lisa Cao on 8/14/15.
//  Copyright (c) 2015 Lisa Cao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//NSObject
@interface Dice : NSObject

//property, NSNumber,Method with two parameters, id
@property (strong, nonatomic) NSString *pColor;

@property (strong, nonatomic) NSNumber *pNumber;

//@property (strong, nonatomic) UIImageView *fg;
//@property (strong, nonatomic) UIImageView *bg;

//class method vs instance method

+ (NSArray *)validNumber;

+ (NSArray *)validColor;




@end
