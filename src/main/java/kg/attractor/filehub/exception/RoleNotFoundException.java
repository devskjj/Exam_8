package kg.attractor.filehub.exception;

import java.util.NoSuchElementException;

public class RoleNotFoundException extends NoSuchElementException {
    public RoleNotFoundException(String message) {
        super(message);
    }
}
