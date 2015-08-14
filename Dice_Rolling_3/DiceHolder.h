//
//  DiceHolder.h
//  Dice_Rolling_3
//
//  Created by Lisa Cao on 8/14/15.
//  Copyright (c) 2015 Lisa Cao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dice.h"

@interface DiceHolder : UIView

@property (strong, nonatomic) UIImageView *fg;
@property (strong, nonatomic) UIImageView *bg;

//@property (strong, nonatomic) Dice *dice;

-(id)initWithColor:(NSString *)m_color withNumber:(NSNumber *)m_number;

@end
