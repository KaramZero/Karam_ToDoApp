//
//  AddToDoViewController.h
//  Karam_ToDoApp
//
//  Created by Karam Ibrahim on 4/14/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "addTodoProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddToDoViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *desc;

@property (weak, nonatomic) IBOutlet UIPickerView *picker;
- (IBAction)confirm:(UIButton *)sender;

@property id<AddToDoProtocol> homeView;
@end

NS_ASSUME_NONNULL_END
