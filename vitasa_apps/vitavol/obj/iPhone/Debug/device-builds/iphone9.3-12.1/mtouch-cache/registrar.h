#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wtypedef-redefinition"
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
#define DEBUG 1
#include <stdarg.h>
#include <objc/objc.h>
#include <objc/runtime.h>
#include <objc/message.h>
#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MessageUI/MessageUI.h>
#import <GLKit/GLKit.h>
#import <EventKit/EventKit.h>
#import <CoreSpotlight/CoreSpotlight.h>
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/QuartzCore.h>
#import <WebKit/WebKit.h>
#import <CoreGraphics/CoreGraphics.h>

@class UNUserNotificationCenterDelegate;
@class UIPickerViewModel;
@class MKMapViewDelegate;
@class UIScrollViewDelegate;
@class UITableViewSource;
@class UIApplicationDelegate;
@class UIWebViewDelegate;
@class UICollectionViewDataSource;
@class UICollectionViewDelegateFlowLayout;
@class MFMailComposeViewControllerDelegate;
@class MessageUI_Mono_MFMailComposeViewControllerDelegate;
@class GLKViewDelegate;
@class WKNavigationDelegate;
@class UIKit_UIControlEventProxy;
@class UIActionSheetDelegate;
@class UISplitViewControllerDelegate;
@class Foundation_InternalNSNotificationHandler;
@class Foundation_NSDispatcher;
@class __MonoMac_NSActionDispatcher;
@class __MonoMac_NSSynchronizationContextDispatcher;
@class __Xamarin_NSTimerActionDispatcher;
@class Foundation_NSAsyncDispatcher;
@class __MonoMac_NSAsyncActionDispatcher;
@class __MonoMac_NSAsyncSynchronizationContextDispatcher;
@class zsquared_UserNotificationCenterDelegate;
@class zsquared_C_PickerModel;
@class VC_About;
@class VC_ClientBeforeYouGo;
@class VC_AdminSiteDetails;
@class VC_AdminSiteCalendar;
@class VC_Testing;
@class VC_SiteCalOnDate;
@class VC_AdminSiteContactAndNotes;
@class zsquared_C_ItemPicker_1_C_PickerDataModel_1;
@class zsquared_C_UserPicker_C_PickerDataModel;
@class zsquared_C_MapDelegateX;
@class zsquared_C_SitesMapDelegate;
@class zsquared_C_TableSource_1_CustomCell;
@class zsquared_C_TableSource_1;
@class AppDelegate;
@class ViewController;
@class vitavol_C_WebViewDelegateAbout;
@class vitavol_C_CVHelper_C_CVSource;
@class vitavol_C_CVHelper_C_GridCell;
@class vitavol_C_CVHelper;
@class VC_SitesMap;
@class VC_SitesFilter;
@class VC_SiteDetails;
@class VC_SiteCalendar;
@class VC_Login;
@class VC_VolHome;
@class VC_VolHoursWorked;
@class VC_EditHours;
@class VC_Suggestion;
@class VC_SCSites;
@class VC_SCSite;
@class VC_SCVolHours;
@class VC_SCSiteDetails;
@class VC_SCAddVolHours;
@class VC_AdminMenu;
@class VC_AdminUsers;
@class VC_AdminUser;
@class VC_AdminUserSites;
@class VC_AdminSites;
@class VC_AdminSite;
@class VC_AdminSiteLocation;
@class VC_AdminSiteCalDetails;
@class VC_AdminSiteCoord;
@class VC_AdminSuggestions;
@class VC_AdminNotifications;
@class VC_AdminSuggestion;
@class VC_AdminNotification;
@class VC_AdminReports;
@class VC_AdminReport;
@class VC_AdminSiteCalReset;
@class VC_AdminSiteCalResetDOW;
@class VC_VolEditSettings;
@class VC_VolMobileCalendar;
@class VC_VolMobileCalOnDate;
@class VC_AdminMobile;
@class VC_AdminMobileDate;
@class VC_AdminSiteCalResetAction;
@class VC_ExportImport;
@class VC_SCVolList;
@class OpenTK_Platform_iPhoneOS_CADisplayLinkTimeSource;
@class OpenTK_Platform_iPhoneOS_iPhoneOSGameView;
@class MapKit_MKMapView__MKMapViewDelegate;
@class GLKit_GLKView__GLKViewDelegate;
@class UIKit_UIBarButtonItem_Callback;
@class UIKit_UIView_UIViewAppearance;
@class UIKit_UIControl_UIControlAppearance;
@class UIKit_UIButton_UIButtonAppearance;
@class __UIGestureRecognizerToken;
@class __UIGestureRecognizerParameterlessToken;
@class UIKit_UIGestureRecognizer__UIGestureRecognizerDelegate;
@class __UILongPressGestureRecognizer;
@class __UITapGestureRecognizer;
@class __UIPanGestureRecognizer;
@class __UIPinchGestureRecognizer;
@class UIKit_UINavigationBar_UINavigationBarAppearance;
@class UIKit_UISearchBar__UISearchBarDelegate;
@class UIKit_UITextField__UITextFieldDelegate;
@class UIKit_UIScrollView__UIScrollViewDelegate;
@class UIKit_UITextView__UITextViewDelegate;
@class UIKit_UISplitViewController__UISplitViewControllerDelegate;
@class UIKit_UISwitch_UISwitchAppearance;
@class UIKit_UITabBarController__UITabBarControllerDelegate;
@class UIKit_UIWebView__UIWebViewDelegate;
@class __NSObject_Disposer;
@class __XamarinObjectObserver;
@class Xamarin_Forms_Platform_iOS_iOS7ButtonContainer;
@class Xamarin_Forms_Platform_iOS_GlobalCloseContextGestureRecognizer;
@class Xamarin_Forms_Platform_iOS_FormsApplicationDelegate;
@class Xamarin_Forms_Platform_iOS_ModalWrapper;
@class Xamarin_Forms_Platform_iOS_PlatformRenderer;
@class Xamarin_Forms_Platform_iOS_VisualElementRenderer_1;
@class Xamarin_Forms_Platform_iOS_ViewRenderer_2;
@class Xamarin_Forms_Platform_iOS_ViewRenderer;
@class Xamarin_Forms_Platform_iOS_CellTableViewCell;
@class Xamarin_Forms_Platform_iOS_ActivityIndicatorRenderer;
@class Xamarin_Forms_Platform_iOS_BoxRenderer;
@class Xamarin_Forms_Platform_iOS_NoCaretField;
@class Xamarin_Forms_Platform_iOS_EntryRenderer;
@class Xamarin_Forms_Platform_iOS_FrameRenderer;
@class Xamarin_Forms_Platform_iOS_LabelRenderer;
@class Xamarin_Forms_Platform_iOS_HeaderWrapperView;
@class Xamarin_Forms_Platform_iOS_FormsRefreshControl;
@class Xamarin_Forms_Platform_iOS_ReadOnlyField;
@class Xamarin_Forms_Platform_iOS_ProgressBarRenderer;
@class Xamarin_Forms_Platform_iOS_ScrollViewRenderer;
@class Xamarin_Forms_Platform_iOS_SearchBarRenderer;
@class Xamarin_Forms_Platform_iOS_StepperRenderer;
@class Xamarin_Forms_Platform_iOS_SwitchRenderer;
@class Xamarin_Forms_Platform_iOS_TableViewModelRenderer;
@class Xamarin_Forms_Platform_iOS_UnEvenTableViewModelRenderer;
@class Xamarin_Forms_Platform_iOS_TableViewRenderer;
@class Xamarin_Forms_Platform_iOS_ChildViewController;
@class Xamarin_Forms_Platform_iOS_EventedViewController;
@class Xamarin_Forms_Platform_iOS_NativeViewWrapperRenderer;
@class Xamarin_Forms_Platform_iOS_NativeViewPropertyListener;
@class Xamarin_Forms_Platform_iOS_ContextActionsCell_SelectGestureRecognizer;
@class Xamarin_Forms_Platform_iOS_ContextActionsCell_MoreActionSheetController;
@class Xamarin_Forms_Platform_iOS_ContextActionsCell_MoreActionSheetDelegate;
@class Xamarin_Forms_Platform_iOS_ContextActionsCell;
@class Xamarin_Forms_Platform_iOS_ContextScrollViewDelegate;
@class Xamarin_Forms_Platform_iOS_Platform_DefaultRenderer;
@class Xamarin_Forms_Platform_iOS_EntryCellRenderer_EntryCellTableViewCell;
@class Xamarin_Forms_Platform_iOS_ViewCellRenderer_ViewTableCell;
@class Xamarin_Forms_Platform_iOS_ButtonRenderer;
@class Xamarin_Forms_Platform_iOS_CarouselPageRenderer_PageContainer;
@class Xamarin_Forms_Platform_iOS_CarouselPageRenderer;
@class Xamarin_Forms_Platform_iOS_DatePickerRenderer;
@class Xamarin_Forms_Platform_iOS_EditorRenderer_FormsUITextView;
@class Xamarin_Forms_Platform_iOS_EditorRenderer;
@class Xamarin_Forms_Platform_iOS_ImageRenderer;
@class Xamarin_Forms_Platform_iOS_ListViewRenderer_ListViewDataSource;
@class Xamarin_Forms_Platform_iOS_ListViewRenderer_UnevenListViewDataSource;
@class Xamarin_Forms_Platform_iOS_ListViewRenderer;
@class Xamarin_Forms_Platform_iOS_FormsUITableViewController;
@class Xamarin_Forms_Platform_iOS_NavigationMenuRenderer_NavigationCell;
@class Xamarin_Forms_Platform_iOS_NavigationMenuRenderer;
@class Xamarin_Forms_Platform_iOS_NavigationRenderer_FormsNavigationBar;
@class Xamarin_Forms_Platform_iOS_NavigationRenderer_Container;
@class Xamarin_Forms_Platform_iOS_NavigationRenderer;
@class Xamarin_Forms_Platform_iOS_OpenGLViewRenderer_Delegate;
@class Xamarin_Forms_Platform_iOS_OpenGLViewRenderer;
@class Xamarin_Forms_Platform_iOS_PageRenderer;
@class Xamarin_Forms_Platform_iOS_PhoneMasterDetailRenderer_ChildViewController;
@class Xamarin_Forms_Platform_iOS_PhoneMasterDetailRenderer;
@class Xamarin_Forms_Platform_iOS_PickerRenderer_PickerSource;
@class Xamarin_Forms_Platform_iOS_PickerRenderer;
@class Xamarin_Forms_Platform_iOS_SliderRenderer;
@class Xamarin_Forms_Platform_iOS_TabbedRenderer;
@class Xamarin_Forms_Platform_iOS_TabletMasterDetailRenderer_InnerDelegate;
@class Xamarin_Forms_Platform_iOS_TabletMasterDetailRenderer;
@class Xamarin_Forms_Platform_iOS_TimePickerRenderer;
@class Xamarin_Forms_Platform_iOS_WebViewRenderer_CustomWebViewDelegate;
@class Xamarin_Forms_Platform_iOS_WebViewRenderer;
@class Xamarin_Forms_Platform_iOS_WkWebViewRenderer_CustomWebViewDelegate;
@class Xamarin_Forms_Platform_iOS_WkWebViewRenderer;
@class Xamarin_Forms_Platform_iOS_ImageButtonRenderer;
@class Xamarin_Forms_Platform_iOS_ToolbarItemExtensions_PrimaryToolbarItem;
@class Xamarin_Forms_Platform_iOS_ToolbarItemExtensions_SecondaryToolbarItem_SecondaryToolbarItemContent;
@class Xamarin_Forms_Platform_iOS_ToolbarItemExtensions_SecondaryToolbarItem;
@class Xamarin_Forms_Platform_iOS_NavigationMenuRenderer_DataSource;
@class Xamarin_Forms_Platform_iOS_NavigationRenderer_SecondaryToolbar;
@class Xamarin_Forms_Platform_iOS_NavigationRenderer_ParentingViewController;
@class Xamarin_Forms_Maps_iOS_MapRenderer;

@interface UNUserNotificationCenterDelegate : NSObject<UNUserNotificationCenterDelegate> {
}
	-(id) init;
@end

@interface UIPickerViewModel : NSObject<UIPickerViewDataSource, UIPickerViewDelegate> {
}
	-(id) init;
@end

@interface MKMapViewDelegate : NSObject<MKMapViewDelegate> {
}
	-(id) init;
@end

@interface UIScrollViewDelegate : NSObject<UIScrollViewDelegate> {
}
	-(id) init;
@end

@interface UITableViewSource : NSObject<UIScrollViewDelegate> {
}
	-(id) init;
@end

@interface UIApplicationDelegate : NSObject<UIApplicationDelegate> {
}
	-(id) init;
@end

@interface UIWebViewDelegate : NSObject<UIWebViewDelegate> {
}
	-(id) init;
@end

@interface UICollectionViewDataSource : NSObject<UICollectionViewDataSource> {
}
	-(id) init;
@end

@interface UICollectionViewDelegateFlowLayout : NSObject<UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate> {
}
	-(id) init;
@end

@interface MFMailComposeViewControllerDelegate : NSObject<UINavigationControllerDelegate, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate, UINavigationControllerDelegate> {
}
	-(id) init;
@end

@interface GLKViewDelegate : NSObject<GLKViewDelegate> {
}
	-(id) init;
@end

@interface WKNavigationDelegate : NSObject<WKNavigationDelegate> {
}
	-(id) init;
@end

@interface UIActionSheetDelegate : NSObject<UIActionSheetDelegate> {
}
	-(id) init;
@end

@interface UISplitViewControllerDelegate : NSObject<UISplitViewControllerDelegate> {
}
	-(id) init;
@end

@interface zsquared_UserNotificationCenterDelegate : NSObject<UNUserNotificationCenterDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) userNotificationCenter:(UNUserNotificationCenter *)p0 willPresentNotification:(UNNotification *)p1 withCompletionHandler:(id)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface zsquared_C_PickerModel : NSObject<UIPickerViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) pickerView:(UIPickerView *)p0 numberOfRowsInComponent:(NSInteger)p1;
	-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)p0;
	-(NSString *) pickerView:(UIPickerView *)p0 titleForRow:(NSInteger)p1 forComponent:(NSInteger)p2;
	-(void) pickerView:(UIPickerView *)p0 didSelectRow:(NSInteger)p1 inComponent:(NSInteger)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_About : UIViewController {
}
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UILabel * B_BytesReceived;
	@property (nonatomic, assign) UILabel * L_Version;
	@property (nonatomic, assign) UIWebView * WV_About;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UILabel *) B_BytesReceived;
	-(void) setB_BytesReceived:(UILabel *)p0;
	-(UILabel *) L_Version;
	-(void) setL_Version:(UILabel *)p0;
	-(UIWebView *) WV_About;
	-(void) setWV_About:(UIWebView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_ClientBeforeYouGo : UIViewController {
}
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIWebView * WV_BeforeYouGo;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIWebView *) WV_BeforeYouGo;
	-(void) setWV_BeforeYouGo:(UIWebView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_AdminSiteDetails : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Save;
	@property (nonatomic, assign) UILabel * L_SiteName;
	@property (nonatomic, assign) UISwitch * SW_DropOff;
	@property (nonatomic, assign) UISwitch * SW_Express;
	@property (nonatomic, assign) UISwitch * SW_InPerson;
	@property (nonatomic, assign) UISwitch * SW_MFT;
	@property (nonatomic, assign) UISwitch * SW_Mobile;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Save;
	-(void) setB_Save:(UIButton *)p0;
	-(UILabel *) L_SiteName;
	-(void) setL_SiteName:(UILabel *)p0;
	-(UISwitch *) SW_DropOff;
	-(void) setSW_DropOff:(UISwitch *)p0;
	-(UISwitch *) SW_Express;
	-(void) setSW_Express:(UISwitch *)p0;
	-(UISwitch *) SW_InPerson;
	-(void) setSW_InPerson:(UISwitch *)p0;
	-(UISwitch *) SW_MFT;
	-(void) setSW_MFT:(UISwitch *)p0;
	-(UISwitch *) SW_Mobile;
	-(void) setSW_Mobile:(UISwitch *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_AdminSiteCalendar : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_MonthNext;
	@property (nonatomic, assign) UIButton * B_MonthPrevious;
	@property (nonatomic, assign) UIButton * B_ResetCalendar;
	@property (nonatomic, assign) UIButton * B_Save;
	@property (nonatomic, assign) UICollectionView * CV_Grid;
	@property (nonatomic, assign) UILabel * L_MonthYear;
	@property (nonatomic, assign) UILabel * L_SiteName;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_MonthNext;
	-(void) setB_MonthNext:(UIButton *)p0;
	-(UIButton *) B_MonthPrevious;
	-(void) setB_MonthPrevious:(UIButton *)p0;
	-(UIButton *) B_ResetCalendar;
	-(void) setB_ResetCalendar:(UIButton *)p0;
	-(UIButton *) B_Save;
	-(void) setB_Save:(UIButton *)p0;
	-(UICollectionView *) CV_Grid;
	-(void) setCV_Grid:(UICollectionView *)p0;
	-(UILabel *) L_MonthYear;
	-(void) setL_MonthYear:(UILabel *)p0;
	-(UILabel *) L_SiteName;
	-(void) setL_SiteName:(UILabel *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_Testing : UIViewController {
}
	@property (nonatomic, assign) UIButton * B_Back;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_SiteCalOnDate : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Done;
	@property (nonatomic, assign) UILabel * L_Date;
	@property (nonatomic, assign) UILabel * L_SiteName;
	@property (nonatomic, assign) UILabel * L_Title;
	@property (nonatomic, assign) UISwitch * SW_SiteIsOpen;
	@property (nonatomic, assign) UITextField * TB_CloseTime;
	@property (nonatomic, assign) UITextField * TB_OpenTime;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Done;
	-(void) setB_Done:(UIButton *)p0;
	-(UILabel *) L_Date;
	-(void) setL_Date:(UILabel *)p0;
	-(UILabel *) L_SiteName;
	-(void) setL_SiteName:(UILabel *)p0;
	-(UILabel *) L_Title;
	-(void) setL_Title:(UILabel *)p0;
	-(UISwitch *) SW_SiteIsOpen;
	-(void) setSW_SiteIsOpen:(UISwitch *)p0;
	-(UITextField *) TB_CloseTime;
	-(void) setTB_CloseTime:(UITextField *)p0;
	-(UITextField *) TB_OpenTime;
	-(void) setTB_OpenTime:(UITextField *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_AdminSiteContactAndNotes : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Save;
	@property (nonatomic, assign) UILabel * L_SiteName;
	@property (nonatomic, assign) UILabel * L_Title;
	@property (nonatomic, assign) UITextField * TB_ContactName;
	@property (nonatomic, assign) UITextField * TB_ContactPhone;
	@property (nonatomic, assign) UITextView * TxV_Notes;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Save;
	-(void) setB_Save:(UIButton *)p0;
	-(UILabel *) L_SiteName;
	-(void) setL_SiteName:(UILabel *)p0;
	-(UILabel *) L_Title;
	-(void) setL_Title:(UILabel *)p0;
	-(UITextField *) TB_ContactName;
	-(void) setTB_ContactName:(UITextField *)p0;
	-(UITextField *) TB_ContactPhone;
	-(void) setTB_ContactPhone:(UITextField *)p0;
	-(UITextView *) TxV_Notes;
	-(void) setTxV_Notes:(UITextView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface zsquared_C_ItemPicker_1_C_PickerDataModel_1 : NSObject<UIPickerViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) pickerView:(UIPickerView *)p0 numberOfRowsInComponent:(NSInteger)p1;
	-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)p0;
	-(NSString *) pickerView:(UIPickerView *)p0 titleForRow:(NSInteger)p1 forComponent:(NSInteger)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface zsquared_C_UserPicker_C_PickerDataModel : NSObject<UIPickerViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) pickerView:(UIPickerView *)p0 numberOfRowsInComponent:(NSInteger)p1;
	-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)p0;
	-(NSString *) pickerView:(UIPickerView *)p0 titleForRow:(NSInteger)p1 forComponent:(NSInteger)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface zsquared_C_MapDelegateX : NSObject<MKMapViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(MKAnnotationView *) mapView:(MKMapView *)p0 viewForAnnotation:(id)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface zsquared_C_SitesMapDelegate : NSObject<MKMapViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(MKAnnotationView *) mapView:(MKMapView *)p0 viewForAnnotation:(id)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface zsquared_C_TableSource_1_CustomCell : UITableViewCell {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) setSelected:(BOOL)p0 animated:(BOOL)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface zsquared_C_TableSource_1 : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) tableView:(UITableView *)p0 canEditRowAtIndexPath:(NSIndexPath *)p1;
	-(void) tableView:(UITableView *)p0 commitEditingStyle:(NSInteger)p1 forRowAtIndexPath:(NSIndexPath *)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface AppDelegate : NSObject<UIApplicationDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIWindow *) window;
	-(void) setWindow:(UIWindow *)p0;
	-(BOOL) application:(UIApplication *)p0 didFinishLaunchingWithOptions:(NSDictionary *)p1;
	-(void) application:(UIApplication *)p0 didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)p1;
	-(void) application:(UIApplication *)p0 didFailToRegisterForRemoteNotificationsWithError:(NSError *)p1;
	-(void) application:(UIApplication *)p0 didReceiveRemoteNotification:(NSDictionary *)p1 fetchCompletionHandler:(id)p2;
	-(void) applicationWillResignActive:(UIApplication *)p0;
	-(void) applicationDidEnterBackground:(UIApplication *)p0;
	-(void) applicationWillEnterForeground:(UIApplication *)p0;
	-(void) applicationDidBecomeActive:(UIApplication *)p0;
	-(void) applicationWillTerminate:(UIApplication *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface ViewController : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_About;
	@property (nonatomic, assign) UIButton * B_BeforeYouGo;
	@property (nonatomic, assign) UIButton * B_FindASiteNearYou;
	@property (nonatomic, assign) UIButton * B_StaffLogin;
	@property (nonatomic, assign) UIImageView * I_BackgroundImage;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_About;
	-(void) setB_About:(UIButton *)p0;
	-(UIButton *) B_BeforeYouGo;
	-(void) setB_BeforeYouGo:(UIButton *)p0;
	-(UIButton *) B_FindASiteNearYou;
	-(void) setB_FindASiteNearYou:(UIButton *)p0;
	-(UIButton *) B_StaffLogin;
	-(void) setB_StaffLogin:(UIButton *)p0;
	-(UIImageView *) I_BackgroundImage;
	-(void) setI_BackgroundImage:(UIImageView *)p0;
	-(void) didReceiveMemoryWarning;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitavol_C_WebViewDelegateAbout : NSObject<UIWebViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(BOOL) webView:(UIWebView *)p0 shouldStartLoadWithRequest:(NSURLRequest *)p1 navigationType:(NSInteger)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitavol_C_CVHelper_C_CVSource : NSObject<UICollectionViewDataSource> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) collectionView:(UICollectionView *)p0 numberOfItemsInSection:(NSInteger)p1;
	-(UICollectionViewCell *) collectionView:(UICollectionView *)p0 cellForItemAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitavol_C_CVHelper_C_GridCell : UICollectionViewCell {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) initWithFrame:(CGRect)p0;
@end

@interface vitavol_C_CVHelper : NSObject<UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(CGSize) collectionView:(UICollectionView *)p0 layout:(UICollectionViewLayout *)p1 sizeForItemAtIndexPath:(NSIndexPath *)p2;
	-(BOOL) collectionView:(UICollectionView *)p0 shouldSelectItemAtIndexPath:(NSIndexPath *)p1;
	-(void) collectionView:(UICollectionView *)p0 didUnhighlightItemAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_SitesMap : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Filter;
	@property (nonatomic, assign) UIButton * B_Services;
	@property (nonatomic, assign) MKMapView * Map_SitesMap;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Filter;
	-(void) setB_Filter:(UIButton *)p0;
	-(UIButton *) B_Services;
	-(void) setB_Services:(UIButton *)p0;
	-(MKMapView *) Map_SitesMap;
	-(void) setMap_SitesMap:(MKMapView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_SitesFilter : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_UseFilter;
	@property (nonatomic, assign) UILabel * L_Mobile;
	@property (nonatomic, assign) UISwitch * SW_DropOff;
	@property (nonatomic, assign) UISwitch * SW_Express;
	@property (nonatomic, assign) UISwitch * SW_InPersonPrep;
	@property (nonatomic, assign) UISwitch * SW_MFT;
	@property (nonatomic, assign) UISwitch * SW_Mobile;
	@property (nonatomic, assign) UITextField * TB_Dates;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_UseFilter;
	-(void) setB_UseFilter:(UIButton *)p0;
	-(UILabel *) L_Mobile;
	-(void) setL_Mobile:(UILabel *)p0;
	-(UISwitch *) SW_DropOff;
	-(void) setSW_DropOff:(UISwitch *)p0;
	-(UISwitch *) SW_Express;
	-(void) setSW_Express:(UISwitch *)p0;
	-(UISwitch *) SW_InPersonPrep;
	-(void) setSW_InPersonPrep:(UISwitch *)p0;
	-(UISwitch *) SW_MFT;
	-(void) setSW_MFT:(UISwitch *)p0;
	-(UISwitch *) SW_Mobile;
	-(void) setSW_Mobile:(UISwitch *)p0;
	-(UITextField *) TB_Dates;
	-(void) setTB_Dates:(UITextField *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_SiteDetails : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_GetDirections;
	@property (nonatomic, assign) UIButton * B_ImDoneHere;
	@property (nonatomic, assign) UIButton * B_ViewSiteCalendar;
	@property (nonatomic, assign) UILabel * L_Address;
	@property (nonatomic, assign) UILabel * L_CityStateZip;
	@property (nonatomic, assign) UILabel * L_DropOff;
	@property (nonatomic, assign) UILabel * L_Express;
	@property (nonatomic, assign) UILabel * L_HoursToday;
	@property (nonatomic, assign) UILabel * L_InPerson;
	@property (nonatomic, assign) UILabel * L_MFT;
	@property (nonatomic, assign) UILabel * L_MobileSite;
	@property (nonatomic, assign) UILabel * L_SiteName;
	@property (nonatomic, assign) UISwitch * SW_PreferredSite;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_GetDirections;
	-(void) setB_GetDirections:(UIButton *)p0;
	-(UIButton *) B_ImDoneHere;
	-(void) setB_ImDoneHere:(UIButton *)p0;
	-(UIButton *) B_ViewSiteCalendar;
	-(void) setB_ViewSiteCalendar:(UIButton *)p0;
	-(UILabel *) L_Address;
	-(void) setL_Address:(UILabel *)p0;
	-(UILabel *) L_CityStateZip;
	-(void) setL_CityStateZip:(UILabel *)p0;
	-(UILabel *) L_DropOff;
	-(void) setL_DropOff:(UILabel *)p0;
	-(UILabel *) L_Express;
	-(void) setL_Express:(UILabel *)p0;
	-(UILabel *) L_HoursToday;
	-(void) setL_HoursToday:(UILabel *)p0;
	-(UILabel *) L_InPerson;
	-(void) setL_InPerson:(UILabel *)p0;
	-(UILabel *) L_MFT;
	-(void) setL_MFT:(UILabel *)p0;
	-(UILabel *) L_MobileSite;
	-(void) setL_MobileSite:(UILabel *)p0;
	-(UILabel *) L_SiteName;
	-(void) setL_SiteName:(UILabel *)p0;
	-(UISwitch *) SW_PreferredSite;
	-(void) setSW_PreferredSite:(UISwitch *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_SiteCalendar : UIViewController {
}
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_ImDoneHere;
	@property (nonatomic, assign) UIButton * B_MonthNext;
	@property (nonatomic, assign) UIButton * B_MonthPrev;
	@property (nonatomic, assign) UICollectionView * CV_Grid;
	@property (nonatomic, assign) UILabel * L_MonthYear;
	@property (nonatomic, assign) UILabel * L_SiteName;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_ImDoneHere;
	-(void) setB_ImDoneHere:(UIButton *)p0;
	-(UIButton *) B_MonthNext;
	-(void) setB_MonthNext:(UIButton *)p0;
	-(UIButton *) B_MonthPrev;
	-(void) setB_MonthPrev:(UIButton *)p0;
	-(UICollectionView *) CV_Grid;
	-(void) setCV_Grid:(UICollectionView *)p0;
	-(UILabel *) L_MonthYear;
	-(void) setL_MonthYear:(UILabel *)p0;
	-(UILabel *) L_SiteName;
	-(void) setL_SiteName:(UILabel *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_Login : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Submit;
	@property (nonatomic, assign) UITextField * TB_Email;
	@property (nonatomic, assign) UITextField * TB_Password;
	@property (nonatomic, assign) UITextView * TxV_Note;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Submit;
	-(void) setB_Submit:(UIButton *)p0;
	-(UITextField *) TB_Email;
	-(void) setTB_Email:(UITextField *)p0;
	-(UITextField *) TB_Password;
	-(void) setTB_Password:(UITextField *)p0;
	-(UITextView *) TxV_Note;
	-(void) setTxV_Note:(UITextView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_VolHome : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_EditSettings;
	@property (nonatomic, assign) UIButton * B_Logout;
	@property (nonatomic, assign) UIButton * B_Mobile;
	@property (nonatomic, assign) UIButton * B_PostSuggestion;
	@property (nonatomic, assign) UIButton * B_ViewOrAddWorkItems;
	@property (nonatomic, assign) UILabel * L_Mobile;
	@property (nonatomic, assign) UISwitch * SW_Mobile;
	@property (nonatomic, assign) UITextField * TB_Hours;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_EditSettings;
	-(void) setB_EditSettings:(UIButton *)p0;
	-(UIButton *) B_Logout;
	-(void) setB_Logout:(UIButton *)p0;
	-(UIButton *) B_Mobile;
	-(void) setB_Mobile:(UIButton *)p0;
	-(UIButton *) B_PostSuggestion;
	-(void) setB_PostSuggestion:(UIButton *)p0;
	-(UIButton *) B_ViewOrAddWorkItems;
	-(void) setB_ViewOrAddWorkItems:(UIButton *)p0;
	-(UILabel *) L_Mobile;
	-(void) setL_Mobile:(UILabel *)p0;
	-(UISwitch *) SW_Mobile;
	-(void) setSW_Mobile:(UISwitch *)p0;
	-(UITextField *) TB_Hours;
	-(void) setTB_Hours:(UITextField *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_VolHoursWorked : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_AddHours;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UITextField * TB_Hours;
	@property (nonatomic, assign) UITableView * TV_HoursWorked;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_AddHours;
	-(void) setB_AddHours:(UIButton *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UITextField *) TB_Hours;
	-(void) setTB_Hours:(UITextField *)p0;
	-(UITableView *) TV_HoursWorked;
	-(void) setTV_HoursWorked:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_EditHours : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Cancel;
	@property (nonatomic, assign) UIButton * B_Save;
	@property (nonatomic, assign) UITextField * TB_Date;
	@property (nonatomic, assign) UITextField * TB_Hours;
	@property (nonatomic, assign) UITextField * TB_Site;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Cancel;
	-(void) setB_Cancel:(UIButton *)p0;
	-(UIButton *) B_Save;
	-(void) setB_Save:(UIButton *)p0;
	-(UITextField *) TB_Date;
	-(void) setTB_Date:(UITextField *)p0;
	-(UITextField *) TB_Hours;
	-(void) setTB_Hours:(UITextField *)p0;
	-(UITextField *) TB_Site;
	-(void) setTB_Site:(UITextField *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_Suggestion : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Cancel;
	@property (nonatomic, assign) UIButton * B_Save;
	@property (nonatomic, assign) UILabel * L_Title;
	@property (nonatomic, assign) UITextField * TB_Subject;
	@property (nonatomic, assign) UITextView * TxV_Message;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Cancel;
	-(void) setB_Cancel:(UIButton *)p0;
	-(UIButton *) B_Save;
	-(void) setB_Save:(UIButton *)p0;
	-(UILabel *) L_Title;
	-(void) setL_Title:(UILabel *)p0;
	-(UITextField *) TB_Subject;
	-(void) setTB_Subject:(UITextField *)p0;
	-(UITextView *) TxV_Message;
	-(void) setTxV_Message:(UITextView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_SCSites : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Logout;
	@property (nonatomic, assign) UIButton * B_Settings;
	@property (nonatomic, assign) UIButton * B_VolList;
	@property (nonatomic, assign) UITableView * TV_Sites;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Logout;
	-(void) setB_Logout:(UIButton *)p0;
	-(UIButton *) B_Settings;
	-(void) setB_Settings:(UIButton *)p0;
	-(UIButton *) B_VolList;
	-(void) setB_VolList:(UIButton *)p0;
	-(UITableView *) TV_Sites;
	-(void) setTV_Sites:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_SCSite : UIViewController {
}
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_MonthNext;
	@property (nonatomic, assign) UIButton * B_MonthPrevious;
	@property (nonatomic, assign) UICollectionView * CV_Grid;
	@property (nonatomic, assign) UILabel * L_MonthYear;
	@property (nonatomic, assign) UILabel * L_SiteName;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_MonthNext;
	-(void) setB_MonthNext:(UIButton *)p0;
	-(UIButton *) B_MonthPrevious;
	-(void) setB_MonthPrevious:(UIButton *)p0;
	-(UICollectionView *) CV_Grid;
	-(void) setCV_Grid:(UICollectionView *)p0;
	-(UILabel *) L_MonthYear;
	-(void) setL_MonthYear:(UILabel *)p0;
	-(UILabel *) L_SiteName;
	-(void) setL_SiteName:(UILabel *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_SCVolHours : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_AddVolHours;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_GoToSiteCalendar;
	@property (nonatomic, assign) UIButton * B_MarkAsApproved;
	@property (nonatomic, assign) UILabel * L_SiteName;
	@property (nonatomic, assign) UITableView * TV_WorkLogItems;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_AddVolHours;
	-(void) setB_AddVolHours:(UIButton *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_GoToSiteCalendar;
	-(void) setB_GoToSiteCalendar:(UIButton *)p0;
	-(UIButton *) B_MarkAsApproved;
	-(void) setB_MarkAsApproved:(UIButton *)p0;
	-(UILabel *) L_SiteName;
	-(void) setL_SiteName:(UILabel *)p0;
	-(UITableView *) TV_WorkLogItems;
	-(void) setTV_WorkLogItems:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_SCSiteDetails : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Cancel;
	@property (nonatomic, assign) UIButton * B_Save;
	@property (nonatomic, assign) UILabel * L_Date;
	@property (nonatomic, assign) UILabel * L_SiteName;
	@property (nonatomic, assign) UILabel * L_Title;
	@property (nonatomic, assign) UISwitch * SW_SiteIsOpen;
	@property (nonatomic, assign) UITextField * TB_CloseTime;
	@property (nonatomic, assign) UITextField * TB_OpenTime;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Cancel;
	-(void) setB_Cancel:(UIButton *)p0;
	-(UIButton *) B_Save;
	-(void) setB_Save:(UIButton *)p0;
	-(UILabel *) L_Date;
	-(void) setL_Date:(UILabel *)p0;
	-(UILabel *) L_SiteName;
	-(void) setL_SiteName:(UILabel *)p0;
	-(UILabel *) L_Title;
	-(void) setL_Title:(UILabel *)p0;
	-(UISwitch *) SW_SiteIsOpen;
	-(void) setSW_SiteIsOpen:(UISwitch *)p0;
	-(UITextField *) TB_CloseTime;
	-(void) setTB_CloseTime:(UITextField *)p0;
	-(UITextField *) TB_OpenTime;
	-(void) setTB_OpenTime:(UITextField *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_SCAddVolHours : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Cancel;
	@property (nonatomic, assign) UIButton * B_Save;
	@property (nonatomic, assign) UILabel * L_SiteName;
	@property (nonatomic, assign) UILabel * L_Title;
	@property (nonatomic, assign) UITextField * TB_Date;
	@property (nonatomic, assign) UITextField * TB_Hours;
	@property (nonatomic, assign) UITextField * TB_Volunteer;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Cancel;
	-(void) setB_Cancel:(UIButton *)p0;
	-(UIButton *) B_Save;
	-(void) setB_Save:(UIButton *)p0;
	-(UILabel *) L_SiteName;
	-(void) setL_SiteName:(UILabel *)p0;
	-(UILabel *) L_Title;
	-(void) setL_Title:(UILabel *)p0;
	-(UITextField *) TB_Date;
	-(void) setTB_Date:(UITextField *)p0;
	-(UITextField *) TB_Hours;
	-(void) setTB_Hours:(UITextField *)p0;
	-(UITextField *) TB_Volunteer;
	-(void) setTB_Volunteer:(UITextField *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_AdminMenu : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Logout;
	@property (nonatomic, assign) UITableView * TV_Menu;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Logout;
	-(void) setB_Logout:(UIButton *)p0;
	-(UITableView *) TV_Menu;
	-(void) setTV_Menu:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_AdminUsers : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_NewUser;
	@property (nonatomic, assign) UITextField * TB_FilterBy;
	@property (nonatomic, assign) UITableView * TV_Users;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_NewUser;
	-(void) setB_NewUser:(UIButton *)p0;
	-(UITextField *) TB_FilterBy;
	-(void) setTB_FilterBy:(UITextField *)p0;
	-(UITableView *) TV_Users;
	-(void) setTV_Users:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_AdminUser : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_DeleteUser;
	@property (nonatomic, assign) UIButton * B_Save;
	@property (nonatomic, assign) UIButton * B_SitesCoordinated;
	@property (nonatomic, assign) UILabel * L_Title;
	@property (nonatomic, assign) UISwitch * SW_Mobile;
	@property (nonatomic, assign) UITextField * TB_Cert;
	@property (nonatomic, assign) UITextField * TB_Email;
	@property (nonatomic, assign) UITextField * TB_Name;
	@property (nonatomic, assign) UITextField * TB_Password;
	@property (nonatomic, assign) UITextField * TB_PasswordConfirm;
	@property (nonatomic, assign) UITextField * TB_Phone;
	@property (nonatomic, assign) UITextField * TB_Role;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_DeleteUser;
	-(void) setB_DeleteUser:(UIButton *)p0;
	-(UIButton *) B_Save;
	-(void) setB_Save:(UIButton *)p0;
	-(UIButton *) B_SitesCoordinated;
	-(void) setB_SitesCoordinated:(UIButton *)p0;
	-(UILabel *) L_Title;
	-(void) setL_Title:(UILabel *)p0;
	-(UISwitch *) SW_Mobile;
	-(void) setSW_Mobile:(UISwitch *)p0;
	-(UITextField *) TB_Cert;
	-(void) setTB_Cert:(UITextField *)p0;
	-(UITextField *) TB_Email;
	-(void) setTB_Email:(UITextField *)p0;
	-(UITextField *) TB_Name;
	-(void) setTB_Name:(UITextField *)p0;
	-(UITextField *) TB_Password;
	-(void) setTB_Password:(UITextField *)p0;
	-(UITextField *) TB_PasswordConfirm;
	-(void) setTB_PasswordConfirm:(UITextField *)p0;
	-(UITextField *) TB_Phone;
	-(void) setTB_Phone:(UITextField *)p0;
	-(UITextField *) TB_Role;
	-(void) setTB_Role:(UITextField *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_AdminUserSites : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Save;
	@property (nonatomic, assign) UILabel * L_Name;
	@property (nonatomic, assign) UITableView * TV_Sites;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Save;
	-(void) setB_Save:(UIButton *)p0;
	-(UILabel *) L_Name;
	-(void) setL_Name:(UILabel *)p0;
	-(UITableView *) TV_Sites;
	-(void) setTV_Sites:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_AdminSites : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_CreateSite;
	@property (nonatomic, assign) UITextField * TB_FilterBy;
	@property (nonatomic, assign) UITableView * TV_Sites;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_CreateSite;
	-(void) setB_CreateSite:(UIButton *)p0;
	-(UITextField *) TB_FilterBy;
	-(void) setTB_FilterBy:(UITextField *)p0;
	-(UITableView *) TV_Sites;
	-(void) setTV_Sites:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_AdminSite : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_ContactAndNotes;
	@property (nonatomic, assign) UIButton * B_Coordinators;
	@property (nonatomic, assign) UIButton * B_DeleteSite;
	@property (nonatomic, assign) UIButton * B_Save;
	@property (nonatomic, assign) UIButton * B_SiteCalendar;
	@property (nonatomic, assign) UIButton * B_SiteDetails;
	@property (nonatomic, assign) UIButton * B_SiteLocation;
	@property (nonatomic, assign) UILabel * L_Capabilities;
	@property (nonatomic, assign) UILabel * L_CityStateZip;
	@property (nonatomic, assign) UILabel * L_SiteName;
	@property (nonatomic, assign) UILabel * L_Street;
	@property (nonatomic, assign) UILabel * L_Type;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_ContactAndNotes;
	-(void) setB_ContactAndNotes:(UIButton *)p0;
	-(UIButton *) B_Coordinators;
	-(void) setB_Coordinators:(UIButton *)p0;
	-(UIButton *) B_DeleteSite;
	-(void) setB_DeleteSite:(UIButton *)p0;
	-(UIButton *) B_Save;
	-(void) setB_Save:(UIButton *)p0;
	-(UIButton *) B_SiteCalendar;
	-(void) setB_SiteCalendar:(UIButton *)p0;
	-(UIButton *) B_SiteDetails;
	-(void) setB_SiteDetails:(UIButton *)p0;
	-(UIButton *) B_SiteLocation;
	-(void) setB_SiteLocation:(UIButton *)p0;
	-(UILabel *) L_Capabilities;
	-(void) setL_Capabilities:(UILabel *)p0;
	-(UILabel *) L_CityStateZip;
	-(void) setL_CityStateZip:(UILabel *)p0;
	-(UILabel *) L_SiteName;
	-(void) setL_SiteName:(UILabel *)p0;
	-(UILabel *) L_Street;
	-(void) setL_Street:(UILabel *)p0;
	-(UILabel *) L_Type;
	-(void) setL_Type:(UILabel *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_AdminSiteLocation : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_GetLatLong;
	@property (nonatomic, assign) UIButton * B_Save;
	@property (nonatomic, assign) UILabel * L_SiteLocation;
	@property (nonatomic, assign) UILabel * L_SiteName;
	@property (nonatomic, assign) UITextField * TB_City;
	@property (nonatomic, assign) UITextField * TB_Latitude;
	@property (nonatomic, assign) UITextField * TB_Longitude;
	@property (nonatomic, assign) UITextField * TB_Name;
	@property (nonatomic, assign) UITextField * TB_State;
	@property (nonatomic, assign) UITextField * TB_Street;
	@property (nonatomic, assign) UITextField * TB_Zip;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_GetLatLong;
	-(void) setB_GetLatLong:(UIButton *)p0;
	-(UIButton *) B_Save;
	-(void) setB_Save:(UIButton *)p0;
	-(UILabel *) L_SiteLocation;
	-(void) setL_SiteLocation:(UILabel *)p0;
	-(UILabel *) L_SiteName;
	-(void) setL_SiteName:(UILabel *)p0;
	-(UITextField *) TB_City;
	-(void) setTB_City:(UITextField *)p0;
	-(UITextField *) TB_Latitude;
	-(void) setTB_Latitude:(UITextField *)p0;
	-(UITextField *) TB_Longitude;
	-(void) setTB_Longitude:(UITextField *)p0;
	-(UITextField *) TB_Name;
	-(void) setTB_Name:(UITextField *)p0;
	-(UITextField *) TB_State;
	-(void) setTB_State:(UITextField *)p0;
	-(UITextField *) TB_Street;
	-(void) setTB_Street:(UITextField *)p0;
	-(UITextField *) TB_Zip;
	-(void) setTB_Zip:(UITextField *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_AdminSiteCalDetails : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Save;
	@property (nonatomic, assign) UILabel * L_Date;
	@property (nonatomic, assign) UILabel * L_SiteName;
	@property (nonatomic, assign) UISwitch * SW_Open;
	@property (nonatomic, assign) UITextField * TB_CloseTime;
	@property (nonatomic, assign) UITextField * TB_OpenTime;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Save;
	-(void) setB_Save:(UIButton *)p0;
	-(UILabel *) L_Date;
	-(void) setL_Date:(UILabel *)p0;
	-(UILabel *) L_SiteName;
	-(void) setL_SiteName:(UILabel *)p0;
	-(UISwitch *) SW_Open;
	-(void) setSW_Open:(UISwitch *)p0;
	-(UITextField *) TB_CloseTime;
	-(void) setTB_CloseTime:(UITextField *)p0;
	-(UITextField *) TB_OpenTime;
	-(void) setTB_OpenTime:(UITextField *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_AdminSiteCoord : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Save;
	@property (nonatomic, assign) UILabel * L_SiteName;
	@property (nonatomic, assign) UITableView * TV_Coord;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Save;
	-(void) setB_Save:(UIButton *)p0;
	-(UILabel *) L_SiteName;
	-(void) setL_SiteName:(UILabel *)p0;
	-(UITableView *) TV_Coord;
	-(void) setTV_Coord:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_AdminSuggestions : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UITableView * TV_Suggestions;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UITableView *) TV_Suggestions;
	-(void) setTV_Suggestions:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_AdminNotifications : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_NewNotification;
	@property (nonatomic, assign) UITableView * TV_Notifications;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_NewNotification;
	-(void) setB_NewNotification:(UIButton *)p0;
	-(UITableView *) TV_Notifications;
	-(void) setTV_Notifications:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_AdminSuggestion : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_SendTo;
	@property (nonatomic, assign) UILabel * L_Title;
	@property (nonatomic, assign) UITextField * TB_Date;
	@property (nonatomic, assign) UITextField * TB_From;
	@property (nonatomic, assign) UITextField * TB_Subject;
	@property (nonatomic, assign) UITextView * TxV_Message;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_SendTo;
	-(void) setB_SendTo:(UIButton *)p0;
	-(UILabel *) L_Title;
	-(void) setL_Title:(UILabel *)p0;
	-(UITextField *) TB_Date;
	-(void) setTB_Date:(UITextField *)p0;
	-(UITextField *) TB_From;
	-(void) setTB_From:(UITextField *)p0;
	-(UITextField *) TB_Subject;
	-(void) setTB_Subject:(UITextField *)p0;
	-(UITextView *) TxV_Message;
	-(void) setTxV_Message:(UITextView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_AdminNotification : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Send;
	@property (nonatomic, assign) UILabel * L_Title;
	@property (nonatomic, assign) UITextField * TB_LastSent;
	@property (nonatomic, assign) UITextField * TB_To;
	@property (nonatomic, assign) UITextView * TxV_Message;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Send;
	-(void) setB_Send:(UIButton *)p0;
	-(UILabel *) L_Title;
	-(void) setL_Title:(UILabel *)p0;
	-(UITextField *) TB_LastSent;
	-(void) setTB_LastSent:(UITextField *)p0;
	-(UITextField *) TB_To;
	-(void) setTB_To:(UITextField *)p0;
	-(UITextView *) TxV_Message;
	-(void) setTxV_Message:(UITextView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_AdminReports : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UITableView * TV_Reports;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UITableView *) TV_Reports;
	-(void) setTV_Reports:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_AdminReport : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_GenerateReport;
	@property (nonatomic, assign) UIButton * B_SendTo;
	@property (nonatomic, assign) UILabel * L_ReportName;
	@property (nonatomic, assign) UITextView * TxV_Report;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_GenerateReport;
	-(void) setB_GenerateReport:(UIButton *)p0;
	-(UIButton *) B_SendTo;
	-(void) setB_SendTo:(UIButton *)p0;
	-(UILabel *) L_ReportName;
	-(void) setL_ReportName:(UILabel *)p0;
	-(UITextView *) TxV_Report;
	-(void) setTxV_Report:(UITextView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_AdminSiteCalReset : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Save;
	@property (nonatomic, assign) UILabel * L_SiteName;
	@property (nonatomic, assign) UITableView * TV_DaysOfWeek;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Save;
	-(void) setB_Save:(UIButton *)p0;
	-(UILabel *) L_SiteName;
	-(void) setL_SiteName:(UILabel *)p0;
	-(UITableView *) TV_DaysOfWeek;
	-(void) setTV_DaysOfWeek:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_AdminSiteCalResetDOW : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Save;
	@property (nonatomic, assign) UILabel * L_DOW;
	@property (nonatomic, assign) UILabel * L_SiteName;
	@property (nonatomic, assign) UISwitch * SW_Open;
	@property (nonatomic, assign) UITextField * TB_CloseTime;
	@property (nonatomic, assign) UITextField * TB_OpenTime;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Save;
	-(void) setB_Save:(UIButton *)p0;
	-(UILabel *) L_DOW;
	-(void) setL_DOW:(UILabel *)p0;
	-(UILabel *) L_SiteName;
	-(void) setL_SiteName:(UILabel *)p0;
	-(UISwitch *) SW_Open;
	-(void) setSW_Open:(UISwitch *)p0;
	-(UITextField *) TB_CloseTime;
	-(void) setTB_CloseTime:(UITextField *)p0;
	-(UITextField *) TB_OpenTime;
	-(void) setTB_OpenTime:(UITextField *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_VolEditSettings : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Save;
	@property (nonatomic, assign) UILabel * L_Title;
	@property (nonatomic, assign) UITextField * TB_Email;
	@property (nonatomic, assign) UITextField * TB_Name;
	@property (nonatomic, assign) UITextField * TB_Password;
	@property (nonatomic, assign) UITextField * TB_PasswordVerify;
	@property (nonatomic, assign) UITextField * TB_Phone;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Save;
	-(void) setB_Save:(UIButton *)p0;
	-(UILabel *) L_Title;
	-(void) setL_Title:(UILabel *)p0;
	-(UITextField *) TB_Email;
	-(void) setTB_Email:(UITextField *)p0;
	-(UITextField *) TB_Name;
	-(void) setTB_Name:(UITextField *)p0;
	-(UITextField *) TB_Password;
	-(void) setTB_Password:(UITextField *)p0;
	-(UITextField *) TB_PasswordVerify;
	-(void) setTB_PasswordVerify:(UITextField *)p0;
	-(UITextField *) TB_Phone;
	-(void) setTB_Phone:(UITextField *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_VolMobileCalendar : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Done;
	@property (nonatomic, assign) UIButton * B_MonthNext;
	@property (nonatomic, assign) UIButton * B_MonthPrevious;
	@property (nonatomic, assign) UICollectionView * CV_Grid;
	@property (nonatomic, assign) UILabel * L_MonthYear;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Done;
	-(void) setB_Done:(UIButton *)p0;
	-(UIButton *) B_MonthNext;
	-(void) setB_MonthNext:(UIButton *)p0;
	-(UIButton *) B_MonthPrevious;
	-(void) setB_MonthPrevious:(UIButton *)p0;
	-(UICollectionView *) CV_Grid;
	-(void) setCV_Grid:(UICollectionView *)p0;
	-(UILabel *) L_MonthYear;
	-(void) setL_MonthYear:(UILabel *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_VolMobileCalOnDate : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Done;
	@property (nonatomic, assign) UILabel * L_Date;
	@property (nonatomic, assign) UITableView * LV_Sites;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Done;
	-(void) setB_Done:(UIButton *)p0;
	-(UILabel *) L_Date;
	-(void) setL_Date:(UILabel *)p0;
	-(UITableView *) LV_Sites;
	-(void) setLV_Sites:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_AdminMobile : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_MonthNext;
	@property (nonatomic, assign) UIButton * B_MonthPrevious;
	@property (nonatomic, assign) UICollectionView * CV_Grid;
	@property (nonatomic, assign) UILabel * L_MonthYear;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_MonthNext;
	-(void) setB_MonthNext:(UIButton *)p0;
	-(UIButton *) B_MonthPrevious;
	-(void) setB_MonthPrevious:(UIButton *)p0;
	-(UICollectionView *) CV_Grid;
	-(void) setCV_Grid:(UICollectionView *)p0;
	-(UILabel *) L_MonthYear;
	-(void) setL_MonthYear:(UILabel *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_AdminMobileDate : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UILabel * L_Date;
	@property (nonatomic, assign) UITableView * LV_Calendar;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UILabel *) L_Date;
	-(void) setL_Date:(UILabel *)p0;
	-(UITableView *) LV_Calendar;
	-(void) setLV_Calendar:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_AdminSiteCalResetAction : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Save;
	@property (nonatomic, assign) UILabel * L_SiteName;
	@property (nonatomic, assign) UILabel * L_Title;
	@property (nonatomic, assign) UISwitch * SW_Confirm;
	@property (nonatomic, assign) UITextField * TB_SeasonFirst;
	@property (nonatomic, assign) UITextField * TB_SeasonLast;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Save;
	-(void) setB_Save:(UIButton *)p0;
	-(UILabel *) L_SiteName;
	-(void) setL_SiteName:(UILabel *)p0;
	-(UILabel *) L_Title;
	-(void) setL_Title:(UILabel *)p0;
	-(UISwitch *) SW_Confirm;
	-(void) setSW_Confirm:(UISwitch *)p0;
	-(UITextField *) TB_SeasonFirst;
	-(void) setTB_SeasonFirst:(UITextField *)p0;
	-(UITextField *) TB_SeasonLast;
	-(void) setTB_SeasonLast:(UITextField *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_ExportImport : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_ExportSites;
	@property (nonatomic, assign) UIButton * B_ExportUsers;
	@property (nonatomic, assign) UIButton * B_ImportSites;
	@property (nonatomic, assign) UIButton * B_ImportUsers;
	@property (nonatomic, assign) UITextView * TxV_Json;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_ExportSites;
	-(void) setB_ExportSites:(UIButton *)p0;
	-(UIButton *) B_ExportUsers;
	-(void) setB_ExportUsers:(UIButton *)p0;
	-(UIButton *) B_ImportSites;
	-(void) setB_ImportSites:(UIButton *)p0;
	-(UIButton *) B_ImportUsers;
	-(void) setB_ImportUsers:(UIButton *)p0;
	-(UITextView *) TxV_Json;
	-(void) setTxV_Json:(UITextView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_SCVolList : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UITableView * TV_Volunteers;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UITableView *) TV_Volunteers;
	-(void) setTV_Volunteers:(UITableView *)p0;
	-(void) viewDidLoad;
	-(void) viewDidAppear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface OpenTK_Platform_iPhoneOS_iPhoneOSGameView : UIView {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	+(Class) layerClass;
	-(void) layoutSubviews;
	-(void) willMoveToWindow:(UIWindow *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) initWithCoder:(NSCoder *)p0;
	-(id) initWithFrame:(CGRect)p0;
@end

@interface UIKit_UIView_UIViewAppearance : NSObject {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIColor *) tintColor;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface UIKit_UIControl_UIControlAppearance : UIKit_UIView_UIViewAppearance {
}
@end

@interface UIKit_UIButton_UIButtonAppearance : UIKit_UIControl_UIControlAppearance {
}
	-(UIImage *) backgroundImageForState:(NSUInteger)p0;
	-(UIColor *) titleColorForState:(NSUInteger)p0;
	-(UIColor *) titleShadowColorForState:(NSUInteger)p0;
@end

@interface __UIGestureRecognizerToken : NSObject {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface __UIGestureRecognizerParameterlessToken : __UIGestureRecognizerToken {
}
	-(void) target;
@end

@interface UIKit_UINavigationBar_UINavigationBarAppearance : UIKit_UIView_UIViewAppearance {
}
	-(UIColor *) barTintColor;
	-(NSDictionary *) largeTitleTextAttributes;
	-(NSDictionary *) titleTextAttributes;
@end

@interface UIKit_UISwitch_UISwitchAppearance : UIKit_UIControl_UIControlAppearance {
}
	-(UIColor *) onTintColor;
@end

@interface Xamarin_Forms_Platform_iOS_FormsApplicationDelegate : NSObject<UIApplicationDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIWindow *) window;
	-(void) setWindow:(UIWindow *)p0;
	-(BOOL) application:(UIApplication *)p0 continueUserActivity:(NSUserActivity *)p1 restorationHandler:(id)p2;
	-(void) applicationDidEnterBackground:(UIApplication *)p0;
	-(BOOL) application:(UIApplication *)p0 didFinishLaunchingWithOptions:(NSDictionary *)p1;
	-(void) applicationDidBecomeActive:(UIApplication *)p0;
	-(void) applicationWillResignActive:(UIApplication *)p0;
	-(void) application:(UIApplication *)p0 didUpdateUserActivity:(NSUserActivity *)p1;
	-(void) applicationWillEnterForeground:(UIApplication *)p0;
	-(BOOL) application:(UIApplication *)p0 willFinishLaunchingWithOptions:(NSDictionary *)p1;
	-(void) applicationWillTerminate:(UIApplication *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_VisualElementRenderer_1 : UIView {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIColor *) backgroundColor;
	-(void) setBackgroundColor:(UIColor *)p0;
	-(NSArray *) keyCommands;
	-(void) tabForward:(UIKeyCommand *)p0;
	-(void) tabBackward:(UIKeyCommand *)p0;
	-(CGSize) sizeThatFits:(CGSize)p0;
	-(void) layoutSubviews;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_ViewRenderer_2 : Xamarin_Forms_Platform_iOS_VisualElementRenderer_1 {
}
	-(void) layoutSubviews;
	-(CGSize) sizeThatFits:(CGSize)p0;
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_ViewRenderer : Xamarin_Forms_Platform_iOS_ViewRenderer_2 {
}
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_CellTableViewCell : UITableViewCell {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface Xamarin_Forms_Platform_iOS_ActivityIndicatorRenderer : Xamarin_Forms_Platform_iOS_ViewRenderer_2 {
}
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_BoxRenderer : Xamarin_Forms_Platform_iOS_VisualElementRenderer_1 {
}
	-(void) drawRect:(CGRect)p0;
	-(void) layoutSubviews;
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_EntryRenderer : Xamarin_Forms_Platform_iOS_ViewRenderer_2 {
}
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_FrameRenderer : Xamarin_Forms_Platform_iOS_VisualElementRenderer_1 {
}
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_LabelRenderer : Xamarin_Forms_Platform_iOS_ViewRenderer_2 {
}
	-(void) layoutSubviews;
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_FormsRefreshControl : UIRefreshControl {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(BOOL) isHidden;
	-(void) setHidden:(BOOL)p0;
	-(void) beginRefreshing;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface Xamarin_Forms_Platform_iOS_ProgressBarRenderer : Xamarin_Forms_Platform_iOS_ViewRenderer_2 {
}
	-(CGSize) sizeThatFits:(CGSize)p0;
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_ScrollViewRenderer : UIScrollView {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) layoutSubviews;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_SearchBarRenderer : Xamarin_Forms_Platform_iOS_ViewRenderer_2 {
}
	-(CGSize) sizeThatFits:(CGSize)p0;
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_StepperRenderer : Xamarin_Forms_Platform_iOS_ViewRenderer_2 {
}
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_SwitchRenderer : Xamarin_Forms_Platform_iOS_ViewRenderer_2 {
}
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_TableViewModelRenderer : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(CGFloat) tableView:(UITableView *)p0 heightForHeaderInSection:(NSInteger)p1;
	-(UIView *) tableView:(UITableView *)p0 viewForHeaderInSection:(NSInteger)p1;
	-(NSInteger) numberOfSectionsInTableView:(UITableView *)p0;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(NSArray *) sectionIndexTitlesForTableView:(UITableView *)p0;
	-(NSString *) tableView:(UITableView *)p0 titleForHeaderInSection:(NSInteger)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface Xamarin_Forms_Platform_iOS_UnEvenTableViewModelRenderer : Xamarin_Forms_Platform_iOS_TableViewModelRenderer<UIScrollViewDelegate> {
}
	-(CGFloat) tableView:(UITableView *)p0 heightForRowAtIndexPath:(NSIndexPath *)p1;
@end

@interface Xamarin_Forms_Platform_iOS_TableViewRenderer : Xamarin_Forms_Platform_iOS_ViewRenderer_2 {
}
	-(void) layoutSubviews;
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_NativeViewWrapperRenderer : Xamarin_Forms_Platform_iOS_ViewRenderer_2 {
}
	-(void) layoutSubviews;
	-(CGSize) sizeThatFits:(CGSize)p0;
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_ButtonRenderer : Xamarin_Forms_Platform_iOS_ViewRenderer_2 {
}
	-(CGSize) sizeThatFits:(CGSize)p0;
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_CarouselPageRenderer : UIViewController {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) didRotateFromInterfaceOrientation:(NSInteger)p0;
	-(void) viewDidAppear:(BOOL)p0;
	-(void) viewDidDisappear:(BOOL)p0;
	-(void) viewDidLayoutSubviews;
	-(void) viewDidLoad;
	-(void) viewDidUnload;
	-(void) willRotateToInterfaceOrientation:(NSInteger)p0 duration:(double)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_DatePickerRenderer : Xamarin_Forms_Platform_iOS_ViewRenderer_2 {
}
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_EditorRenderer : Xamarin_Forms_Platform_iOS_ViewRenderer_2 {
}
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_ImageRenderer : Xamarin_Forms_Platform_iOS_ViewRenderer_2 {
}
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_ListViewRenderer : Xamarin_Forms_Platform_iOS_ViewRenderer_2 {
}
	-(void) layoutSubviews;
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_NavigationMenuRenderer : Xamarin_Forms_Platform_iOS_ViewRenderer {
}
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_NavigationRenderer : UINavigationController {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) didRotateFromInterfaceOrientation:(NSInteger)p0;
	-(NSArray *) popToRootViewControllerAnimated:(BOOL)p0;
	-(UIViewController *) popViewControllerAnimated:(BOOL)p0;
	-(void) viewDidAppear:(BOOL)p0;
	-(void) viewWillAppear:(BOOL)p0;
	-(void) viewDidDisappear:(BOOL)p0;
	-(void) viewDidLayoutSubviews;
	-(void) viewDidLoad;
	-(UIViewController *) childViewControllerForStatusBarHidden;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_PageRenderer : UIViewController {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) viewSafeAreaInsetsDidChange;
	-(void) viewDidAppear:(BOOL)p0;
	-(void) viewDidDisappear:(BOOL)p0;
	-(void) viewDidLoad;
	-(void) viewWillDisappear:(BOOL)p0;
	-(NSInteger) preferredStatusBarUpdateAnimation;
	-(BOOL) prefersStatusBarHidden;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_PhoneMasterDetailRenderer : UIViewController {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) viewDidAppear:(BOOL)p0;
	-(void) viewDidDisappear:(BOOL)p0;
	-(void) viewDidLayoutSubviews;
	-(void) viewDidLoad;
	-(void) willRotateToInterfaceOrientation:(NSInteger)p0 duration:(double)p1;
	-(UIViewController *) childViewControllerForStatusBarHidden;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_PickerRenderer : Xamarin_Forms_Platform_iOS_ViewRenderer_2 {
}
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_SliderRenderer : Xamarin_Forms_Platform_iOS_ViewRenderer_2 {
}
	-(CGSize) sizeThatFits:(CGSize)p0;
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_TabbedRenderer : UITabBarController {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIViewController *) selectedViewController;
	-(void) setSelectedViewController:(UIViewController *)p0;
	-(void) didRotateFromInterfaceOrientation:(NSInteger)p0;
	-(void) viewDidAppear:(BOOL)p0;
	-(void) viewDidDisappear:(BOOL)p0;
	-(void) viewDidLayoutSubviews;
	-(UIViewController *) childViewControllerForStatusBarHidden;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_TabletMasterDetailRenderer : UISplitViewController {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) viewDidAppear:(BOOL)p0;
	-(void) viewDidDisappear:(BOOL)p0;
	-(void) viewDidLayoutSubviews;
	-(void) viewDidLoad;
	-(void) viewWillDisappear:(BOOL)p0;
	-(void) viewWillLayoutSubviews;
	-(void) willRotateToInterfaceOrientation:(NSInteger)p0 duration:(double)p1;
	-(UIViewController *) childViewControllerForStatusBarHidden;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_TimePickerRenderer : Xamarin_Forms_Platform_iOS_ViewRenderer_2 {
}
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_WebViewRenderer : UIWebView {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) layoutSubviews;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_WkWebViewRenderer : WKWebView {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(void) layoutSubviews;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_ImageButtonRenderer : Xamarin_Forms_Platform_iOS_ViewRenderer_2 {
}
	-(CGSize) sizeThatFits:(CGSize)p0;
	-(id) init;
@end

@interface Xamarin_Forms_Maps_iOS_MapRenderer : Xamarin_Forms_Platform_iOS_ViewRenderer {
}
	-(void) layoutSubviews;
	-(id) init;
@end


