//
//  PinPadViewController.m
//  PinPad
//
//  Created by Ryan Closner on 2/18/13.
//  Copyright (c) 2013 Ryan Closner. All rights reserved.
//

#import "PinPadViewController.h"

@interface PinPadViewController ()

@end

@implementation PinPadViewController


@synthesize pin;
@synthesize tries;

- (IBAction)digitPressed:(UIButton *)sender
{
    if ([self canAttemptPin]) {
        if (![self fullPinEntered]) {
            
            self.pin = [ self.pin stringByAppendingString: sender.titleLabel.text ];
            
            switch ([pin length]) {
                case 0:
                    pinLabel1.text = @"[     ]";
                    pinLabel2.text = @"[     ]";
                    pinLabel3.text = @"[     ]";
                    pinLabel4.text = @"[     ]";
                    break;
                case 1:
                    pinLabel1.text = @"[  *  ]";
                    pinLabel2.text = @"[     ]";
                    pinLabel3.text = @"[     ]";
                    pinLabel4.text = @"[     ]";
                    break;
                case 2:
                    pinLabel1.text = @"[  *  ]";
                    pinLabel2.text = @"[  *  ]";
                    pinLabel3.text = @"[     ]";
                    pinLabel4.text = @"[     ]";
                    break;
                case 3:
                    pinLabel1.text = @"[  *  ]";
                    pinLabel2.text = @"[  *  ]";
                    pinLabel3.text = @"[  *  ]";
                    pinLabel4.text = @"[     ]";
                    break;
                case 4:
                    pinLabel1.text = @"[  *  ]";
                    pinLabel2.text = @"[  *  ]";
                    pinLabel3.text = @"[  *  ]";
                    pinLabel4.text = @"[  *  ]";
                default:
                    break;
            }
            
            if ([self fullPinEntered]) {
                if ([self pinIsValid]) {
                    pinMessage.text = @"Pin is Valid!";
                } else {
                    self.tries += 1;
                    [self resetPin];
                    pinMessage.text = @"Pin is Invalid!";
                }
            }
        }
    } else {
        pinMessage.text = @"You have been locked out.";
    }
}

- (BOOL)fullPinEntered
{
    if (self.pin.length == 4) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)canAttemptPin
{
    if (self.tries < 3) {
        return YES;
    } else {
        return NO;
    }
}

- (void)resetPin
{
    self.pin = @"";
    
    pinLabel1.text = @"[     ]";
    pinLabel2.text = @"[     ]";
    pinLabel3.text = @"[     ]";
    pinLabel4.text = @"[     ]";
}

- (void)resetTries
{
    self.tries = 0;
}

- (BOOL)pinIsValid
{
    if ([self.pin isEqual:@"1111"]) {
        return YES;
    } else {
        return NO;
    }
}

- (void)viewDidLoad 
{
    [super viewDidLoad];
    [self resetPin];
    [self resetTries];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
