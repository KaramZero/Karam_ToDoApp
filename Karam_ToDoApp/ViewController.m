//
//  ViewController.m
//  Karam_ToDoApp
//
//  Created by Karam Ibrahim on 4/14/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

#import "ViewController.h"
#import "ToDo.h"
#import "AddToDoViewController.h"
#import "DetailsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

DetailsViewController *detailView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   _mainList = [NSMutableArray new ];
    _list = _mainList ;
    

    _myTable.delegate = self;
    _myTable.dataSource = self;
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_list count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    ToDo *todo = [_list objectAtIndex:indexPath.row];
    cell.textLabel.text = todo.name;
    cell.detailTextLabel.text = todo.desc;
    if ([todo.priority isEqual:@"low"]) {
        cell.imageView.image =[UIImage imageNamed:@"low.png"];
    }else if ([todo.priority isEqual:@"med"]) {
        cell.imageView.image =[UIImage imageNamed:@"med.png"];
    }else if ([todo.priority isEqual:@"high"]) {
        cell.imageView.image =[UIImage imageNamed:@"high.png"];
    }
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_list removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
    [_myTable reloadData];

}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ToDo *todo = [_list objectAtIndex:indexPath.row];
    printf("didSelectRowAtIndexPath \n");

    detailView.todo = todo;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    printf("prepareForSegue \n");
    
    if([segue.identifier isEqual: @"add"]){
        AddToDoViewController *v = segue.destinationViewController;
        v.homeView = self;
        printf("\n set for adding \n\n");

    }else if([segue.identifier isEqual: @"details"]){
        detailView = segue.destinationViewController;
    }
    
  
}


- (IBAction)mySegmented:(UISegmentedControl *)sender {
    
    _list = [NSMutableArray new ];
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            for (ToDo *t in _mainList) {
                if ([t.priority isEqual:@"high"]) {
                     [_list addObject:t];
                }
            }
            break;
            
        case 1:
            for (ToDo *t in _mainList) {
                           if ([t.priority isEqual:@"med"]) {
                                [_list addObject:t];
                           }
                       }
        
            break;
        
        case 2:
            for (ToDo *t in _mainList) {
                           if ([t.priority isEqual:@"low"]) {
                                [_list addObject:t];
                           }
                       }
            
            break;
        case 3:
            for (ToDo *t in _mainList) {
                if ([t.state isEqual:@"todo"]) {
                     [_list addObject:t];
                }
            }
            
            break;
        case 4:
            for (ToDo *t in _mainList) {
                if ([t.state isEqual:@"doing"]) {
                     [_list addObject:t];
                }
            }
            
            break;
        case 5:
            for (ToDo *t in _mainList) {
                if ([t.state isEqual:@"done"]) {
                     [_list addObject:t];
                }
            }
                
                break;
        case 6:
            _list = _mainList;
                break;
            
        default:
               _list = _mainList;
            break;
    }
    
    [_myTable reloadData];
}

-(void)addToDo:(ToDo *)todo{
    printf("\nnew item add\n\n");

     [_mainList addObject:todo];
    printf("%d\n",[_list count]);
     [_myTable reloadData];

}

@end
