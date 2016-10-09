//
//  Product+CoreDataProperties.h
//  NarinjDataModelExamples
//
//  Created by Seryozha Poghosyan on 10/9/16.
//  Copyright © 2016 ACA. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Product.h"

NS_ASSUME_NONNULL_BEGIN

@interface Product (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *dishDescription;
@property (nullable, nonatomic, retain) NSString *imageName;
@property (nullable, nonatomic, retain) NSNumber *price;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) Cook *cook;

@end

NS_ASSUME_NONNULL_END
