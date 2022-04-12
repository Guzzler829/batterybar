#import <Preferences/PSListController.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBPreferences.h>
#import <Cephei/HBRespringController.h>

@interface BBPRootListController : PSListController
@property(nonatomic, retain)HBPreferences* preferences;
@property(nonatomic, retain)UISwitch* enableSwitch;
- (void)setEnabled;
- (void)setEnabledState;
@end
