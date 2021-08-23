# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

workspace 'TestSignalBox.xcworkspace'
project 'TestSignalBox.xcodeproj'
project 'ModuleA/ModuleA.xcodeproj'
project 'ModuleB/ModuleB.xcodeproj'

use_frameworks!

target 'TestSignalBox' do
  project 'TestSignalBox.xcodeproj'
  pod 'SignalBox', :path => '../SignalBox/'
end

target 'ModuleA' do
  project 'ModuleA/ModuleA.xcodeproj'
  pod 'SignalBox', :path => '../SignalBox/'
end

target 'ModuleB' do
  project 'ModuleB/ModuleB.xcodeproj'
  pod 'SignalBox', :path => '../SignalBox/'
end
