package kg.attractor.filehub.service.error;

import kg.attractor.filehub.error.CustomErrorResponse;
import org.springframework.validation.BindingResult;

public interface ErrorService {
    CustomErrorResponse makeErrorResponse(Exception e);

    CustomErrorResponse makeErrorResponse(BindingResult bindingResult);
}
