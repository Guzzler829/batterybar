#line 1 "Tweak.x"
#import <UIKit/UIKit.h>

CGRect barFrame;

@interface UIStatusBarForegroundView : UIView
@end

@interface UIStatusBarItemView : UIView
@end

@interface UIStatusBarBatteryItemView : UIStatusBarItemView {
	NSInteger _capacity; 
	NSInteger _state; 
	BOOL _batterySaverModeActive; 
}
@property (nonatomic, retain) UIView *batteryPercentBarView;
@end 


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

@class UIStatusBarBatteryItemView; 
static CGRect (*_logos_orig$_ungrouped$UIStatusBarBatteryItemView$frame)(_LOGOS_SELF_TYPE_NORMAL UIStatusBarBatteryItemView* _LOGOS_SELF_CONST, SEL); static CGRect _logos_method$_ungrouped$UIStatusBarBatteryItemView$frame(_LOGOS_SELF_TYPE_NORMAL UIStatusBarBatteryItemView* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$UIStatusBarBatteryItemView$updateForNewData$actions$)(_LOGOS_SELF_TYPE_NORMAL UIStatusBarBatteryItemView* _LOGOS_SELF_CONST, SEL, id, NSInteger); static BOOL _logos_method$_ungrouped$UIStatusBarBatteryItemView$updateForNewData$actions$(_LOGOS_SELF_TYPE_NORMAL UIStatusBarBatteryItemView* _LOGOS_SELF_CONST, SEL, id, NSInteger); 

#line 19 "Tweak.x"

__attribute__((used)) static UIView * _logos_property$_ungrouped$UIStatusBarBatteryItemView$batteryPercentBarView(UIStatusBarBatteryItemView * __unused self, SEL __unused _cmd) { return (UIView *)objc_getAssociatedObject(self, (void *)_logos_property$_ungrouped$UIStatusBarBatteryItemView$batteryPercentBarView); };
__attribute__((used)) static void _logos_property$_ungrouped$UIStatusBarBatteryItemView$setBatteryPercentBarView(UIStatusBarBatteryItemView * __unused self, SEL __unused _cmd, UIView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$_ungrouped$UIStatusBarBatteryItemView$batteryPercentBarView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); } 
	static CGRect _logos_method$_ungrouped$UIStatusBarBatteryItemView$frame(_LOGOS_SELF_TYPE_NORMAL UIStatusBarBatteryItemView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
		CGRect result = _logos_orig$_ungrouped$UIStatusBarBatteryItemView$frame(self, _cmd);
		UIStatusBarForegroundView *_foregroundView = (UIStatusBarForegroundView *)self.superview;
		CGRect foregroundFrame = _foregroundView.frame;
		foregroundFrame.origin.y = 20;
		_foregroundView.frame = foregroundFrame;
		return result;
		
	}
	static BOOL _logos_method$_ungrouped$UIStatusBarBatteryItemView$updateForNewData$actions$(_LOGOS_SELF_TYPE_NORMAL UIStatusBarBatteryItemView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, NSInteger arg2) {
		UIStatusBarForegroundView *_foregroundView = (UIStatusBarForegroundView *)self.superview;
		CGRect foregroundFrame = _foregroundView.frame;
		barFrame = CGRectMake(0, 0, foregroundFrame.size.width * .5, 20);
		self.batteryPercentBarView = [[UIView alloc] initWithFrame:barFrame];
		[_foregroundView insertSubview:self.batteryPercentBarView atIndex:0];
		return _logos_orig$_ungrouped$UIStatusBarBatteryItemView$updateForNewData$actions$(self, _cmd, arg1, arg2);
	}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UIStatusBarBatteryItemView = objc_getClass("UIStatusBarBatteryItemView"); { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"UIView\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$_ungrouped$UIStatusBarBatteryItemView, "batteryPercentBarView", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIView *)); class_addMethod(_logos_class$_ungrouped$UIStatusBarBatteryItemView, @selector(batteryPercentBarView), (IMP)&_logos_property$_ungrouped$UIStatusBarBatteryItemView$batteryPercentBarView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIView *)); class_addMethod(_logos_class$_ungrouped$UIStatusBarBatteryItemView, @selector(setBatteryPercentBarView:), (IMP)&_logos_property$_ungrouped$UIStatusBarBatteryItemView$setBatteryPercentBarView, _typeEncoding); } { MSHookMessageEx(_logos_class$_ungrouped$UIStatusBarBatteryItemView, @selector(frame), (IMP)&_logos_method$_ungrouped$UIStatusBarBatteryItemView$frame, (IMP*)&_logos_orig$_ungrouped$UIStatusBarBatteryItemView$frame);}{ MSHookMessageEx(_logos_class$_ungrouped$UIStatusBarBatteryItemView, @selector(updateForNewData:actions:), (IMP)&_logos_method$_ungrouped$UIStatusBarBatteryItemView$updateForNewData$actions$, (IMP*)&_logos_orig$_ungrouped$UIStatusBarBatteryItemView$updateForNewData$actions$);}} }
#line 39 "Tweak.x"
