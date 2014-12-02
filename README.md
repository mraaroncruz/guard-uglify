## What?
Guard wrapper for the [Uglifier](https://github.com/lautis/uglifier/blob/master/README.md) gem.

# Installation
Add to your `Gemfile`:
```ruby
gem 'guard-uglify'
```

Or install the gem manually:
```bash
$ gem install guard-uglify
```

Then add the default Guard::Uglify template to your `Guardfile` by running:
```bash
$ guard init uglify
```

Which will add this to your Guardfile:
```ruby
###
# Sample Guardfile block for Guard::Uglify
#
# :input        - input file to compress
# :output       - file to write compressed output to
# :run_at_start - compressed input file when guard starts
# :uglifier     - options to be passed to the uglifier gem
###
guard "uglify", :input => "app/assets/javascripts/application.js", :output => "public/javascripts/application.js"
```

## Usage
Adjust the paths, and set the options to your liking. The `:uglifier` option contains options that will be passed to the Uglifier gem, which you can find [here](https://github.com/lautis/uglifier/blob/master/README.md). When run, the input file will be compressed and then written to the output file. If you are using this with my `guard-sprocketize` gem, place the above guard block after the sprockets block in your `Guardfile`.

The default configuration should work for a Rails 3 project with a directory structure like this:
```
|-- app
|   |-- controllers
|   |-- assets
|   |   |-- sass
|   |   `-- javascripts
|   |       `-- application.js # Your source javascript file
|   |-- helpers
|   |-- mailers
|   |-- models
|   `-- views
|       `-- layouts
|-- config
|   |-- environments
|   |-- initializers
|   `-- locales
|-- db
|-- doc
|-- lib
|   `-- tasks
...
|-- public
    `-- javascripts
        `-- application.js # Compressed output file
... etc.
```

## TODO
* Write better tests

## License
(The MIT License)

Copyright (c) 2011 Aaron Cruz

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
