//
//  DiceHolder.m
//  Dice_Rolling_3
//
//  Created by Lisa Cao on 8/14/15.
//  Copyright (c) 2015 Lisa Cao. All rights reserved.
//

#import "DiceHolder.h"
#import "Dice.h"

@implementation DiceHolder

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithColor:(NSString *)m_color withNumber:(NSNumber *)m_number
{
    self = [super init];
    NSLog(@"10");
    if(self){
        //create an object
        Dice *dice = [[Dice alloc] init];
        dice.pColor = m_color;
        dice.pNumber = m_number;
        
        self.bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:m_color]];
        
        
        self.fg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[[NSString alloc] initWithFormat:@"%@",m_number]]];
        
        //subviews
        [self addSubview:self.bg];
        [self addSubview:self.fg];
        
        
    }
    
    return self;
}







@end
