# Logview

A script for reading a webserver log and outputting the results, sorted by most page views first. 

* Receives a log as argument (webserver.log is provided)
* Returns the following:

list of webpages with most page views ordered from most pages views to less page views e.g.:
/home 90 visits /index 80 visits etc... > list of webpages with most unique page views also ordered

## Example output:
```
/help_page/1 has been visited 5 times
/home has been visited 3 times
/contact has been visited 2 times
/about/2 has been visited 1 time
/index has been visited 1 time
/about has been visited 1 time
```

## Usage
Install the latest version of Ruby. Then in the command line `cd` to the directory and run:
```
ruby log_view.rb path/to/file
```

## Tests
To run the tests, `cd` to the `tests` directory and run:
```
ruby log_view_test.rb
```
