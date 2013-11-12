//
//  main.m
//  BMITime
//
//  Created by DanielZ on 13-11-2.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Employee.h"
#import "Assets.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        Person *per = [[Person alloc] init];
        [per setHeightInmeters: 1.8];
        [per setWeightInKilos: 50];
        Employee *em = [[Employee alloc] init];
        [em setHeightInmeters: 1.8];
        [em setWeightInKilos: 50];
        
        NSLog(@"The Person %.2f height and %d weight 's BMI is %.2f", [per heightInmeters], [per weightInKilos], [per bodyMassIndex]);
        NSLog(@"The Employee %.2f height and %d weight 's BMI is %.2f", [em heightInmeters], [em weightInKilos], [em bodyMassIndex]);
        
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        for (int i = 0; i<10; i++)
        {
            Employee *person = [[Employee alloc] init];
            [person setWeightInKilos:90+i];
            [person setHeightInmeters:1.8 - i/10.0];
            [person setEmployID:i];
            [employees addObject:person];
        }
        
        NSMutableArray *all_assets = [[NSMutableArray alloc] init];
        for (int i = 0; i<10; i++)
        {
            Assets *asset = [[Assets alloc]init];
            
            NSString *currentLabel = [NSString stringWithFormat:@"LapTop %d", i];
            [asset setLabel:currentLabel];
            [asset setResaleValue:i*17];
            NSInteger randomIndex = random() % [employees count];
            Employee *randomEmployee = [employees objectAtIndex:randomIndex];
            
            [randomEmployee addAssetsObject:asset];
            [all_assets addObject:asset];
        }
        
        //NSPredicate对象，用于过滤collect对象相关的任务，查看文档Predicate Programming Guide
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"holder.valueOfAssets > 70"];
//        NSArray *arrayPredicate = [all_assets filteredArrayUsingPredicate:predicate];
//        
//        NSLog(@"assetPredicate：%@",arrayPredicate);
        
//        NSSortDescriptor *voa = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets" ascending:YES];
//        NSSortDescriptor *ei = [NSSortDescriptor sortDescriptorWithKey:@"employID" ascending:YES];
//        [employees sortUsingDescriptors:[NSArray arrayWithObjects:voa, ei , nil]];
//        NSLog(@"Employee： %@", employees);
//
//        NSMutableSet *ms = [[NSMutableSet alloc] init];
//        [ms addObjectsFromArray:employees];
//        NSLog(@"ms: %@", ms);
//        if([ms containsObject:@"1"])
//            NSLog(@"yes................");
//        ms = nil;
        
        NSLog(@"Giving up ownership of one employee");
        [employees removeObjectAtIndex:5];
        NSLog(@"all_assets： %@", all_assets);

        NSLog(@"Giving up ownership of array");
        all_assets = nil;
        employees = nil;
    }
    //sleep(100);
    return 0;
}

