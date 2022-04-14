//
//  ViewController.h
//  Karam_ToDoApp
//
//  Created by Karam Ibrahim on 4/14/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "addTodoProtocol.h"
@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, AddToDoProtocol>

@property NSMutableArray *list;
@property NSMutableArray *mainList;


@property (weak, nonatomic) IBOutlet UITableView *myTable;

- (IBAction)mySegmented:(UISegmentedControl *)sender;


@end

