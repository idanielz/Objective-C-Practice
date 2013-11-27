//
//  ViewController.m
//  GoogleLocations
//
// Copyright 2011 Joshua Drew
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
// http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "ViewController.h"
#import "SBJson.h"
#import "GTMNSString+URLArguments.h"
#import "GooglePlacesObject.h"
#import "DetailViewController.h"

@implementation ViewController

@synthesize resultsLoaded;
@synthesize locationManager;
@synthesize currentLocation;
@synthesize urlConnection;
@synthesize responseData;
@synthesize locations;
//NEW - to handle filtering
@synthesize locationsFilterResults;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.refreshHeaderView setLastRefreshDate:nil];    
    
    responseData = [[NSMutableData data] init];
    
    [[self locationManager] startUpdatingLocation];
    
    [tableView reloadData];
    [tableView setContentOffset:CGPointZero animated:NO];
    
    [searchBar setDelegate:self];
    
    googlePlacesConnection = [[GooglePlacesConnection alloc] initWithDelegate:self];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [self setUrlConnection:nil];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (NSUInteger)arrayIndexFromIndexPath:(NSIndexPath *)path 
{
    return path.row;
}

- (void)updateSearchString:(NSString*)aSearchString
{
    searchString = [[NSString alloc]initWithString:aSearchString];
    
    //What places to search for
    NSString *searchLocations = [NSString stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@", 
                                 kBar, 
                                 kRestaurant,
                                 kCafe,
                                 kBakery,
                                 kFood,
                                 kLodging,
                                 kMealDelivery,
                                 kMealTakeaway,
                                 kNightClub
                                 ];
    
    
    [googlePlacesConnection getGoogleObjectsWithQuery:searchString 
                                       andCoordinates:CLLocationCoordinate2DMake(currentLocation.coordinate.latitude, currentLocation.coordinate.longitude) 
                                             andTypes:searchLocations];
    
    [tableView reloadData];
}

//UPDATE - to handle filtering
- (void)searchBarTextDidBeginEditing:(UISearchBar *)theSearchBar
{
    [theSearchBar setShowsCancelButton:YES animated:YES];
    //Changed to YES to allow selection when in the middle of a search/filter
    tableView.allowsSelection   = YES;
    tableView.scrollEnabled     = YES;    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)theSearchBar
{
    [theSearchBar setShowsCancelButton:NO animated:YES];
    [theSearchBar resignFirstResponder];
    tableView.allowsSelection   = YES;
    tableView.scrollEnabled     = YES;
    theSearchBar.text           = @"";
    
    [self updateSearchString:searchBar.text];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)theSearchBar
{
    tableView.allowsSelection   = YES;
    tableView.scrollEnabled     = YES;
    
    [self updateSearchString:theSearchBar.text];
}

//NEW - to handle filtering
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self buildSearchArrayFrom:searchText];
}

//NEW - to handle filtering
//Create an array by applying the search string
- (void) buildSearchArrayFrom: (NSString *) matchString
{
	NSString *upString = [matchString uppercaseString];
	
	locationsFilterResults = [[NSMutableArray alloc] init];
    
	for (GooglePlacesObject *location in locations)
	{
		if ([matchString length] == 0)
		{
			[locationsFilterResults addObject:location];
			continue;
		}
		
		NSRange range = [[location.name uppercaseString] rangeOfString:upString];
		
        if (range.location != NSNotFound) 
        {
            NSLog(@"Hit");
            
            NSLog(@"Location Name %@", location.name);
            NSLog(@"Search String %@", upString);
            
            [locationsFilterResults addObject:location];
        }
	}
	
	[tableView reloadData];
}

#pragma mark -
#pragma mark PullToRefresh
- (void)reloadTableViewDataSource
{
    [self setResultsLoaded:NO];
    
    [[self locationManager] startUpdatingLocation];
    
	[super performSelector:@selector(dataSourceDidFinishLoadingNewData) withObject:nil afterDelay:3.0];
}

- (void)dataSourceDidFinishLoadingNewData
{
    [refreshHeaderView setCurrentDate];  //  should check if data reload was successful 
    [super dataSourceDidFinishLoadingNewData];
}

#pragma mark -
#pragma mark Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

//UPDATE - to handle filtering
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    //return [locations count];
    return [locationsFilterResults count];
}

//UPDATE - to handle filtering
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *CellIdentifier = @"LocationCell";
	
	// Dequeue or create a cell of the appropriate type.
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell                = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // Get the object to display and set the value in the cell.    
    GooglePlacesObject *place     = [[GooglePlacesObject alloc] init];
    
    //UPDATED from locations to locationFilter results
    place                       = [locationsFilterResults objectAtIndex:[indexPath row]];
    
    cell.textLabel.text                         = place.name;
    cell.textLabel.adjustsFontSizeToFitWidth    = YES;
	cell.textLabel.font                         = [UIFont systemFontOfSize:12.0];
	cell.textLabel.minimumFontSize              = 10;
	cell.textLabel.numberOfLines                = 4;
	cell.textLabel.lineBreakMode                = UILineBreakModeWordWrap;
    cell.textLabel.textColor                    = [UIColor colorWithRed:0.0 green:128.0/255.0 blue:0.0 alpha:1.0];
    cell.textLabel.textAlignment                = UITextAlignmentLeft;
    
    //You can use place.distanceInMilesString or place.distanceInFeetString.  
    //You can add logic that if distanceInMilesString starts with a 0. then use Feet otherwise use Miles.
    cell.detailTextLabel.text                   = [NSString stringWithFormat:@"%@ - Distance %@ miles", place.vicinity, place.distanceInMilesString];
    cell.detailTextLabel.textColor              = [UIColor darkGrayColor];
    cell.detailTextLabel.font                   = [UIFont systemFontOfSize:10.0];

    return cell;
}

//UPDATE - to handle filtering
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"ShowPlaceDetail"]) 
    {        
        NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
        
        //UPDATED from locations to locationFilterResults
        GooglePlacesObject *places = [locationsFilterResults objectAtIndex:selectedRowIndex.row];
        
        DetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.reference =  places.reference;     
    }
}


#pragma mark -
#pragma mark Location manager

/**
 Return a location manager -- create one if necessary.
 */
- (CLLocationManager *)locationManager 
{
	
    if (locationManager != nil) 
    {
		return locationManager;
	}
	
	locationManager = [[CLLocationManager alloc] init];
	[locationManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
	[locationManager setDelegate:self];
	
	return locationManager;
}


/**
 Conditionally enable the Add button:
 If the location manager is generating updates, then enable the button;
 If the location manager is failing, then disable the button.
 */
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation 
{
    
    if ([self isResultsLoaded]) 
    {
		return;
	}
    
	[self setResultsLoaded:YES];
    
    currentLocation = newLocation;
    
    //What places to search for
    NSString *searchLocations = [NSString stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@", 
                                 kBar, 
                                 kRestaurant,
                                 kCafe,
                                 kBakery,
                                 kFood,
                                 kLodging,
                                 kMealDelivery,
                                 kMealTakeaway,
                                 kNightClub
                                 ];
    
    [googlePlacesConnection getGoogleObjects:CLLocationCoordinate2DMake(newLocation.coordinate.latitude, newLocation.coordinate.longitude) 
                                    andTypes:searchLocations];
    
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error 
{
    NSLog(@"locationManager FAIL");
    NSLog(@"%@", [error description]);
}

#pragma mark -
#pragma mark NSURLConnections

//UPDATE - to handle filtering
- (void)googlePlacesConnection:(GooglePlacesConnection *)conn didFinishLoadingWithGooglePlacesObjects:(NSMutableArray *)objects 
{
    
    if ([objects count] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No matches found near this location" 
                                                        message:@"Try another place name or address" 
                                                       delegate:nil 
                                              cancelButtonTitle:@"OK" 
                                              otherButtonTitles: nil];
        [alert show];
    } else {
        locations = objects;
        //UPDATED locationFilterResults for filtering later on
        locationsFilterResults = objects;
        [tableView reloadData];
    }
}

- (void) googlePlacesConnection:(GooglePlacesConnection *)conn didFailWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error finding place - Try again" 
                                                    message:[error localizedDescription] 
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles: nil];
    [alert show];
}

@end
