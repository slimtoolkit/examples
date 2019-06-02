package org.knowm.xdropwizard;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.InvocationCallback;

/**
 * https://dennis-xlc.gitbooks.io/restful-java-with-jax-rs-2-0-2rd-edition/content/en/part1/chapter13/async_invoker_client_api.html
 *
 * @author timmolter
 */
public class AsyncTest {

  public static void main(String[] args) throws InterruptedException, ExecutionException {

    AsyncTest asyncTest = new AsyncTest();
    asyncTest.go();
  }

  private void go() throws InterruptedException, ExecutionException {

    Client client = ClientBuilder.newClient();

    final Future<String> entityFuture =
        client
            .target("http://localhost:9090/service/async")
            .request()
            .async()
            .get(
                new InvocationCallback<String>() {
                  @Override
                  public void completed(String response) {
                    System.out.println("Response entity '" + response + "' received.");
                  }

                  @Override
                  public void failed(Throwable throwable) {
                    System.out.println("Invocation failed.");
                    throwable.printStackTrace();
                  }
                });
    System.out.println(entityFuture.get());
  }
}
