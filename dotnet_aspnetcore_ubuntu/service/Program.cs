using System.Text.Json.Serialization;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

var response = new Response()
{
    Status = "success",
    Message = "Hello World!",
    Stack = "Dotnet CSharp",
    Framework = "aspnet core",
};

app.MapGet("/", () => System.Text.Json.JsonSerializer.Serialize(response));

app.Run("http://0.0.0.0:1300");


class Response {
    [JsonPropertyName("status")]
    public string Status {get;set;}
    [JsonPropertyName("message")]
    public string Message {get;set;}
    [JsonPropertyName("stack")]
    public string Stack {get;set;}
    [JsonPropertyName("framework")]
    public string Framework {get;set;}
}

