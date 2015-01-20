using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestSharp;

namespace WebApplication1
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var client = new RestClient();
            client.BaseUrl = "http://rest.host.com";
            var consumerKey = "xxxx";
            var consumerSecret = "xxxx";
            var oauth_token = "xxxx";
            var oauth_token_secret = "xxxx";
            client.Authenticator = RestSharp.Authenticators.OAuth1Authenticator.ForProtectedResource(consumerKey, consumerSecret, oauth_token, oauth_token_secret);
            var request = new RestRequest("sites", Method.GET);

            IRestResponse response = client.Execute(request);

            System.Diagnostics.Debug.WriteLine(response.Content);

            request = new RestRequest("sites", Method.POST);
            request.RequestFormat = DataFormat.Json;
            request.AddBody(new { brandRef = 1, B = "bar" });

            response = client.Execute(request);

            System.Diagnostics.Debug.WriteLine(response.Content);
        }
    }
}
