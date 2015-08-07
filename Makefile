TESTS = tests/test.js
REPORTER = spec

all:

test: test-node test-browser \
	test-embed-api-node test-embed-api-browser \
	test-named-graph-framing-node test-named-graph-framing-browser

test-node:
	@NODE_ENV=test ./node_modules/.bin/mocha -A -R $(REPORTER) $(TESTS)

test-browser:
	@NODE_ENV=test ./node_modules/.bin/phantomjs $(TESTS)

test-embed-api-node:
	@NODE_ENV=test JSONLD_TEST_SUITE=./tests/new-embed-api ./node_modules/.bin/mocha -A -R $(REPORTER) $(TESTS);

test-embed-api-browser:
	@NODE_ENV=test JSONLD_TEST_SUITE=./tests/new-embed-api ./node_modules/.bin/phantomjs $(TESTS)

test-named-graph-framing-node:
	@NODE_ENV=test JSONLD_TEST_SUITE=./tests/named-graph-framing ./node_modules/.bin/mocha -A -R $(REPORTER) $(TESTS);

test-named-graph-framing-browser:
	@NODE_ENV=test JSONLD_TEST_SUITE=./tests/named-graph-framing ./node_modules/.bin/phantomjs $(TESTS)

test-coverage:
	./node_modules/.bin/istanbul cover ./node_modules/.bin/_mocha -- \
		-u exports -R $(REPORTER) $(TESTS)

clean:
	rm -rf coverage

.PHONY: test test-node test-browser \
	test-embed-api-node test-embed-api-browser \
	test-named-graph-framing-node test-named-graph-framing-browser \
	test-coverage clean
