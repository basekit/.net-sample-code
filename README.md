BaseKit .NET Sample Code
========================


Sample .NET client code for BaseKit's REST API. It
illustrates how to sign an API request successfully in .NET. It's intended as a
point of reference for integrating .NET systems with our API.

Usage
-----

```net
  var client = new RestClient();
  client.BaseUrl = "http://rest.host.com";
  var consumerKey = "xxxx";
  var consumerSecret = "xxxx";
  var oauth_token = "xxxx";
  var oauth_token_secret = "xxxx";
  client.Authenticator = RestSharp.Authenticators.OAuth1Authenticator.ForProtectedResource(consumerKey, consumerSecret, oauth_token, oauth_token_secret);
  
  var request = new RestRequest("sites", Method.POST);
  request.RequestFormat = DataFormat.Json;
  request.AddBody(new { brandRef = 1, B = "bar" });
  response = client.Execute(request);
```


License
-------

This code is released under the [MIT License].

[MIT License]: http://www.opensource.org/licenses/MIT
