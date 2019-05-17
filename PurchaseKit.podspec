Pod::Spec.new do |s|
  s.name             = 'PurchaseKit'
  s.version          = '1.0.0'
  s.summary          = 'PurchaseKit'
  s.homepage         = 'https://github.com/efremidze/PurchaseKit'
  s.author           = { 'efremidze' => 'efremidzel@hotmail.com' }
  s.source           = { :git => 'https://github.com/efremidze/PurchaseKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  s.source_files = 'PurchaseKit/*.swift'
  s.dependency 'SwiftyStoreKit'
end
