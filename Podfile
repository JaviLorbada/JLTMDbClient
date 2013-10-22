platform :ios, '7.0'

def import_pods
	pod "AFNetworking", "~> 2.0.0"
	pod 'JLTMDbClient', "~> 0.1.0"
end

import_pods

target :JLTMDbClientTests, :exclusive => true do
  pod 'Kiwi/XCTest'
  import_pods
end