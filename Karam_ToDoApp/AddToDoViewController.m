//
//  AddToDoViewController.m
//  Karam_ToDoApp
//
//  Created by Karam Ibrahim on 4/14/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

#import "AddToDoViewController.h"
#import "ToDo.h"

@interface AddToDoViewController ()


@end

@implementation AddToDoViewController

NSString *name;
NSString *description;
NSString *priority = @"low";
NSString *date;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _picker.delegate = self;
    _picker.dataSource = self;

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    priority = @"low";
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;  // Or return whatever as you intend
}


- (NSInteger)pickerView:(UIPickerView *)thePickerView
numberOfRowsInComponent:(NSInteger)component {
    return 3;//Or, return as suitable for you...normally we use array for dynamic
}

- (NSString *)pickerView:(UIPickerView *)thePickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (row == 0) {
        return [NSString stringWithFormat:@"%d Low",row];//Or, your suitable title; like Choice-a, etc.

    }else if(row == 1){
        return [NSString stringWithFormat:@"%d Med",row];//Or, your suitable title; like Choice-a, etc.
    }
    else
    return [NSString stringWithFormat:@"%d High",row];//Or, your suitable title; like Choice-a, etc.
}

- (void)pickerView:(UIPickerView *)thePickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    
    switch (row) {
        case 0:
            priority = @"low";
            break;
        case 1:
            priority = @"med";
            break;
        case 2:
            priority = @"high";
            break;

        default:
            break;
    }


}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)confirm:(UIButton *)sender {
    ToDo *todo = [ToDo new];

    todo.name = _name.text;
    todo.desc = _desc.text;
    todo.priority = priority;
    
    
    NSDate *day = [NSDate date];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [format stringFromDate:day];
    
    todo.datee = dateString;
    todo.state = @"todo";
    [_homeView addToDo:todo];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
