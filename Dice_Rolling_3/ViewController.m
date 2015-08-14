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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


































@end
