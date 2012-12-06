AppQuiz
=======
## How to run:

Use Sinatra:

```
$ gem install sinatra
$ ruby myapp.rb
```
and sqlite.

## What about:

1.1 A Fibonacci endpoint that accepts a number and returns the Fibonacci calculation for that number, and returns result in JSON format.

Example:

    $ curl -s 'http://127.0.0.1:4567/fib/12'
    {"response": 144}


1.2 An endpoint that fetches the Google homepage and returns the sha1 of the response message-body (HTTP body data).

Example:

    $ curl -s 'http://127.0.0.1:4567/google-body'
    {"response": "272cca559ffe719d20ac90adb9fc4e5716479e96"}


1.3 Using some external storage of your choice (can be redis, memcache, sqlite, mysql, etc), provide a means to store and then retrieve a value.

Example:

    $ curl -d 'value=something' 'http://127.0.0.1:4567/store'
    $ curl 'http://127.0.0.1:8080/store'
    {"response": "something"}