platform :ios, '7.0'

def import_pods
	pod 'AFNetworking'
	pod 'JLTMDbClient'
end

import_pods

target :JLTMDbClientTests, :exclusive => true do
  pod 'Kiwi/XCTest'
  import_pods
end