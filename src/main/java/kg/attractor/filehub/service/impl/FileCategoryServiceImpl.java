package kg.attractor.filehub.service.impl;

import kg.attractor.filehub.dto.FileCategoryDto;
import kg.attractor.filehub.entity.FileCategory;
import kg.attractor.filehub.exception.FileCategoryNotFoundException;
import kg.attractor.filehub.mapper.FileCategoryMapper;
import kg.attractor.filehub.repository.FileCategoryRepository;
import kg.attractor.filehub.service.interfaces.FileCategoryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class FileCategoryServiceImpl implements FileCategoryService {
    private final FileCategoryRepository fileCategoryRepository;
    private final FileCategoryMapper fileCategoryMapper;

    @Override
    public List<FileCategoryDto> getAll() {
        List<FileCategoryDto> categories = fileCategoryRepository.findAll().stream().map(fileCategoryMapper::toDto).toList();
        if (categories.isEmpty()) {
            throw new FileCategoryNotFoundException("Categories not found");
        }
        log.info("List of categories: {}", categories.size());
        return categories;
    }

    @Override
    public FileCategoryDto getCategoryById(Long categoryId) {
        FileCategory fileCategory = fileCategoryRepository.findById(categoryId).orElseThrow(() ->
                new FileCategoryNotFoundException("Category with ID " + categoryId + " not found"));
        log.info("Get file category by ID: {}", categoryId);
        return fileCategoryMapper.toDto(fileCategory);
    }
}
