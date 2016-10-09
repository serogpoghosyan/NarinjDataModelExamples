//
//  Cook+CoreDataProperties.h
//  NarinjDataModelExamples
//
//  Created by Seryozha Poghosyan on 10/9/16.
//  Copyright © 2016 ACA. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Cook.h"

NS_ASSUME_NONNULL_BEGIN

@interface Cook (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *active;
@property (nullable, nonatomic, retain) NSString *location;
@property (nullable, nonatomic, retain) NSString *profileImageName;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *dishes;

@end

@interface Cook (CoreDataGeneratedAccessors)

- (void)addDishesObject:(NSManagedObject *)value;
- (void)removeDishesObject:(NSManagedObject *)value;
- (void)addDishes:(NSSet<NSManagedObject *> *)values;
- (void)removeDishes:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
