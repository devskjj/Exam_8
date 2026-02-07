package kg.attractor.filehub.exception;

import java.util.NoSuchElementException;

public class FileNotFoundException extends NoSuchElementException {
    public FileNotFoundException(String message) {
        super(message);
    }
}
