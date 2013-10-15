platform :ios, '7.0'

def import_pods
	pod "AFNetworking", "~> 2.0.0"
	pod 'JLTMDbClient', :path => 'JLTMDbClient.podspec'
end

import_pods

target :JLTMDbClientTests, :exclusive => true do
  pod 'Kiwi/XCTest'
  import_pods
end