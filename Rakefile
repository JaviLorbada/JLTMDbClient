namespace :test do
  desc "Run the JLTMDbClient Tests"
  task :all do
    system("xcodebuild clean -target JLTMDbClientTests")
    $success = system("xctool -workspace JLTMDbClient.xcworkspace -scheme JLTMDbClientTests -sdk iphonesimulator test -test-sdk iphonesimulator")
    # $success = system("xcodebuild test -workspace JLTMDbClient.xcworkspace -scheme JLTMDbClientTests -sdk iphonesimulator")
  end
end

task :test => ['test:all'] do
  if $success
    puts "\033[0;32m** All tests executed successfully"
  else
    puts "\033[0;31m! Tests failed"
    exit(-1)
  end
end

task :default => 'test'
