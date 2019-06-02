package org.knowm.xdropwizard.resources;

import java.io.InputStream;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Path("/file")
@Produces(MediaType.APPLICATION_JSON)
public class FileUploadResource {

  private final Logger logger = LoggerFactory.getLogger(FileUploadResource.class);

  @POST
  @Path("/upload")
  @Consumes(MediaType.MULTIPART_FORM_DATA)
  public Response uploadFile(
      @FormDataParam("file") InputStream uploadedInputStream,
      @FormDataParam("file") FormDataContentDisposition fileDetail) {

    String fileName = fileDetail.getFileName();

    String output = "File received : " + fileName;

    logger.info(output);

    return Response.status(200).entity(output).build();
  }
}
