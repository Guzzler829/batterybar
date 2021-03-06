#import <UIKit/UIKit.h>
#import "Tweak.h"

@interface UIStatusBarForegroundView : UIView
@end

@interface UIStatusBarItemView : UIView
@end


@interface _UIStatusBar : UIVisualEffectView
@property (nonatomic, retain) UIView *batteryPercentBarView;
-(void)drawBatteryBar;
@end


CGRect barFrame;
double capacityPercentage;
int centerAllignedBarOffset;
id barThickness;
id barAlpha;
id batteryBarAllignment;

%hook _UIStatusBar
%property (nonatomic, retain) UIVisualEffectView *batteryPercentBarView;
	-(void)layoutSubviews {
		[self drawBatteryBar];
		%orig;
	}
	-(void)_updateStyleAttributes {
		[self drawBatteryBar];
		%orig;
	}
	-(double)alphaForPartWithIdentifier:(id)arg1 {
		return [barAlpha doubleValue];
	}

%new
	-(void)drawBatteryBar {
		[self.batteryPercentBarView removeFromSuperview];
		UIStatusBarForegroundView *_foregroundView = (UIStatusBarForegroundView *)self.superview;
		CGRect foregroundFrame = _foregroundView.frame;
		if([batteryBarAllignment doubleValue] == 0){
			barFrame = CGRectMake(0, 0, foregroundFrame.size.width * capacityPercentage, [barThickness doubleValue]);
		}
		if([batteryBarAllignment doubleValue] == 1){
			centerAllignedBarOffset = foregroundFrame.size.width - (foregroundFrame.size.width * capacityPercentage);
			barFrame = CGRectMake(centerAllignedBarOffset / 2, 0, (foregroundFrame.size.width * capacityPercentage), [barThickness doubleValue]);
		}
		if([batteryBarAllignment doubleValue] == 2){
			centerAllignedBarOffset = foregroundFrame.size.width - (foregroundFrame.size.width * capacityPercentage);
			barFrame = CGRectMake(centerAllignedBarOffset, 0, foregroundFrame.size.width, [barThickness doubleValue]);
		}
		self.batteryPercentBarView = [[UIVisualEffectView alloc] initWithFrame:barFrame];
		UIColor *barColor = [UIColor colorWithHue:capacityPercentage / 3
									saturation:1
									brightness:1
									alpha:([barAlpha doubleValue] / 100)];
		[self.batteryPercentBarView setBackgroundColor:barColor];
		[_foregroundView insertSubview:self.batteryPercentBarView atIndex:0];
	}
%end

%hook _UIBatteryView
	-(double)chargePercent {
		capacityPercentage = %orig;
		return %orig;
	}
%end

%ctor {

	preferences = [[HBPreferences alloc] initWithIdentifier:@"com.guzzler.batterybarprefs"];

    [preferences registerBool:&enabled default:NO forKey:@"Enabled"];
	if (!enabled) return;
	
	[preferences registerObject:&barThickness default:@"1" forKey:@"barThickness"];
	[preferences registerObject:&barAlpha default:@"100" forKey:@"barAlpha"];
	[preferences registerObject:&batteryBarAllignment default:@"0" forKey:@"batteryBarAllignment"];
}