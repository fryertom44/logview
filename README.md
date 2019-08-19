# Logview

A script for reading a webserver log and outputting the results, sorted by most page views first. 

* Receives a log as argument (webserver.log is provided)
* Returns the following:
 - list of webpages with most page views ordered from most pages views to less page views e.g./home 90 visits /index 80 visits etc...
 - list of webpages with most unique page views (also ordered as above)

## Example output:
```
"/about/2 has been visited 90 times"
"/contact has been visited 89 times"
"/index has been visited 82 times"
"/about has been visited 81 times"
"/help_page/1 has been visited 80 times"
"/home has been visited 78 times"
"/help_page/1 has had 23 unique visits"
"/contact has had 23 unique visits"
"/home has had 23 unique visits"
"/about/2 has had 22 unique visits"
"/index has had 23 unique visits"
"/about has had 21 unique visits"
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
