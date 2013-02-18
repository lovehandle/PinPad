//
//  PinPadViewController.h
//  PinPad
//
//  Created by Ryan Closner on 2/18/13.
//  Copyright (c) 2013 Ryan Closner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PinPadViewController : UIViewController {
    NSString *pin;
    int tries;
    
    IBOutlet UILabel *pinMessage;
    
    IBOutlet UILabel *pinLabel1;
    IBOutlet UILabel *pinLabel2;
    IBOutlet UILabel *pinLabel3;
    IBOutlet UILabel *pinLabel4;
}

@property (retain, nonatomic) NSString *pin;
@property int tries;

- (IBAction)digitPressed:(UIButton *)sender;


@end
