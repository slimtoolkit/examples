extern crate actix;
extern crate actix_web;
extern crate bytes;
extern crate env_logger;
extern crate futures;
extern crate serde_json;
#[macro_use]
extern crate serde_derive;
#[macro_use]
extern crate json;
extern crate rustc_version_runtime;
extern crate semver;

use rustc_version_runtime::version;
//use semver::Version;

use actix_web::{
    error, http, middleware, server, App, Error,
    HttpRequest, HttpResponse, Json,
};
//AsyncResponder, HttpMessage

#[derive(Debug, Serialize, Deserialize)]
struct Response {
    status: String,
    message: String,
    stack: String,
    stackversion: String,
    framework: String,
    frameworkversion: String,
    packagemanager: String,
    baseimageversion: String
}

fn on_call(
    req: &HttpRequest,
) -> HttpResponse
{
    let r = Response
    {
        status: "success".to_string(), 
        message: "Hello World!".to_string(),
        stack: "rust".to_string(), 
        framework: "actix".to_string(),
        stackversion: "1.57".to_string(),
        frameworkversion: "0.7".to_string(),
        packagemanager: "Cargo".to_string(),
        baseimageversion: "Debian 11 (bullseye)".to_string()
    };

    HttpResponse::Ok().json(r)
}

fn main() 
{
    ::std::env::set_var("RUST_LOG", "actix_web=info");
    env_logger::init();
    let sys = actix::System::new("rust-service");

    server::new(|| 
    {
        App::new()
            .middleware(middleware::Logger::default())
            .resource("/", |r| r.method(http::Method::GET).f(on_call))
    }).bind("0.0.0.0:1300")
        .unwrap()
        .shutdown_timeout(1)
        .start();

    println!("Started Rust service on port 1300...");
    let _ = sys.run();
}
