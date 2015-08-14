//
//  SettingViewController.h
//  Dice_Rolling_3
//
//  Created by Lisa Cao on 8/14/15.
//  Copyright (c) 2015 Lisa Cao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *numOfDice;


@property (weak, nonatomic) IBOutlet UISlider *diceNumber;




- (IBAction)finishSetting:(id)sender;

- (IBAction)silderChanged:(id)sender;




@end
