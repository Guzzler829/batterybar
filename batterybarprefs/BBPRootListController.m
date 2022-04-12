#import <Foundation/Foundation.h>
#import "BBPRootListController.h"

@implementation BBPRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

- (void)setEnabled {
        
    if ([[[self preferences] objectForKey:@"Enabled"] isEqual:@(YES)])
        [[self preferences] setBool:NO forKey:@"Enabled"];
    else
        [[self preferences] setBool:YES forKey:@"Enabled"];

    [HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=Tweaks&path=batterybarprefs"]];

}

- (void)setEnabledState {

    if ([[[self preferences] objectForKey:@"Enabled"] isEqual:@(YES)])
        [[self enableSwitch] setOn:YES animated:YES];
    else
        [[self enableSwitch] setOn:NO animated:YES];

}

-(void)respring {
	[HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=Tweaks&path=batterybarprefs"]];
}

@end
