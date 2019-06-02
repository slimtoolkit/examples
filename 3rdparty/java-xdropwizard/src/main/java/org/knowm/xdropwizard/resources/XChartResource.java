package org.knowm.xdropwizard.resources;

import java.io.IOException;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;
import org.knowm.xchart.BitmapEncoder;
import org.knowm.xchart.BitmapEncoder.BitmapFormat;
import org.knowm.xchart.QuickChart;
import org.knowm.xchart.XYChart;

/** @author timmolter */
@Path("xchart")
public class XChartResource {

  @GET
  @Path("random.png")
  @Produces("image/png")
  public Response getRandomLineChart() throws IOException {

    XYChart chart =
        QuickChart.getChart(
            "XChart Sample - Random Walk", "X", "Y", null, null, getRandomWalk(105));

    return Response.ok()
        .type("image/png")
        .entity(BitmapEncoder.getBitmapBytes(chart, BitmapFormat.PNG))
        .build();
  }

  private double[] getRandomWalk(int numPoints) {

    double[] y = new double[numPoints];
    for (int i = 1; i < y.length; i++) {
      y[i] = y[i - 1] + Math.random() - .5;
    }
    return y;
  }
}
