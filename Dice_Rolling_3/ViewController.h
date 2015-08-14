//
//  ViewController.h
//  Dice_Rolling_3
//
//  Created by Lisa Cao on 8/14/15.
//  Copyright (c) 2015 Lisa Cao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "DiceHolder.h"

@interface ViewController : UIViewController
{
    @public
        int internal_no_of_dice;
        NSString *internal_color;

        BOOL internal_roll_at_once;

    __weak IBOutlet UIButton *rollButton;
}




@end

