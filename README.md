## minitest-apidoc

This library allows you to generate API documentation for your Rack-based application from Minitest specs.

It depends on [Minitest](https://github.com/seattlerb/minitest) (version 5) and [Rack::Test](https://github.com/brynary/rack-test). If you need to use Minitest 4 (e.g. with Rails 4.0), there is a minitest-4 branch you can use.

See an [example of generated documentation](http://htmlpreview.github.io/?https://github.com/lauri/krack-apidoc-example/blob/master/doc/index.html).

See an [example of what the test code looks like](https://github.com/lauri/krack-apidoc-example/blob/master/spec/albums/index_spec.rb).

See an [entire example application](https://github.com/lauri/krack-apidoc-example).

## Minitest 5.5

Setup

```ruby
require 'minitest/apidoc'
require 'minitest/apidoc_plugin'
MiniTest::Apidoc::Reporter.enable_plugin = true
```

### License
This content is released under the [MIT License](http://opensource.org/licenses/MIT).
