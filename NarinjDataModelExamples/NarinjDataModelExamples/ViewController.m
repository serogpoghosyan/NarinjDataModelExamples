//
//  ViewController.m
//  NarinjDataModelExamples
//
//  Created by Seryozha Poghosyan on 10/6/16.
//  Copyright © 2016 ACA. All rights reserved.
//

#import "ViewController.h"
#import "DataManager.h"
#import "Cook.h"
#import "Product.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //[self initializeTestData];
    NSArray <Product *>*products = [self fetchAllProducts];
    for (Product *product in products) {
        NSLog(@"%@ - %@", product.title, product.price);
        //[[[DataManager sharedManager] managedObjectContext] deleteObject:product];
    }
    
    NSLog(@"=== Cheap Products ===");
    products = [self fetchCheapProducts];
    for (Product *product in products) {
        NSLog(@"%@ - %@", product.title, product.price);
    }
}

- (NSArray <Product *>*)fetchAllProducts {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Product"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"price" ascending:YES],
                                     [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]];
    return [[[DataManager sharedManager] managedObjectContext] executeFetchRequest:fetchRequest error:nil];
}

- (NSArray <Product *>*)fetchCheapProducts {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Product"];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"price > 500 AND price < 1000"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"price" ascending:YES]];
    return [[[DataManager sharedManager] managedObjectContext] executeFetchRequest:fetchRequest error:nil];
}

- (void)initializeTestData {
    
    NSManagedObjectContext *context = [[DataManager sharedManager] managedObjectContext];
    
    // Create cook instaces
    Cook *cook1 = [NSEntityDescription insertNewObjectForEntityForName:@"Cook" inManagedObjectContext:context];
    cook1.firstName = @"Մայա";
    cook1.lastName = @"Արզումանյան";
    
    Cook *cook2 = [NSEntityDescription insertNewObjectForEntityForName:@"Cook" inManagedObjectContext:context];
    cook2.firstName = @"Մելանյա";
    cook2.lastName = @"Հակոբյան";
    
    Cook *cook3 = [NSEntityDescription insertNewObjectForEntityForName:@"Cook" inManagedObjectContext:context];
    cook3.firstName = @"Ժաննա";
    cook3.lastName = @"Մանուկյան";
    
    // Create product instances
    
    Product *product1 = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:context];
    product1.title = @"Կաղամբով աղցան";
    product1.price = @(800);
    product1.cook = cook1;
    
    Product *product2 = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:context];
    product2.title = @"Ստալիչնի";
    product2.price = @(900);
    product2.cook = cook2;
    
    Product *product3 = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:context];
    product3.title = @"Լանչ Կիևյան կոտլետով";
    product3.price = @(1100);
    
    Product *product4 = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:context];
    product4.title = @"Բրինձ";
    product4.price = @(550);
    cook3.dishes = [NSSet setWithArray:@[product3, product4]];
    
    [[DataManager sharedManager] saveContext];
}

@end
