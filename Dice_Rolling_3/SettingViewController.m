//
//  SettingViewController.m
//  Dice_Rolling_3
//
//  Created by Lisa Cao on 8/14/15.
//  Copyright (c) 2015 Lisa Cao. All rights reserved.
//

#import "SettingViewController.h"
#import "ViewController.h"

@interface SettingViewController ()
{
    NSArray *_pickerData;
}

@end


@implementation SettingViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //init slider
    self.diceNumber.minimumValue = 1;
    self.diceNumber.maximumValue = 6;
    self.diceNumber.value = 2;
    
    //single touch
    /*tapCount = 0;
    
    UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sliderChanged:)];
    
    [self.diceNumber addGestureRecognizer:gr];*/
    
    //init picker value
     _pickerData = @[@"DICE1", @"DICE2", @"DICE3"];
    
    
}

- (void)didReceiveMemoryWarning {
    
       [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)finishSetting:(id)sender {
    //[self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

//UISlider

- (IBAction)sliderChanged:(id)sender {
    
    //UISlider *slider = (UISlider *)sender;
    
    NSInteger val = lround(self.diceNumber.value);
    
    self.numOfDice.text = [NSString stringWithFormat:@"Dice to Roll: %ld", val];
    
}

//- (IBAction)sliderChanged:(UIGestureRecognizer *)g
//{
//    
//    UISlider* s = (UISlider*)g.view;
//    if (s.highlighted)
//    {
//        return; // tap on thumb, let slider deal with it
//    
//    }
//    
//    CGPoint pt = [g locationInView: s];
//    CGFloat percentage = pt.x / s.bounds.size.width;
//    CGFloat delta = percentage * (s.maximumValue - s.minimumValue);
//    CGFloat value = s.minimumValue + delta;
//    [s setValue:value animated:YES];
//    
//    [s sendActionsForControlEvents:UIControlEventValueChanged];
//    
//    NSInteger val = lround(self.diceNumber.value);
//    
//    self.numOfDice.text = [NSString stringWithFormat:@"Dice to Roll: %ld", val];
//
//}















@end
