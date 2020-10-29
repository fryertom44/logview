# Logview

A script for reading a webserver log and outputting the results, sorted by most page views first. 

* Receives a log as argument (webserver.log is provided)
* returns list of webpages with most page views ordered from most pages views to less page views e.g./home 90 visits /index 80 visits etc...
* also returns list of webpages with most unique page views (also ordered as above)
* average page views = total page / unique page views for each page

## Example output:
```
+--------------+----------+
| Page         | Visits   |
+--------------+----------+
| /about/2     | 90       |
| /contact     | 89       |
| /index       | 82       |
| /about       | 81       |
| /help_page/1 | 80       |
| /home        | 78       |
+--------------+----------+
+--------------+---------------+
| Page         | Unique Visits |
+--------------+---------------+
| /help_page/1 | 23            |
| /contact     | 23            |
| /home        | 23            |
| /index       | 23            |
| /about/2     | 22            |
| /about       | 21            |
+--------------+---------------+
```

## Usage
Install the latest version of Ruby. Then in the command line `cd` to the directory and run:
```
ruby log_view.rb path/to/file
```

## Tests
To run the tests, `cd` to the `test` directory and run:
```
ruby log_view_test.rb
```
