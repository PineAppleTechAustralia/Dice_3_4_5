//
//  ViewController.m
//  Dice_Rolling_3
//
//  Created by Lisa Cao on 8/14/15.
//  Copyright (c) 2015 Lisa Cao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

    
@property (weak, nonatomic) IBOutlet UIButton *secondDice;

@property (weak, nonatomic) IBOutlet UIButton *firstDice;

@property (weak, nonatomic) IBOutlet UILabel *totalDiceNumber;

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    // Do any additional setup after loading the view, typically from a nib.
    internal_no_of_dice = 2;
    internal_color = @"DICE3";
    
    
    [super viewDidLoad];
}


//random number, string format, switch

- (IBAction)diceRoll:(UIButton *)sender {
    
    int number = arc4random_uniform(6)+1;
    
    [sender setImage:[UIImage imageNamed:[[NSString alloc] initWithFormat:@"%u",number]] forState:UIControlStateNormal];
    
//    switch (number) {
//        case 1:
//            [sender setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
//            break;
//            
//        case 2:
//            [sender setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
//            break;
//            
//        case 3:
//            [sender setImage:[UIImage imageNamed:@"3"] forState:UIControlStateNormal];
//            break;
//            
//        case 4:
//            [sender setImage:[UIImage imageNamed:@"4"] forState:UIControlStateNormal];
//            break;
//            
//        case 5:
//            [sender setImage:[UIImage imageNamed:@"5"] forState:UIControlStateNormal];
//            break;
//            
//        case 6:
//            [sender setImage:[UIImage imageNamed:@"6"] forState:UIControlStateNormal];
//            break;
//            
//        default:
//            break;
//    }
    
    
    
}
- (IBAction)rollingDice:(UIButton *)sender {
    
    int dice1 = arc4random_uniform(6)+1;
    int dice2 = arc4random_uniform(6)+1;
    
    [self.firstDice setImage:[UIImage imageNamed:[[NSString alloc] initWithFormat:@"%u",dice1]] forState:UIControlStateNormal];
    
    [self.secondDice setImage:[UIImage imageNamed:[[NSString alloc] initWithFormat:@"%u",dice2]] forState:UIControlStateNormal];
    
    int total = dice1 + dice2;
    
    [self.totalDiceNumber setText:[NSString stringWithFormat:@"Total: %d",total]];
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"settingsSegue"])
    {
        
        [segue.destinationViewController setDelegate:self];
        
    }

}



- (void) performRoll
{
    int d = 93; //distance of diagonal
    int d_half = 47;
    
    //Remove all previous dice
    for (DiceHolder *previousDicesHolders in [self.view subviews]) {
        if ([previousDicesHolders class] == [DiceHolder class])
            [previousDicesHolders removeFromSuperview];
        
    }
    
    NSMutableArray *diceData = [[NSMutableArray alloc] init];
    
    //Iterate for all individual dice
    for (int i = 0;i<internal_no_of_dice;i++)
    {
        NSNumber *randomNumber = [[NSNumber alloc] initWithInt:((int)arc4random_uniform(6)+1)];
        
        NSMutableArray *tempEachDice = [[NSMutableArray alloc] init];
        
        [tempEachDice insertObject:randomNumber atIndex:0]; //Value of Dice is 0th position
        
        //Now calculate new positions
        int newPossibleX;
        int newPossibleY;
        BOOL flag = YES;
        do {
            
            newPossibleX = d_half + arc4random_uniform(320-d);//66);
            newPossibleY = d_half + arc4random_uniform(660 - d - (int)rollButton.frame.size.height);
            
            
            //Check if newPossibleX and newPossibleY are too close to other dice positions
            for (int y = 0; y<i; y++)
            {
                int checkX = [(NSNumber *)[[diceData objectAtIndex:y] objectAtIndex:1] intValue];
                int checkY = [(NSNumber *)[[diceData objectAtIndex:y] objectAtIndex:2] intValue];
                
                if ( ( ((newPossibleX - checkX)*(newPossibleX - checkX)) + ((newPossibleY - checkY)*(newPossibleY - checkY)) ) <=  (d*d) )
                {
                    //Too close
                    flag = NO;
                    break;
                }
                else
                {
                    flag = YES;
                }
            }
        } while (flag==NO);
        
        //Store new approved position values
        NSNumber *randomX = [[NSNumber alloc] initWithInt:(newPossibleX)];
        NSNumber *randomY = [[NSNumber alloc] initWithInt:(newPossibleY)];
        
        [tempEachDice insertObject:randomX atIndex:1];
        [tempEachDice insertObject:randomY atIndex:2];
        
        [diceData insertObject:tempEachDice atIndex:i];
        
    }
    
    //Play Sound
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Roll" ofType:@"mp3"];
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge_retained CFURLRef)[NSURL fileURLWithPath:path], &soundID);
    AudioServicesPlaySystemSound(soundID);
    
    int total = 0;
    //Place all dice in the same location
    for (int t = 0; t < internal_no_of_dice; t++)
    {
       
        //Add up totals
        total = total + [(NSNumber *)[[diceData objectAtIndex:t] objectAtIndex:0] intValue];
        
        
        //Create temp dice
        DiceHolder *tempDice = [[DiceHolder alloc] initWithColor:internal_color withNumber:[[diceData objectAtIndex:t] objectAtIndex:0]];
      
        [self.view addSubview:tempDice];
     
        
        tempDice.frame = CGRectMake(self.view.frame.size.width,self.view.frame.size.height/2,66,66);
        
        //tempDice.frame = CGRectMake([(NSNumber *)[[diceData objectAtIndex:t]objectAtIndex:1] intValue], [(NSNumber *)[[diceData objectAtIndex:t]objectAtIndex:2] intValue], 66, 66);
        
        //animation
        
        [UIImageView animateWithDuration:.5
                              animations:^{
                                  CGAffineTransform rotate = CGAffineTransformMakeRotation ((arc4random_uniform(1.75*3.14159)+0.25*3.14159));//(7)+0.5));
                                  tempDice.transform = 	rotate;
                                  
                                  tempDice.center = CGPointMake([(NSNumber *)[[diceData objectAtIndex:t]objectAtIndex:1] intValue], [(NSNumber *)[[diceData objectAtIndex:t]objectAtIndex:2] intValue]);
                              }
                              completion:nil];
        
    }
    
    self.totalLabel.text = [[NSString alloc] initWithFormat:@"Total: %u", total];
}



#pragma mark - settings
- (void)settingsDidFinishWithNumberOfDice: (NSInteger)nod colorOfDice:(NSString *)cod;
{
    
    //Change Internal Settings
    internal_no_of_dice = nod;
    internal_color = cod;
    
    //Dismiss Setting Window
    [self dismissViewControllerAnimated:YES completion:nil];
}



//- (IBAction)settingsPushed:(id)sender {
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
//    SettingViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"AddNote"];
//    vc.delegate = self;
//    [self presentViewController:vc animated:YES completion:nil];
//    
//}



- (IBAction)performRolling:(UIButton *)sender {
    
    
    [self performRoll];
    
    
}



















@end
