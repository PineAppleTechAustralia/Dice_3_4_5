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
    NSInteger val;
    NSString *color;
    NSInteger rowNumber;
}

@end


@implementation SettingViewController

@synthesize delegate;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //init slider
    self.diceNumber.minimumValue = 1;
    self.diceNumber.maximumValue = 6;
    
    //self.diceNumber.value = 2;
    
    self.diceNumber.value = ((ViewController*)[self delegate])->internal_no_of_dice;
    
    self.numOfDice.text = [NSString stringWithFormat:@"Dice to Roll: %ld", lround(self.diceNumber.value)];
    
   
    
    
    //single touch
    /*tapCount = 0;
    
    UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sliderChanged:)];
    
    [self.diceNumber addGestureRecognizer:gr];*/
    
    //init picker value
     _pickerData = @[@"DICE1", @"DICE2", @"DICE3"];
    
    //connect data
    //This code actually sets this ViewController instance as the datasource and delegate of the Picker View we added to the storyboard.
    self.colorPicker.dataSource = self;
    self.colorPicker.delegate = self;
    
    NSString *colorPicked = ((ViewController*)[self delegate])->internal_color;
    
    int index = 0;
    
    for (int i = 0; i< _pickerData.count; i++) {
        
        if([_pickerData[i] isEqualToString:colorPicked])
            
            index = i;
    }
    
    [self.colorPicker selectRow:index inComponent:0 animated:YES];
    
    
    
    
}


#pragma mark - picker view delegate

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
}

// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
    
    
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
    
    val = lround(self.diceNumber.value);
 
    
    rowNumber= [self.colorPicker selectedRowInComponent:0];
    color = [_pickerData objectAtIndex:rowNumber];
    
    
    if ( [self.delegate respondsToSelector: @selector(settingsDidFinishWithNumberOfDice:colorOfDice:)]) {
        [self.delegate settingsDidFinishWithNumberOfDice: val colorOfDice:color];
    }

    //[self.delegate settingsDidFinish:self numberOfDice:val1 colorOfDice:color];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

//UISlider

- (IBAction)sliderChanged:(id)sender {
    
    //UISlider *slider = (UISlider *)sender;
    
    NSInteger val1 = lround(self.diceNumber.value);
    self.numOfDice.text = [NSString stringWithFormat:@"Dice to Roll: %ld", val1];
    
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
