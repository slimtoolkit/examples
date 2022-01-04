using System.Text.Json.Serialization;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

var response = new Response()
{
    Status = "success",
    Message = "Hello World!",
    Stack = "Dotnet CSharp",
    StackVersion = System.Runtime.InteropServices.RuntimeInformation.FrameworkDescription,
    Framework = "Aspnet core",
    FrameworkVersion = "6",
    PackageManager = "Nuget",
    BaseImageVersion = "Ubuntu 20.04",
};

app.MapGet("/", () => System.Text.Json.JsonSerializer.Serialize(response));

app.Run("http://0.0.0.0:1300");


class Response
{
    [JsonPropertyName("status")]
    public string Status { get; set; }
    [JsonPropertyName("message")]
    public string Message { get; set; }
    [JsonPropertyName("stack")]
    public string Stack { get; set; }
    [JsonPropertyName("stackversion")]
    public string StackVersion { get; set; }
    [JsonPropertyName("framework")]
    public string Framework { get; set; }
    [JsonPropertyName("frameworkversion")]
    public string FrameworkVersion { get; set; }
    [JsonPropertyName("baseimageversion")]
    public string BaseImageVersion { get; set; }
    [JsonPropertyName("packagemanager")]
    public string PackageManager { get; set; }
}

