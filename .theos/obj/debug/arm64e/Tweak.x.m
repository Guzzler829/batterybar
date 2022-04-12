#line 1 "Tweak.x"
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


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class _UIBatteryView; @class _UIStatusBar; 
static void (*_logos_orig$_ungrouped$_UIStatusBar$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBar* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$_UIStatusBar$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL _UIStatusBar* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$_UIStatusBar$_updateStyleAttributes)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBar* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$_UIStatusBar$_updateStyleAttributes(_LOGOS_SELF_TYPE_NORMAL _UIStatusBar* _LOGOS_SELF_CONST, SEL); static double (*_logos_orig$_ungrouped$_UIStatusBar$alphaForPartWithIdentifier$)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBar* _LOGOS_SELF_CONST, SEL, id); static double _logos_method$_ungrouped$_UIStatusBar$alphaForPartWithIdentifier$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBar* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$_UIStatusBar$drawBatteryBar(_LOGOS_SELF_TYPE_NORMAL _UIStatusBar* _LOGOS_SELF_CONST, SEL); static double (*_logos_orig$_ungrouped$_UIBatteryView$chargePercent)(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static double _logos_method$_ungrouped$_UIBatteryView$chargePercent(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); 

#line 24 "Tweak.x"

__attribute__((used)) static UIVisualEffectView * _logos_property$_ungrouped$_UIStatusBar$batteryPercentBarView(_UIStatusBar * __unused self, SEL __unused _cmd) { return (UIVisualEffectView *)objc_getAssociatedObject(self, (void *)_logos_property$_ungrouped$_UIStatusBar$batteryPercentBarView); };
__attribute__((used)) static void _logos_property$_ungrouped$_UIStatusBar$setBatteryPercentBarView(_UIStatusBar * __unused self, SEL __unused _cmd, UIVisualEffectView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$_ungrouped$_UIStatusBar$batteryPercentBarView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
	static void _logos_method$_ungrouped$_UIStatusBar$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL _UIStatusBar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
		[self drawBatteryBar];
		_logos_orig$_ungrouped$_UIStatusBar$layoutSubviews(self, _cmd);
	}
	static void _logos_method$_ungrouped$_UIStatusBar$_updateStyleAttributes(_LOGOS_SELF_TYPE_NORMAL _UIStatusBar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
		[self drawBatteryBar];
		_logos_orig$_ungrouped$_UIStatusBar$_updateStyleAttributes(self, _cmd);
	}
	static double _logos_method$_ungrouped$_UIStatusBar$alphaForPartWithIdentifier$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
		return [barAlpha doubleValue];
	}


	static void _logos_method$_ungrouped$_UIStatusBar$drawBatteryBar(_LOGOS_SELF_TYPE_NORMAL _UIStatusBar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
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



	static double _logos_method$_ungrouped$_UIBatteryView$chargePercent(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
		capacityPercentage = _logos_orig$_ungrouped$_UIBatteryView$chargePercent(self, _cmd);
		return _logos_orig$_ungrouped$_UIBatteryView$chargePercent(self, _cmd);
	}


static __attribute__((constructor)) void _logosLocalCtor_7e2484d5(int __unused argc, char __unused **argv, char __unused **envp) {

	preferences = [[HBPreferences alloc] initWithIdentifier:@"com.guzzler.batterybarprefs"];

    [preferences registerBool:&enabled default:NO forKey:@"Enabled"];
	if (!enabled) return;
	
	[preferences registerObject:&barThickness default:@"1" forKey:@"barThickness"];
	[preferences registerObject:&barAlpha default:@"100" forKey:@"barAlpha"];
	[preferences registerObject:&batteryBarAllignment default:@"0" forKey:@"batteryBarAllignment"];
}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$_UIStatusBar = objc_getClass("_UIStatusBar"); { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"UIVisualEffectView\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$_ungrouped$_UIStatusBar, "batteryPercentBarView", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIVisualEffectView *)); class_addMethod(_logos_class$_ungrouped$_UIStatusBar, @selector(batteryPercentBarView), (IMP)&_logos_property$_ungrouped$_UIStatusBar$batteryPercentBarView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIVisualEffectView *)); class_addMethod(_logos_class$_ungrouped$_UIStatusBar, @selector(setBatteryPercentBarView:), (IMP)&_logos_property$_ungrouped$_UIStatusBar$setBatteryPercentBarView, _typeEncoding); } { MSHookMessageEx(_logos_class$_ungrouped$_UIStatusBar, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$_UIStatusBar$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$_UIStatusBar$layoutSubviews);}{ MSHookMessageEx(_logos_class$_ungrouped$_UIStatusBar, @selector(_updateStyleAttributes), (IMP)&_logos_method$_ungrouped$_UIStatusBar$_updateStyleAttributes, (IMP*)&_logos_orig$_ungrouped$_UIStatusBar$_updateStyleAttributes);}{ MSHookMessageEx(_logos_class$_ungrouped$_UIStatusBar, @selector(alphaForPartWithIdentifier:), (IMP)&_logos_method$_ungrouped$_UIStatusBar$alphaForPartWithIdentifier$, (IMP*)&_logos_orig$_ungrouped$_UIStatusBar$alphaForPartWithIdentifier$);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$_UIStatusBar, @selector(drawBatteryBar), (IMP)&_logos_method$_ungrouped$_UIStatusBar$drawBatteryBar, _typeEncoding); }Class _logos_class$_ungrouped$_UIBatteryView = objc_getClass("_UIBatteryView"); { MSHookMessageEx(_logos_class$_ungrouped$_UIBatteryView, @selector(chargePercent), (IMP)&_logos_method$_ungrouped$_UIBatteryView$chargePercent, (IMP*)&_logos_orig$_ungrouped$_UIBatteryView$chargePercent);}} }
#line 82 "Tweak.x"
