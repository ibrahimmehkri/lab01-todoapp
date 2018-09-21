//
//  TodoTableViewController.m
//  lab01-todoapp
//
//  Created by Ibrahim Mehkri on 2018-09-20.
//  Copyright © 2018 Ibrahim Mehkri. All rights reserved.
//

#import "TodoTableViewController.h"
#import "TodoItem.h"
#import "AddViewController.h"

@interface TodoTableViewController ()

@property NSMutableArray *todos;

@end

@implementation TodoTableViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    self.todos = [[NSMutableArray alloc]init];

    [self loadInitialData];
    
    NSLog(@"This should appear on my github account!"); 

}

-(void)loadInitialData{

    TodoItem *item1 = [[TodoItem alloc]initWithName:@"read a book" important:NO];

    [self.todos addObject:item1];

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.todos count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"ListCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    TodoItem *item = self.todos[indexPath.row];
    
    
    if(item.completed){
        
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc]initWithString:item.itemName attributes:@{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:2]}];
        
        cell.textLabel.attributedText = attrString;
        
        cell.backgroundColor = [UIColor lightGrayColor];
    
    } else {
    
        cell.textLabel.attributedText = nil; 
        
        cell.textLabel.text = item.itemName;
        
        cell.backgroundColor = [UIColor whiteColor];
    
    }
    
    if(item.important){
    
        cell.textLabel.textColor = [UIColor redColor];
    
    } else {
    
        cell.textLabel.textColor = [UIColor blackColor];
    
    }
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    TodoItem *item = self.todos[indexPath.row];
    
    item.completed = !item.completed;
    
    [tableView reloadData];
    
}

-(IBAction)unwindToTable:(UIStoryboardSegue *)segue{
    
    AddViewController *source = [segue sourceViewController];
    
    TodoItem *item = source.item;
    
    [self.todos addObject:item];
    
    [self.tableView reloadData];
}

@end
