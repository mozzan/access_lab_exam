# Access Backend Exercise

## 1. Build an Raise Limit Server to serve the incoming requests

### API 
localhost:3000/test_limit

### API Doc
https://github.com/mozzan/access_lab_exam/wiki/API-Doc--%E3%84%A7-IP-limit

### Rspec Test
bundle exec rspec ./spec/controllers/sessions_controller_spec.rb 

### Note
The ip limit function is accomplished by using Redis server, therefore need to install redis if wanna run the code.


## 2. Build an Voting Server to determine an issue about Wuhan coronavirus

### API 
1. localhost:3000/vote_results  (POST)
2. localhost:3000/vote_results  (GET)

### API Doc
https://github.com/mozzan/access_lab_exam/wiki/API-Doc-%E3%84%A7-Voting-Server

### Rspec Test
bundle exec rspec ./spec/controllers/vote_results_controller_spec.rb 

### Sample Date
bundle exec rake dev:sample

### Note
Anyone wanna vote need to get a token first. And the token only can be used one time.
