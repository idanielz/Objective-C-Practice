//
//  main.m
//  Getting a Reference to Address Book
//
//  Created by Vandad Nahavandipoor on 21/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

// 1. 添加AddressBook.framework
// 2. #import <AddressBook/AddressBook.h>
// 3. 

/*
 typedef CF_ENUM(CFIndex, ABAuthorizationStatus) {
 kABAuthorizationStatusNotDetermined = 0,
 kABAuthorizationStatusRestricted,
 kABAuthorizationStatusDenied,
 kABAuthorizationStatusAuthorized
 };
 AB_EXTERN ABAuthorizationStatus ABAddressBookGetAuthorizationStatus(void) __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0);
 */
// 4. ABAddressBookCreateWithOptions
// 5. ABAddressBookRequestAccessWithCompletion
// 6. ABAddressBookRef
// 7. ABAddressBookHasUnsavedChanges(paramAddressBook)){
// 8. ABAddressBookSave(paramAddressBook,
// 9. ABAddressBookRevert(paramAddressBook);
// 10. NSArray *arrayOfAllPeople = (__bridge_transfer NSArray *) ABAddressBookCopyArrayOfAllPeople(paramAddressBook);
// 11. ABRecordRef
// 12. 个人信息属性
/*
 // Property keys
 AB_EXTERN const ABPropertyID kABPersonFirstNameProperty;          // First name - kABStringPropertyType
 AB_EXTERN const ABPropertyID kABPersonLastNameProperty;           // Last name - kABStringPropertyType
 AB_EXTERN const ABPropertyID kABPersonMiddleNameProperty;         // Middle name - kABStringPropertyType
 AB_EXTERN const ABPropertyID kABPersonPrefixProperty;             // Prefix ("Sir" "Duke" "General") - kABStringPropertyType
 AB_EXTERN const ABPropertyID kABPersonSuffixProperty;             // Suffix ("Jr." "Sr." "III") - kABStringPropertyType
 AB_EXTERN const ABPropertyID kABPersonNicknameProperty;           // Nickname - kABStringPropertyType
 AB_EXTERN const ABPropertyID kABPersonFirstNamePhoneticProperty;  // First name Phonetic - kABStringPropertyType
 AB_EXTERN const ABPropertyID kABPersonLastNamePhoneticProperty;   // Last name Phonetic - kABStringPropertyType
 AB_EXTERN const ABPropertyID kABPersonMiddleNamePhoneticProperty; // Middle name Phonetic - kABStringPropertyType
 AB_EXTERN const ABPropertyID kABPersonOrganizationProperty;       // Company name - kABStringPropertyType
 AB_EXTERN const ABPropertyID kABPersonJobTitleProperty;           // Job Title - kABStringPropertyType
 AB_EXTERN const ABPropertyID kABPersonDepartmentProperty;         // Department name - kABStringPropertyType
 AB_EXTERN const ABPropertyID kABPersonEmailProperty;              // Email(s) - kABMultiStringPropertyType
 AB_EXTERN const ABPropertyID kABPersonBirthdayProperty;           // Birthday associated with this person - kABDateTimePropertyType
 AB_EXTERN const ABPropertyID kABPersonNoteProperty;               // Note - kABStringPropertyType
 AB_EXTERN const ABPropertyID kABPersonCreationDateProperty;       // Creation Date (when first saved)
 AB_EXTERN const ABPropertyID kABPersonModificationDateProperty;   // Last saved date
 
 // Addresses
 AB_EXTERN const ABPropertyID kABPersonAddressProperty;            // Street address - kABMultiDictionaryPropertyType
 AB_EXTERN const CFStringRef kABPersonAddressStreetKey;
 AB_EXTERN const CFStringRef kABPersonAddressCityKey;
 AB_EXTERN const CFStringRef kABPersonAddressStateKey;
 AB_EXTERN const CFStringRef kABPersonAddressZIPKey;
 AB_EXTERN const CFStringRef kABPersonAddressCountryKey;
 AB_EXTERN const CFStringRef kABPersonAddressCountryCodeKey;

 */
// ABPersonCreate(); ABRecordSetValue(result,
// ABAddressBookAddRecord(paramAddressBook,
// ABGroupAddMember




#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char *argv[])
{
  @autoreleasepool {
      return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
  }
}
