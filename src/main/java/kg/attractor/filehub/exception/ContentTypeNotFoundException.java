package kg.attractor.filehub.exception;

import java.util.NoSuchElementException;

public class ContentTypeNotFoundException extends NoSuchElementException {
    public ContentTypeNotFoundException(String message) {
        super(message);
    }
}
