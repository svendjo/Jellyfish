package ${package}.resources;

import ${package}.EchoechoApiService;
import ${package}.NotFoundException;
import io.swagger.model.EchoRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.ws.rs.core.Response;
import javax.ws.rs.core.SecurityContext;

/**
 * Created by svend on 7/19/17.
 */
public class EchoResource extends EchoechoApiService {

    private static final Logger LOGGER = LoggerFactory.getLogger(EchoResource.class);

    @Override
    public Response echoGet(EchoRequest messageRequest, SecurityContext securityContext) throws NotFoundException {
        LOGGER.warn("echo");
        return null;
    }
}
