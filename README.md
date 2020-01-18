= Iataguessr = 

Guess IATA airport codes. Web app in Sinatra and Vue.

== Install ==

```
(sudo) gem install sinatra
ruby src/server/app.rb
```

*localhost:4567* to see the app.


* `src/server`: Sinatra server, data from `./data` (CSV source https://ourairports.com/data/)
* `src/client` & `src/server/views`: VueJS based front-end
