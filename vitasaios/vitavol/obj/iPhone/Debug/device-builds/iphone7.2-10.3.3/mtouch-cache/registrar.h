#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wtypedef-redefinition"
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
#define DEBUG 1
#include <stdarg.h>
#include <objc/objc.h>
#include <objc/runtime.h>
#include <objc/message.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/QuartzCore.h>
#import <QuartzCore/CAEmitterBehavior.h>
#import <CoreSpotlight/CoreSpotlight.h>
#import <CloudKit/CloudKit.h>
#import <UserNotifications/UserNotifications.h>
#import <GLKit/GLKit.h>
#import <CoreGraphics/CoreGraphics.h>

@protocol UIPickerViewModel;
@class Foundation_InternalNSNotificationHandler;
@class __MonoMac_NSActionDispatcher;
@class __Xamarin_NSTimerActionDispatcher;
@class __MonoMac_NSAsyncActionDispatcher;
@class UIKit_UIControlEventProxy;
@class zsquared_UserNotificationCenterDelegate;
@class zsquared_C_SitesTableSource;
@class zsquared_C_PickerModel;
@class VC_About;
@class vitavol_C_WebViewDelegateAbout;
@class VC_SCVolunteerHours;
@class VC_SCSiteCalendar;
@class AppDelegate;
@class ViewController;
@class vitavol_VC_Suggestions_C_SuggestionsTableSource;
@class VC_Suggestions;
@class VC_Register;
@class vitavol_VC_MySignUps_C_MySignUpsTableSourceWorkIntents;
@class VC_MySignUps;
@class VC_Suggestion;
@class VC_Calendar;
@class vitavol_VC_SitesOnDateList_C_TableSourceSitesOnDateList;
@class VC_SitesOnDateList;
@class VC_SitesOnDateMap;
@class vitavol_VC_SignUp_C_SignUpTableSourceSignUp;
@class VC_SignUp;
@class vitavol_VC_SCSites_C_SitesTableSourceSCSites;
@class VC_SCSites;
@class VC_SCSite;
@class vitavol_VC_SCVolunteers_C_WorkItemsTableSourceSCVolunteers;
@class VC_SCVolunteers;
@class vitavol_VC_SCSiteOnDate_EFilerPickerViewModel;
@class VC_SCSiteOnDate;
@class vitavol_VC_SCSiteDefaults_EFilerPickerViewModel;
@class VC_SCSiteDefaults;
@class vitavol_C_CVHelper_C_CVSource;
@class vitavol_C_CVHelper_C_GridCell;
@class vitavol_C_CVHelper;
@class vitavol_VC_Suggestions_C_SuggestionsTableDelegate;
@class vitavol_VC_MySignUps_C_MySignUpsTableDelegateWorkIntents;
@class vitavol_VC_SitesOnDateMap_C_MapDelegateX;
@class Xamarin_Forms_Platform_iOS_iOS7ButtonContainer;
@class Xamarin_Forms_Platform_iOS_GlobalCloseContextGestureRecognizer;
@class Xamarin_Forms_Platform_iOS_ModalWrapper;
@class Xamarin_Forms_Platform_iOS_PlatformRenderer;
@class Xamarin_Forms_Platform_iOS_VisualElementRenderer_1;
@class Xamarin_Forms_Platform_iOS_ViewRenderer_2;
@class Xamarin_Forms_Platform_iOS_ViewRenderer;
@class Xamarin_Forms_Platform_iOS_CellTableViewCell;
@class Xamarin_Forms_Platform_iOS_ActivityIndicatorRenderer;
@class Xamarin_Forms_Platform_iOS_BoxRenderer;
@class Xamarin_Forms_Platform_iOS_NoCaretField;
@class Xamarin_Forms_Platform_iOS_EditorRenderer;
@class Xamarin_Forms_Platform_iOS_EntryRenderer;
@class Xamarin_Forms_Platform_iOS_FrameRenderer;
@class Xamarin_Forms_Platform_iOS_LabelRenderer;
@class Xamarin_Forms_Platform_iOS_HeaderWrapperView;
@class Xamarin_Forms_Platform_iOS_FormsUITableViewController;
@class Xamarin_Forms_Platform_iOS_ProgressBarRenderer;
@class Xamarin_Forms_Platform_iOS_ScrollViewRenderer;
@class Xamarin_Forms_Platform_iOS_SearchBarRenderer;
@class Xamarin_Forms_Platform_iOS_SliderRenderer;
@class Xamarin_Forms_Platform_iOS_StepperRenderer;
@class Xamarin_Forms_Platform_iOS_SwitchRenderer;
@class Xamarin_Forms_Platform_iOS_TabbedRenderer;
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
@class Xamarin_Forms_Platform_iOS_FormsApplicationDelegate;
@class Xamarin_Forms_Platform_iOS_Platform_DefaultRenderer;
@class Xamarin_Forms_Platform_iOS_EntryCellRenderer_EntryCellTableViewCell;
@class Xamarin_Forms_Platform_iOS_ViewCellRenderer_ViewTableCell;
@class Xamarin_Forms_Platform_iOS_ToolbarItemExtensions_PrimaryToolbarItem;
@class Xamarin_Forms_Platform_iOS_ButtonRenderer;
@class Xamarin_Forms_Platform_iOS_CarouselPageRenderer_PageContainer;
@class Xamarin_Forms_Platform_iOS_CarouselPageRenderer;
@class Xamarin_Forms_Platform_iOS_DatePickerRenderer;
@class Xamarin_Forms_Platform_iOS_ImageRenderer;
@class Xamarin_Forms_Platform_iOS_ListViewRenderer_ListViewDataSource;
@class Xamarin_Forms_Platform_iOS_ListViewRenderer_UnevenListViewDataSource;
@class Xamarin_Forms_Platform_iOS_ListViewRenderer;
@class Xamarin_Forms_Platform_iOS_NavigationMenuRenderer_NavigationCell;
@class Xamarin_Forms_Platform_iOS_NavigationMenuRenderer;
@class Xamarin_Forms_Platform_iOS_NavigationRenderer_ParentingViewController;
@class Xamarin_Forms_Platform_iOS_NavigationRenderer;
@class Xamarin_Forms_Platform_iOS_OpenGLViewRenderer_Delegate;
@class Xamarin_Forms_Platform_iOS_OpenGLViewRenderer;
@class Xamarin_Forms_Platform_iOS_PageRenderer;
@class Xamarin_Forms_Platform_iOS_PhoneMasterDetailRenderer_ChildViewController;
@class Xamarin_Forms_Platform_iOS_PhoneMasterDetailRenderer;
@class Xamarin_Forms_Platform_iOS_PickerRenderer_PickerSource;
@class Xamarin_Forms_Platform_iOS_PickerRenderer;
@class Xamarin_Forms_Platform_iOS_TabletMasterDetailRenderer_InnerDelegate;
@class Xamarin_Forms_Platform_iOS_TabletMasterDetailRenderer;
@class Xamarin_Forms_Platform_iOS_TimePickerRenderer;
@class Xamarin_Forms_Platform_iOS_WebViewRenderer_CustomWebViewDelegate;
@class Xamarin_Forms_Platform_iOS_WebViewRenderer;
@class Xamarin_Forms_Platform_iOS_ToolbarItemExtensions_SecondaryToolbarItem_SecondaryToolbarItemContent;
@class Xamarin_Forms_Platform_iOS_ToolbarItemExtensions_SecondaryToolbarItem;
@class Xamarin_Forms_Platform_iOS_NavigationMenuRenderer_DataSource;
@class Xamarin_Forms_Platform_iOS_NavigationRenderer_SecondaryToolbar;
@class UIKit_UITextField__UITextFieldDelegate;
@class UIKit_UIScrollView__UIScrollViewDelegate;
@class UIKit_UITextView__UITextViewDelegate;
@class UIKit_UIView_UIViewAppearance;
@class MapKit_MKMapView__MKMapViewDelegate;
@class GLKit_GLKView__GLKViewDelegate;
@class __NSObject_Disposer;
@class UIKit_UIGestureRecognizer__UIGestureRecognizerDelegate;
@class __UIGestureRecognizerToken;
@class __UIGestureRecognizerParameterlessToken;
@class __UIGestureRecognizerParametrizedToken;
@class __UILongPressGestureRecognizer;
@class UIKit_UINavigationBar_UINavigationBarAppearance;
@class __UIPanGestureRecognizer;
@class UIKit_UIBarButtonItem_Callback;
@class __UIRotationGestureRecognizer;
@class __UITapGestureRecognizer;
@class __UIPinchGestureRecognizer;
@class __UISwipeGestureRecognizer;
@class __UIScreenEdgePanGestureRecognizer;
@class UIKit_UISearchBar__UISearchBarDelegate;
@class UIKit_UISplitViewController__UISplitViewControllerDelegate;
@class UIKit_UITabBarController__UITabBarControllerDelegate;
@class UIKit_UIWebView__UIWebViewDelegate;

@protocol UIPickerViewModel<UIPickerViewDataSource, UIPickerViewDelegate>
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

@interface zsquared_C_SitesTableSource : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface zsquared_C_PickerModel : NSObject<UIPickerViewModel> {
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
	@property (nonatomic, assign) UITextView * TB_About;
	@property (nonatomic, assign) UIWebView * WV_About;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UITextView *) TB_About;
	-(void) setTB_About:(UITextView *)p0;
	-(UIWebView *) WV_About;
	-(void) setWV_About:(UIWebView *)p0;
	-(void) viewDidLoad;
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

@interface VC_SCVolunteerHours : UIViewController {
}
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UILabel * L_ApprovedState;
	@property (nonatomic, assign) UILabel * L_Date;
	@property (nonatomic, assign) UILabel * L_Site;
	@property (nonatomic, assign) UILabel * L_Volunteer;
	@property (nonatomic, assign) UITextField * TB_Hours;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UILabel *) L_ApprovedState;
	-(void) setL_ApprovedState:(UILabel *)p0;
	-(UILabel *) L_Date;
	-(void) setL_Date:(UILabel *)p0;
	-(UILabel *) L_Site;
	-(void) setL_Site:(UILabel *)p0;
	-(UILabel *) L_Volunteer;
	-(void) setL_Volunteer:(UILabel *)p0;
	-(UITextField *) TB_Hours;
	-(void) setTB_Hours:(UITextField *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_SCSiteCalendar : UIViewController {
}
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_MonthNext;
	@property (nonatomic, assign) UIButton * B_MonthPrevious;
	@property (nonatomic, assign) UICollectionView * CV_Grid;
	@property (nonatomic, assign) UIImageView * IMG_ExceptionBase;
	@property (nonatomic, assign) UIImageView * IMG_ExceptionTop;
	@property (nonatomic, assign) UIImageView * IMG_SiteIsClosed;
	@property (nonatomic, assign) UIImageView * IMG_SiteIsOpen;
	@property (nonatomic, assign) UILabel * L_MonthYear;
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
	-(UIImageView *) IMG_ExceptionBase;
	-(void) setIMG_ExceptionBase:(UIImageView *)p0;
	-(UIImageView *) IMG_ExceptionTop;
	-(void) setIMG_ExceptionTop:(UIImageView *)p0;
	-(UIImageView *) IMG_SiteIsClosed;
	-(void) setIMG_SiteIsClosed:(UIImageView *)p0;
	-(UIImageView *) IMG_SiteIsOpen;
	-(void) setIMG_SiteIsOpen:(UIImageView *)p0;
	-(UILabel *) L_MonthYear;
	-(void) setL_MonthYear:(UILabel *)p0;
	-(void) viewDidLoad;
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
	-(void) application:(UIApplication *)p0 performFetchWithCompletionHandler:(id)p1;
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
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Spinner;
	@property (nonatomic, assign) UIButton * B_About;
	@property (nonatomic, assign) UIButton * B_ClearFetch;
	@property (nonatomic, assign) UIButton * B_Login;
	@property (nonatomic, assign) UIButton * B_Register;
	@property (nonatomic, assign) UIButton * B_TriggerFetch;
	@property (nonatomic, assign) UIImageView * I_BackgroundImage;
	@property (nonatomic, assign) UILabel * L_Fetch;
	@property (nonatomic, assign) UITextField * TB_Email;
	@property (nonatomic, assign) UITextField * TB_Password;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Spinner;
	-(void) setAI_Spinner:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_About;
	-(void) setB_About:(UIButton *)p0;
	-(UIButton *) B_ClearFetch;
	-(void) setB_ClearFetch:(UIButton *)p0;
	-(UIButton *) B_Login;
	-(void) setB_Login:(UIButton *)p0;
	-(UIButton *) B_Register;
	-(void) setB_Register:(UIButton *)p0;
	-(UIButton *) B_TriggerFetch;
	-(void) setB_TriggerFetch:(UIButton *)p0;
	-(UIImageView *) I_BackgroundImage;
	-(void) setI_BackgroundImage:(UIImageView *)p0;
	-(UILabel *) L_Fetch;
	-(void) setL_Fetch:(UILabel *)p0;
	-(UITextField *) TB_Email;
	-(void) setTB_Email:(UITextField *)p0;
	-(UITextField *) TB_Password;
	-(void) setTB_Password:(UITextField *)p0;
	-(void) didReceiveMemoryWarning;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitavol_VC_Suggestions_C_SuggestionsTableSource : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_Suggestions : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_NewSuggestion;
	@property (nonatomic, assign) UITableView * TV_ListOfSuggestions;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_NewSuggestion;
	-(void) setB_NewSuggestion:(UIButton *)p0;
	-(UITableView *) TV_ListOfSuggestions;
	-(void) setTV_ListOfSuggestions:(UITableView *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_Register : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Submitting;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Submit;
	@property (nonatomic, assign) UILabel * L_Certification;
	@property (nonatomic, assign) UISwitch * SW_Basic;
	@property (nonatomic, assign) UITextField * TB_Email;
	@property (nonatomic, assign) UITextField * TB_Name;
	@property (nonatomic, assign) UITextField * TB_Password;
	@property (nonatomic, assign) UITextField * TB_Phone;
	@property (nonatomic, assign) UITextField * TB_VerifyPassword;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Submitting;
	-(void) setAI_Submitting:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Submit;
	-(void) setB_Submit:(UIButton *)p0;
	-(UILabel *) L_Certification;
	-(void) setL_Certification:(UILabel *)p0;
	-(UISwitch *) SW_Basic;
	-(void) setSW_Basic:(UISwitch *)p0;
	-(UITextField *) TB_Email;
	-(void) setTB_Email:(UITextField *)p0;
	-(UITextField *) TB_Name;
	-(void) setTB_Name:(UITextField *)p0;
	-(UITextField *) TB_Password;
	-(void) setTB_Password:(UITextField *)p0;
	-(UITextField *) TB_Phone;
	-(void) setTB_Phone:(UITextField *)p0;
	-(UITextField *) TB_VerifyPassword;
	-(void) setTB_VerifyPassword:(UITextField *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitavol_VC_MySignUps_C_MySignUpsTableSourceWorkIntents : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_MySignUps : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_SignUp;
	@property (nonatomic, assign) UIButton * B_Suggestion;
	@property (nonatomic, assign) UITableView * TV_SignUps;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_SignUp;
	-(void) setB_SignUp:(UIButton *)p0;
	-(UIButton *) B_Suggestion;
	-(void) setB_Suggestion:(UIButton *)p0;
	-(UITableView *) TV_SignUps;
	-(void) setTV_SignUps:(UITableView *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_Suggestion : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_DeleteThisSuggestion;
	@property (nonatomic, assign) UIButton * B_Save;
	@property (nonatomic, assign) UILabel * L_Date;
	@property (nonatomic, assign) UILabel * L_Status;
	@property (nonatomic, assign) UILabel * L_Submitter;
	@property (nonatomic, assign) UITextField * TB_Title;
	@property (nonatomic, assign) UITextView * TxV_Body;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_DeleteThisSuggestion;
	-(void) setB_DeleteThisSuggestion:(UIButton *)p0;
	-(UIButton *) B_Save;
	-(void) setB_Save:(UIButton *)p0;
	-(UILabel *) L_Date;
	-(void) setL_Date:(UILabel *)p0;
	-(UILabel *) L_Status;
	-(void) setL_Status:(UILabel *)p0;
	-(UILabel *) L_Submitter;
	-(void) setL_Submitter:(UILabel *)p0;
	-(UITextField *) TB_Title;
	-(void) setTB_Title:(UITextField *)p0;
	-(UITextView *) TxV_Body;
	-(void) setTxV_Body:(UITextView *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_Calendar : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Loading;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_NextMonth;
	@property (nonatomic, assign) UIButton * B_PreviousMonth;
	@property (nonatomic, assign) UICollectionView * CV_Grid;
	@property (nonatomic, assign) UIImageView * IMG_AllSitesClosed;
	@property (nonatomic, assign) UIImageView * IMG_FullyStaffed;
	@property (nonatomic, assign) UIImageView * IMG_StaffingNeeded;
	@property (nonatomic, assign) UIImageView * IMG_UserSignedUpBase;
	@property (nonatomic, assign) UIImageView * IMG_UserSignedUpTop;
	@property (nonatomic, assign) UILabel * L_MonthYear;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Loading;
	-(void) setAI_Loading:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_NextMonth;
	-(void) setB_NextMonth:(UIButton *)p0;
	-(UIButton *) B_PreviousMonth;
	-(void) setB_PreviousMonth:(UIButton *)p0;
	-(UICollectionView *) CV_Grid;
	-(void) setCV_Grid:(UICollectionView *)p0;
	-(UIImageView *) IMG_AllSitesClosed;
	-(void) setIMG_AllSitesClosed:(UIImageView *)p0;
	-(UIImageView *) IMG_FullyStaffed;
	-(void) setIMG_FullyStaffed:(UIImageView *)p0;
	-(UIImageView *) IMG_StaffingNeeded;
	-(void) setIMG_StaffingNeeded:(UIImageView *)p0;
	-(UIImageView *) IMG_UserSignedUpBase;
	-(void) setIMG_UserSignedUpBase:(UIImageView *)p0;
	-(UIImageView *) IMG_UserSignedUpTop;
	-(void) setIMG_UserSignedUpTop:(UIImageView *)p0;
	-(UILabel *) L_MonthYear;
	-(void) setL_MonthYear:(UILabel *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitavol_VC_SitesOnDateList_C_TableSourceSitesOnDateList : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_SitesOnDateList : UIViewController {
}
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_ShowOnMap;
	@property (nonatomic, assign) UILabel * L_Date;
	@property (nonatomic, assign) UITableView * TV_Sites;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_ShowOnMap;
	-(void) setB_ShowOnMap:(UIButton *)p0;
	-(UILabel *) L_Date;
	-(void) setL_Date:(UILabel *)p0;
	-(UITableView *) TV_Sites;
	-(void) setTV_Sites:(UITableView *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_SitesOnDateMap : UIViewController {
}
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_ShowAsList;
	@property (nonatomic, assign) UILabel * L_Date;
	@property (nonatomic, assign) MKMapView * Map_Sites;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_ShowAsList;
	-(void) setB_ShowAsList:(UIButton *)p0;
	-(UILabel *) L_Date;
	-(void) setL_Date:(UILabel *)p0;
	-(MKMapView *) Map_Sites;
	-(void) setMap_Sites:(MKMapView *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitavol_VC_SignUp_C_SignUpTableSourceSignUp : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_SignUp : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_GetDirections;
	@property (nonatomic, assign) UIButton * B_SignMeUp;
	@property (nonatomic, assign) UILabel * L_Address;
	@property (nonatomic, assign) UILabel * L_CityStateZip;
	@property (nonatomic, assign) UILabel * L_DateAndTime;
	@property (nonatomic, assign) UILabel * L_Site;
	@property (nonatomic, assign) UITableView * TV_Users;
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
	-(UIButton *) B_SignMeUp;
	-(void) setB_SignMeUp:(UIButton *)p0;
	-(UILabel *) L_Address;
	-(void) setL_Address:(UILabel *)p0;
	-(UILabel *) L_CityStateZip;
	-(void) setL_CityStateZip:(UILabel *)p0;
	-(UILabel *) L_DateAndTime;
	-(void) setL_DateAndTime:(UILabel *)p0;
	-(UILabel *) L_Site;
	-(void) setL_Site:(UILabel *)p0;
	-(UITableView *) TV_Users;
	-(void) setTV_Users:(UITableView *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitavol_VC_SCSites_C_SitesTableSourceSCSites : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_SCSites : UIViewController {
}
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UITableView * TV_Sites;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UITableView *) TV_Sites;
	-(void) setTV_Sites:(UITableView *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_SCSite : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Accepting;
	@property (nonatomic, assign) UIButton * B_AtLimit;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_Closed;
	@property (nonatomic, assign) UIButton * B_NearLimit;
	@property (nonatomic, assign) UIButton * B_SiteCalendar;
	@property (nonatomic, assign) UIButton * B_Volunteers;
	@property (nonatomic, assign) UIImageView * IMG_Accepting;
	@property (nonatomic, assign) UIImageView * IMG_AtLimit;
	@property (nonatomic, assign) UIImageView * IMG_Closed;
	@property (nonatomic, assign) UIImageView * IMG_Currently;
	@property (nonatomic, assign) UIImageView * IMG_NearLimit;
	@property (nonatomic, assign) UILabel * L_ClientStatus;
	@property (nonatomic, assign) UILabel * L_SiteName;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Accepting;
	-(void) setB_Accepting:(UIButton *)p0;
	-(UIButton *) B_AtLimit;
	-(void) setB_AtLimit:(UIButton *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_Closed;
	-(void) setB_Closed:(UIButton *)p0;
	-(UIButton *) B_NearLimit;
	-(void) setB_NearLimit:(UIButton *)p0;
	-(UIButton *) B_SiteCalendar;
	-(void) setB_SiteCalendar:(UIButton *)p0;
	-(UIButton *) B_Volunteers;
	-(void) setB_Volunteers:(UIButton *)p0;
	-(UIImageView *) IMG_Accepting;
	-(void) setIMG_Accepting:(UIImageView *)p0;
	-(UIImageView *) IMG_AtLimit;
	-(void) setIMG_AtLimit:(UIImageView *)p0;
	-(UIImageView *) IMG_Closed;
	-(void) setIMG_Closed:(UIImageView *)p0;
	-(UIImageView *) IMG_Currently;
	-(void) setIMG_Currently:(UIImageView *)p0;
	-(UIImageView *) IMG_NearLimit;
	-(void) setIMG_NearLimit:(UIImageView *)p0;
	-(UILabel *) L_ClientStatus;
	-(void) setL_ClientStatus:(UILabel *)p0;
	-(UILabel *) L_SiteName;
	-(void) setL_SiteName:(UILabel *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitavol_VC_SCVolunteers_C_WorkItemsTableSourceSCVolunteers : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) tableView:(UITableView *)p0 numberOfRowsInSection:(NSInteger)p1;
	-(UITableViewCell *) tableView:(UITableView *)p0 cellForRowAtIndexPath:(NSIndexPath *)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface VC_SCVolunteers : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_ApproveHours;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UILabel * L_SiteName;
	@property (nonatomic, assign) UILabel * L_Volunteers;
	@property (nonatomic, assign) UITextField * TB_Date;
	@property (nonatomic, assign) UITableView * TV_Volunteers;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_ApproveHours;
	-(void) setB_ApproveHours:(UIButton *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UILabel *) L_SiteName;
	-(void) setL_SiteName:(UILabel *)p0;
	-(UILabel *) L_Volunteers;
	-(void) setL_Volunteers:(UILabel *)p0;
	-(UITextField *) TB_Date;
	-(void) setTB_Date:(UITextField *)p0;
	-(UITableView *) TV_Volunteers;
	-(void) setTV_Volunteers:(UITableView *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitavol_VC_SCSiteOnDate_EFilerPickerViewModel : NSObject<UIPickerViewModel> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)p0;
	-(NSInteger) pickerView:(UIPickerView *)p0 numberOfRowsInComponent:(NSInteger)p1;
	-(NSString *) pickerView:(UIPickerView *)p0 titleForRow:(NSInteger)p1 forComponent:(NSInteger)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface VC_SCSiteOnDate : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_RestoreDefaults;
	@property (nonatomic, assign) UIButton * B_SaveCalendarException;
	@property (nonatomic, assign) UILabel * L_Date;
	@property (nonatomic, assign) UILabel * L_DefaultCloseTime;
	@property (nonatomic, assign) UILabel * L_DefaultEFilers;
	@property (nonatomic, assign) UILabel * L_DefaultOpenTime;
	@property (nonatomic, assign) UILabel * L_SiteName;
	@property (nonatomic, assign) UISwitch * SW_IsOpen;
	@property (nonatomic, assign) UITextField * TB_CloseTime;
	@property (nonatomic, assign) UITextField * TB_NumEFilers;
	@property (nonatomic, assign) UITextField * TB_OpenTime;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_RestoreDefaults;
	-(void) setB_RestoreDefaults:(UIButton *)p0;
	-(UIButton *) B_SaveCalendarException;
	-(void) setB_SaveCalendarException:(UIButton *)p0;
	-(UILabel *) L_Date;
	-(void) setL_Date:(UILabel *)p0;
	-(UILabel *) L_DefaultCloseTime;
	-(void) setL_DefaultCloseTime:(UILabel *)p0;
	-(UILabel *) L_DefaultEFilers;
	-(void) setL_DefaultEFilers:(UILabel *)p0;
	-(UILabel *) L_DefaultOpenTime;
	-(void) setL_DefaultOpenTime:(UILabel *)p0;
	-(UILabel *) L_SiteName;
	-(void) setL_SiteName:(UILabel *)p0;
	-(UISwitch *) SW_IsOpen;
	-(void) setSW_IsOpen:(UISwitch *)p0;
	-(UITextField *) TB_CloseTime;
	-(void) setTB_CloseTime:(UITextField *)p0;
	-(UITextField *) TB_NumEFilers;
	-(void) setTB_NumEFilers:(UITextField *)p0;
	-(UITextField *) TB_OpenTime;
	-(void) setTB_OpenTime:(UITextField *)p0;
	-(void) viewDidLoad;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitavol_VC_SCSiteDefaults_EFilerPickerViewModel : NSObject<UIPickerViewModel> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)p0;
	-(NSInteger) pickerView:(UIPickerView *)p0 numberOfRowsInComponent:(NSInteger)p1;
	-(NSString *) pickerView:(UIPickerView *)p0 titleForRow:(NSInteger)p1 forComponent:(NSInteger)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@interface VC_SCSiteDefaults : UIViewController {
}
	@property (nonatomic, assign) UIActivityIndicatorView * AI_Busy;
	@property (nonatomic, assign) UIButton * B_Back;
	@property (nonatomic, assign) UIButton * B_SaveDefaults;
	@property (nonatomic, assign) UILabel * L_DayOfWeek;
	@property (nonatomic, assign) UILabel * L_SiteName;
	@property (nonatomic, assign) UISwitch * SW_IsOpen;
	@property (nonatomic, assign) UITextField * TB_CloseTime;
	@property (nonatomic, assign) UITextField * TB_EFilers;
	@property (nonatomic, assign) UITextField * TB_OpenTime;
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIActivityIndicatorView *) AI_Busy;
	-(void) setAI_Busy:(UIActivityIndicatorView *)p0;
	-(UIButton *) B_Back;
	-(void) setB_Back:(UIButton *)p0;
	-(UIButton *) B_SaveDefaults;
	-(void) setB_SaveDefaults:(UIButton *)p0;
	-(UILabel *) L_DayOfWeek;
	-(void) setL_DayOfWeek:(UILabel *)p0;
	-(UILabel *) L_SiteName;
	-(void) setL_SiteName:(UILabel *)p0;
	-(UISwitch *) SW_IsOpen;
	-(void) setSW_IsOpen:(UISwitch *)p0;
	-(UITextField *) TB_CloseTime;
	-(void) setTB_CloseTime:(UITextField *)p0;
	-(UITextField *) TB_EFilers;
	-(void) setTB_EFilers:(UITextField *)p0;
	-(UITextField *) TB_OpenTime;
	-(void) setTB_OpenTime:(UITextField *)p0;
	-(void) viewDidLoad;
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

@interface vitavol_C_CVHelper : NSObject<UICollectionViewDelegateFlowLayout, UICollectionViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(CGSize) collectionView:(UICollectionView *)p0 layout:(UICollectionViewLayout *)p1 sizeForItemAtIndexPath:(NSIndexPath *)p2;
	-(BOOL) collectionView:(UICollectionView *)p0 shouldSelectItemAtIndexPath:(NSIndexPath *)p1;
	-(void) collectionView:(UICollectionView *)p0 didHighlightItemAtIndexPath:(NSIndexPath *)p1;
	-(void) collectionView:(UICollectionView *)p0 didUnhighlightItemAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitavol_VC_Suggestions_C_SuggestionsTableDelegate : NSObject<UITableViewDelegate, UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSArray *) tableView:(UITableView *)p0 editActionsForRowAtIndexPath:(NSIndexPath *)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitavol_VC_MySignUps_C_MySignUpsTableDelegateWorkIntents : NSObject<UITableViewDelegate, UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(NSArray *) tableView:(UITableView *)p0 editActionsForRowAtIndexPath:(NSIndexPath *)p1;
	-(void) tableView:(UITableView *)p0 didSelectRowAtIndexPath:(NSIndexPath *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface vitavol_VC_SitesOnDateMap_C_MapDelegateX : NSObject<MKMapViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(MKAnnotationView *) mapView:(MKMapView *)p0 viewForAnnotation:(id)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@interface Xamarin_Forms_Platform_iOS_VisualElementRenderer_1 : UIView {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIColor *) backgroundColor;
	-(void) setBackgroundColor:(UIColor *)p0;
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

@interface Xamarin_Forms_Platform_iOS_EditorRenderer : Xamarin_Forms_Platform_iOS_ViewRenderer_2 {
}
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
	-(id) init;
@end

@interface Xamarin_Forms_Platform_iOS_SliderRenderer : Xamarin_Forms_Platform_iOS_ViewRenderer_2 {
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

@interface Xamarin_Forms_Platform_iOS_FormsApplicationDelegate : NSObject<UIApplicationDelegate> {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
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

@interface UIKit_UIView_UIViewAppearance : NSObject {
}
	-(void) release;
	-(id) retain;
	-(int) xamarinGetGCHandle;
	-(void) xamarinSetGCHandle: (int) gchandle;
	-(UIColor *) tintColor;
	-(BOOL) conformsToProtocol:(void *)p0;
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

@interface __UIGestureRecognizerParametrizedToken : __UIGestureRecognizerToken {
}
	-(void) target:(UIGestureRecognizer *)p0;
@end

@interface UIKit_UINavigationBar_UINavigationBarAppearance : UIKit_UIView_UIViewAppearance {
}
	-(UIColor *) barTintColor;
	-(NSDictionary *) titleTextAttributes;
@end


