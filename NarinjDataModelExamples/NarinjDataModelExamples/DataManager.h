//
//  DataManager.h
//  NarinjDataModelExamples
//
//  Created by Seryozha Poghosyan on 10/6/16.
//  Copyright © 2016 ACA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DataManager : NSObject

+ (instancetype)sharedManager;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (void)saveContext;

@end
