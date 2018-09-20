//
//  AddViewController.m
//  lab01-todoapp
//
//  Created by Ibrahim Mehkri on 2018-09-20.
//  Copyright © 2018 Ibrahim Mehkri. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISwitch *isImportantToggle;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if(sender == self.doneButton){
        if(self.textField.text.length > 0){
            TodoItem *itemAdded = [[TodoItem alloc]initWithName:self.textField.text important:_isImportantToggle.isOn];
            self.item = itemAdded;
        }
    }
}


@end
