package kg.attractor.filehub.service.interfaces;

import kg.attractor.filehub.dto.FileCategoryDto;

import java.util.List;

public interface FileCategoryService {
    List<FileCategoryDto> getAll();

    FileCategoryDto getCategoryById(Long categoryId);
}
