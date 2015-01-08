platform :ios, '7.0'

def import_pods
	pod 'JLTMDbClient', '~> 0.2.0'
end

import_pods

target :JLTMDbClientTests, :exclusive => true do
  pod 'Kiwi'
  import_pods
end