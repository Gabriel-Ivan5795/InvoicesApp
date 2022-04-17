# Uncomment the next line to define a global platform for your project

workspace 'Invoices.xcworkspace'

inhibit_all_warnings!
use_frameworks!

def common_pods

   pod 'LoadingDialog'
   pod 'Alamofire', '~> 5.0.0-rc.3' 
   pod 'SVProgressHUD'
   pod 'SwiftKeychainWrapper', '~> 3.4'
   pod 'AES256Swift'

end

def firebase_pods

  pod 'Firebase/Analytics'
  pod 'Firebase/Crashlytics'

  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'

end

def socials_pods
  pod 'GoogleSignIn'
  pod 'FBSDKCoreKit'
  pod 'FBSDKLoginKit'	
end

target 'InvoicesApp' do
 
  common_pods
  firebase_pods
  socials_pods

end

### assign application name and all used modules
modules = ['InvoicesHelpers']

### load modules
modules.each do |moduleName|
      target moduleName do
        project moduleName + '/' + moduleName
        common_pods
        if moduleName != 'InvoicesHelpers'
            firebase_pods
        end
      end
end
