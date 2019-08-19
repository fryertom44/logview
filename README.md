# Logview

A script for reading a webserver log and outputting the results, sorted by most page views first. 

* Receives a log as argument (webserver.log is provided) e.g.: ./parser.rb webserver.log
* Returns the following:

list of webpages with most page views ordered from most pages views to less page views e.g.:
/home 90 visits /index 80 visits etc... > list of webpages with most unique page views also ordered
e.g.:
/about/2 8 unique views /index 5 unique views etc...

## Usage
Install the latest version of Ruby. Then in the command line `cd` to the directory and run:
```
ruby -r "./log_view.rb" -e "LogView.print path/to/file"
```

## Tests
To run the tests, `cd` to the `tests` directory and run:
```
ruby log_view_test.rb
``
