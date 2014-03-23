platform :ios, '7.0'

def import_pods
	pod "AFNetworking"
	pod 'JLTMDbClient', "~> 0.1"
end

import_pods

target :JLTMDbClientTests, :exclusive => true do
  pod 'Kiwi/XCTest'
  import_pods
end