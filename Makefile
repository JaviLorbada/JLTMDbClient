###### Project specific ######

PROJECT_NAME=JLTMDbClient
TESTS=Tests
WORKSPACE=$(PROJECT_NAME).xcworkspace
DEFAULT_SCHEME=$(PROJECT_NAME)
TEST_SCHEME=$(PROJECT_NAME)$(TESTS)
DEFAULT_FLAGS=-sdk iphonesimulator
TESTING_TOOL=xcodebuild
BUILD_TOOL=ipa

DEFAULT_TASK=$(TESTING_TOOL) -workspace $(WORKSPACE) -scheme $(TEST_SCHEME) $(DEFAULT_FLAGS)

###### Colors #######

RED=\x1b[31;01m
GRAY=\033[0;37m
NORMAL=\033[0m

###### Make options ######

all:
	@echo
	@echo "  $(PROJECT_NAME)$(GRAY) - build tool"
	@echo
	@echo "    $(RED)make$(GRAY) - show this help message"
	@echo "       aliases: make help"
	@echo "    $(RED)make clean$(GRAY) - clean project"
	@echo "    $(RED)make test$(GRAY) - run $(PROJECT_NAME) unit tests"
	@echo "    $(RED)make ci$(GRAY) - run $(PROJECT_NAME) unit tests and output the result pretty"
	@echo "    $(RED)make report_html$(GRAY) - run $(report_html) unit tests and output the resul as html"
	@echo "    $(RED)make report_junit$(GRAY) - run $(report_html) unit tests and output the resul as junit"
	@echo

help: all

clean:
	$(DEFAULT_TASK) clean

test:
	$(DEFAULT_TASK) test | xcpretty -tc

ci:
	$(DEFAULT_TASK) test | xcpretty -c

report_html:
	$(DEFAULT_TASK) test | xcpretty -c --report html

report_junit:
	$(DEFAULT_TASK) test | xcpretty -c --report junit

