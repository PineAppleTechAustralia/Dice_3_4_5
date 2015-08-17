//
//  SettingViewController.h
//  Dice_Rolling_3
//
//  Created by Lisa Cao on 8/14/15.
//  Copyright (c) 2015 Lisa Cao. All rights reserved.
//

#import <UIKit/UIKit.h>


@class SettingViewController;

@protocol SettingViewControllerDelegate<NSObject>

@required
- (void)settingsDidFinish:(SettingViewController *)mvc numberOfDice:(NSInteger)nod colorOfDice:(NSString *)cod;

@end




@interface SettingViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
{
    int tapCount;

}

@property (weak) id<SettingViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel *numOfDice;


@property (weak, nonatomic) IBOutlet UISlider *diceNumber;


@property (weak, nonatomic) IBOutlet UIPickerView *colorPicker;




- (IBAction)finishSetting:(id)sender;

//- (IBAction)sliderChanged:(UIGestureRecognizer *) g;

- (IBAction)sliderChanged:(id) sender;



@end
