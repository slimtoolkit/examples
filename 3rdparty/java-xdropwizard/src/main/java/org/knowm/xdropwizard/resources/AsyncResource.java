package org.knowm.xdropwizard.resources;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.container.AsyncResponse;
import javax.ws.rs.container.CompletionCallback;
import javax.ws.rs.container.Suspended;

/** @author timmolter */
@Path("/async")
public class AsyncResource {

  private static int numberOfSuccessResponses = 0;
  private static int numberOfFailures = 0;
  private static Throwable lastException = null;

  @GET
  public void asyncGetWithTimeout(@Suspended final AsyncResponse asyncResponse) {
    asyncResponse.register(
        new CompletionCallback() {
          @Override
          public void onComplete(Throwable throwable) {
            if (throwable == null) {
              // no throwable - the processing ended successfully
              // (response already written to the client)
              numberOfSuccessResponses++;
            } else {
              numberOfFailures++;
              lastException = throwable;
            }
          }
        });
    new Thread(
            new Runnable() {
              @Override
              public void run() {
                String result = veryExpensiveOperation();
                asyncResponse.resume(result);
              }

              private String veryExpensiveOperation() {
                // ... very expensive operation
                try {
                  Thread.sleep(5000);
                } catch (InterruptedException e) {
                  e.printStackTrace();
                }
                return "Hello Async!";
              }
            })
        .start();
  }
}
