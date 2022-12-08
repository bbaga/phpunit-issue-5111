# phpunit-issue-5111
Example for https://github.com/sebastianbergmann/phpunit/issues/5111

## Executing with PHPUnit 9.5.24
### Command
```shell
PHPUNIT_VERSION=9.5.24 docker-compose run --rm install && docker-compose run --rm test
```
### Expected output
```text
PHPUnit 9.5.24 #StandWithUkraine

Runtime:       PHP 7.4.33
Configuration: /usr/src/myapp/phpunit.xml

.                                                                   1 / 1 (100%)

Time: 00:00.117, Memory: 6.00 MB

OK (1 test, 1 assertion)
```

## Executing with PHPUnit 9.5.25
### Command
```shell
PHPUNIT_VERSION=9.5.25 docker-compose run --rm install && docker-compose run --rm test
```
### Expected output
```text
PHPUnit 9.5.25 #StandWithUkraine

Runtime:       PHP 7.4.33
Configuration: /usr/src/myapp/phpunit.xml

E                                                                   1 / 1 (100%)

Time: 00:00.084, Memory: 6.00 MB

There was 1 error:

1) Tests\AerospikeTest::test
TypeError: Argument 1 passed to SebastianBergmann\Type\Parameter::__construct() must be of the type string, null given, called in /usr/src/myapp/vendor/sebastian/type/src/ReflectionMapper.php on line 35

/usr/src/myapp/tests/AerospikeTest.php:15
phpvfscomposer:///usr/src/myapp/vendor/phpunit/phpunit/phpunit:97

ERRORS!
Tests: 1, Assertions: 0, Errors: 1.
ERROR: 2

```
