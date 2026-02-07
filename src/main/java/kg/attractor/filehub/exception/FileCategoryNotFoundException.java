package kg.attractor.filehub.exception;

import java.util.NoSuchElementException;

public class FileCategoryNotFoundException extends NoSuchElementException {
    public FileCategoryNotFoundException(String message) {
        super(message);
    }
}
