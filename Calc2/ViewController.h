//
//  ViewController.h
//  Calc2
//
//  Created by admin on 6/16/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"

@interface ViewController : UIViewController {
    IBOutlet UILabel *result;
}

@property (strong, nonatomic) NSString *graphExpression;
@property(strong, nonatomic) IBOutlet UIButton *dot;

- (IBAction)percent:(id)sender;
- (IBAction)sqrt:(id)sender;
- (IBAction)exp:(id)sender;
- (IBAction)clear:(id)sender;
- (IBAction)bracket1:(id)sender;
- (IBAction)bracket2:(id)sender;
- (IBAction)divide:(id)sender;
- (IBAction)multiply:(id)sender;
- (IBAction)minus:(id)sender;
- (IBAction)plus:(id)sender;
- (IBAction)equals:(id)sender;
- (IBAction)back:(id)sender;
- (IBAction)dot:(id)sender;
- (IBAction)zero:(id)sender;
- (IBAction)one:(id)sender;
- (IBAction)two:(id)sender;
- (IBAction)three:(id)sender;
- (IBAction)four:(id)sender;
- (IBAction)five:(id)sender;
- (IBAction)six:(id)sender;
- (IBAction)seven:(id)sender;
- (IBAction)eight:(id)sender;
- (IBAction)nine:(id)sender;
- (IBAction)sin:(id)sender;
- (IBAction)cos:(id)sender;

@end

