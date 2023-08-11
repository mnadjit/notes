# curl
- verbose
	- `curl $url -v`
- http method
	- `curl -X $method`
- skip certificate check
	- `curl $url -k`
- output to file
	- `curl $url -o $out_file_path`

# wget
- skip certificate check
	- `wget $url --no-check-certificate` 
- output to file
	- `wget $url -o $out_file_path`
