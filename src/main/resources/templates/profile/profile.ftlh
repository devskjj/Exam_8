<#import "../layout.ftlh" as main>
<@main.layout pageTitle="Профиль пользователя">
    <div class="mb-4">
        <h1 class="h2 fw-bold text-dark">Профиль пользователя</h1>
        <p class="text-muted">Управление личной информацией и файлами</p>
    </div>

    <div class="row g-4">
        <div class="col-lg-3">
            <div class="card shadow-sm h-100">
                <div class="card-header bg-success text-white text-center py-4">
                    <div class="d-flex justify-content-center mb-3">
                        <div class="rounded-circle bg-white d-flex align-items-center justify-content-center" style="width: 96px; height: 96px;">
                            <i class="fas fa-user text-success fs-1"></i>
                        </div>
                    </div>
                    <h2 class="h5 fw-semibold mb-0">${user.name} ${user.surname!''}</h2>
                </div>

                <div class="card-body">
                    <div class="mb-4">
                        <h3 class="h6 fw-semibold mb-2">Email</h3>
                        <p class="text-muted d-flex align-items-center">
                            <i class="fas fa-envelope text-success me-2"></i>
                            ${user.email}
                        </p>
                    </div>

                </div>
            </div>
        </div>

        <div class="col-lg-9">
            <div class="card shadow-sm">
                <div class="card-header bg-light d-flex justify-content-between align-items-center py-3">
                    <h2 class="h5 fw-semibold text-dark mb-0">Мои загруженные файлы</h2>
                    <a href="/files/upload"
                       class="btn btn-success d-flex align-items-center">
                        <i class="fas fa-upload me-2"></i>
                        Загрузить файл
                    </a>
                </div>

                <div class="card-body bg-light border-bottom">
                    <h3 class="h6 fw-medium text-dark mb-3">Фильтры и сортировка</h3>
                    <form method="get" action="/profile" class="row g-3">
                        <div class="col-md-3">
                            <label for="categoryId" class="form-label small fw-medium">Категория</label>
                            <select id="categoryId" name="categoryId" class="form-select">
                                <option value="">Все категории</option>
                                <#list categories as category>
                                    <option value="${category.id}"
                                            <#if categoryId?? && categoryId == category.id>selected</#if>>${category.name}</option>
                                </#list>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="contentTypeId" class="form-label small fw-medium">Тип файла</label>
                            <select id="contentTypeId" name="contentTypeId" class="form-select">
                                <option value="">Все типы</option>
                                <#list types as type>
                                    <option value="${type.id}"
                                            <#if contentTypeId?? && contentTypeId == type.id>selected</#if>>${type.name}</option>
                                </#list>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <label for="sortBy" class="form-label small fw-medium">Сортировать по</label>
                            <select id="sortBy" name="sortBy" class="form-select">
                                <option value="uploadDate" <#if sortBy?? && sortBy == "uploadDate">selected</#if>>Дате загрузки</option>
                                <option value="name" <#if sortBy?? && sortBy == "name">selected</#if>>Имени файла</option>
                                <option value="size" <#if sortBy?? && sortBy == "size">selected</#if>>Размеру</option>
                                <option value="downloadCount" <#if sortBy?? && sortBy == "downloadCount">selected</#if>>Количеству скачиваний</option>
                                <option value="id" <#if sortBy?? && sortBy == "id">selected</#if>>ID</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <label for="sortDirection" class="form-label small fw-medium">Направление</label>
                            <select id="sortDirection" name="sortDirection" class="form-select">
                                <option value="desc" <#if sortDirection?? && sortDirection == "desc">selected</#if>>По убыванию</option>
                                <option value="asc" <#if sortDirection?? && sortDirection == "asc">selected</#if>>По возрастанию</option>
                            </select>
                        </div>
                        <div class="col-md-2 d-flex align-items-end">
                            <button type="submit" class="btn btn-success w-100">
                                <i class="fas fa-filter me-2"></i> Применить
                            </button>
                        </div>

                        <input type="hidden" name="page" value="1">
                        <input type="hidden" name="size" value="${size}">
                    </form>
                </div>

                <#if files?? && files.content?? && files.content?size gt 0>
                    <div class="table-responsive">
                        <table class="table table-hover mb-0">
                            <thead class="table-light">
                            <tr>
                                <th scope="col" class="text-uppercase small fw-medium">Файл</th>
                                <th scope="col" class="text-uppercase small fw-medium">Категория</th>
                                <th scope="col" class="text-uppercase small fw-medium">Дата загрузки</th>
                                <th scope="col" class="text-uppercase small fw-medium">Размер</th>
                                <th scope="col" class="text-uppercase small fw-medium">Скачиваний</th>
                                <th scope="col" class="text-uppercase small fw-medium">Доступ</th>
                                <th scope="col" class="text-uppercase small fw-medium">Действия</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list files.content as file>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="bg-light rounded d-flex align-items-center justify-content-center me-3" style="width: 48px; height: 48px;">
                                                <#if file.contentType??>
                                                    <i class="fas fa-file text-muted fs-5"></i>
                                                </#if>
                                            </div>
                                            <div>
                                                <div class="fw-medium text-truncate" style="max-width: 200px;">
                                                    ${file.name}
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                            <span class="badge bg-light text-dark">
                                                ${file.fileCategory.name}
                                            </span>
                                    </td>
                                    <td class="text-muted">
                                        <#if file.uploadDate??>
                                            ${file.formattedUploadDate}
                                        <#else>
                                            -
                                        </#if>
                                    </td>
                                    <td class="text-muted">
                                        <#if file.size < 1024>
                                            ${file.size} Б
                                        <#elseif file.size < 1048576>
                                            ${(file.size / 1024)?string("0.##")} КБ
                                        <#elseif file.size < 1073741824>
                                            ${(file.size / 1048576)?string("0.##")} МБ
                                        <#else>
                                            ${(file.size / 1073741824)?string("0.##")} ГБ
                                        </#if>
                                    </td>
                                    <td class="text-muted">
                                        ${file.downloadCount}
                                    </td>
                                    <td>
                                        <#if file.isPublic>
                                            <span class="badge bg-success bg-opacity-10 text-success">
                                                    <i class="fas fa-globe-americas me-1"></i> Публичный
                                                </span>
                                        <#else>
                                            <span class="badge bg-secondary bg-opacity-10 text-secondary">
                                                    <i class="fas fa-lock me-1"></i> Приватный
                                                </span>
                                        </#if>
                                    </td>
                                    <td>
                                        <div class="d-flex gap-2">
                                            <#if file.isPublic == true>
                                                <a href="/files/download/${file.id}"
                                                   class="text-success text-decoration-none" title="Скачать">
                                                    <i class="fas fa-download fs-5"></i>
                                                </a>
                                            <#else>
                                                <a href="/files/request-download?fileId=${file.id}"
                                                   class="text-success text-decoration-none" title="Получить ссылку">
                                                    <i class="fas fa-envelope fs-5"></i>
                                                </a>
                                            </#if>
                                        </div>
                                    </td>
                                </tr>
                            </#list>
                            </tbody>
                        </table>
                    </div>

                    <div class="card-footer bg-white">
                        <div class="d-flex flex-wrap justify-content-between align-items-center">
                            <div class="text-muted small">
                                Страница ${files.number + 1} из ${files.totalPages}
                            </div>

                            <nav>
                                <ul class="pagination pagination-sm mb-0">
                                    <#if files.number gt 0>
                                        <li class="page-item">
                                            <a class="page-link text-muted" href="/profile?page=1<#if size??>&size=${size}</#if><#if categoryId??>&categoryId=${categoryId}</#if><#if contentTypeId??>&contentTypeId=${contentTypeId}</#if><#if sortBy??>&sortBy=${sortBy}</#if><#if sortDirection??>&sortDirection=${sortDirection}</#if>">
                                                <i class="fas fa-angle-double-left"></i>
                                            </a>
                                        </li>
                                    <#else>
                                        <li class="page-item disabled">
                                            <span class="page-link text-muted">
                                                <i class="fas fa-angle-double-left"></i>
                                            </span>
                                        </li>
                                    </#if>

                                    <#if files.number gt 0>
                                        <li class="page-item">
                                            <a class="page-link text-success" href="/profile?page=${files.number}<#if size??>&size=${size}</#if><#if categoryId??>&categoryId=${categoryId}</#if><#if contentTypeId??>&contentTypeId=${contentTypeId}</#if><#if sortBy??>&sortBy=${sortBy}</#if><#if sortDirection??>&sortDirection=${sortDirection}</#if>">
                                                <i class="fas fa-chevron-left"></i>
                                            </a>
                                        </li>
                                    <#else>
                                        <li class="page-item disabled">
                                            <span class="page-link">
                                                <i class="fas fa-chevron-left"></i>
                                            </span>
                                        </li>
                                    </#if>

                                    <#assign startPage = ((files.number - 2) gt 0)?then(files.number - 2, 0)>
                                    <#assign endPage = ((startPage + 4) lt files.totalPages)?then(startPage + 4, files.totalPages - 1)>

                                    <#if startPage gt 0>
                                        <li class="page-item">
                                            <a class="page-link" href="/profile?page=1<#if size??>&size=${size}</#if><#if categoryId??>&categoryId=${categoryId}</#if><#if contentTypeId??>&contentTypeId=${contentTypeId}</#if><#if sortBy??>&sortBy=${sortBy}</#if><#if sortDirection??>&sortDirection=${sortDirection}</#if>">
                                                1
                                            </a>
                                        </li>
                                        <#if startPage gt 1>
                                            <li class="page-item disabled">
                                                <span class="page-link">...</span>
                                            </li>
                                        </#if>
                                    </#if>

                                    <#list startPage..endPage as i>
                                        <li class="page-item ${(i == files.number)?then('active', '')}">
                                            <a class="page-link" href="/profile?page=${i + 1}<#if size??>&size=${size}</#if><#if categoryId??>&categoryId=${categoryId}</#if><#if contentTypeId??>&contentTypeId=${contentTypeId}</#if><#if sortBy??>&sortBy=${sortBy}</#if><#if sortDirection??>&sortDirection=${sortDirection}</#if>">
                                                ${i + 1}
                                            </a>
                                        </li>
                                    </#list>

                                    <#if endPage lt files.totalPages - 1>
                                        <#if endPage lt files.totalPages - 2>
                                            <li class="page-item disabled">
                                                <span class="page-link">...</span>
                                            </li>
                                        </#if>
                                        <li class="page-item">
                                            <a class="page-link" href="/profile?page=${files.totalPages}<#if size??>&size=${size}</#if><#if categoryId??>&categoryId=${categoryId}</#if><#if contentTypeId??>&contentTypeId=${contentTypeId}</#if><#if sortBy??>&sortBy=${sortBy}</#if><#if sortDirection??>&sortDirection=${sortDirection}</#if>">
                                                ${files.totalPages}
                                            </a>
                                        </li>
                                    </#if>

                                    <#if files.number lt files.totalPages - 1>
                                        <li class="page-item">
                                            <a class="page-link text-success" href="/profile?page=${files.number + 2}<#if size??>&size=${size}</#if><#if categoryId??>&categoryId=${categoryId}</#if><#if contentTypeId??>&contentTypeId=${contentTypeId}</#if><#if sortBy??>&sortBy=${sortBy}</#if><#if sortDirection??>&sortDirection=${sortDirection}</#if>">
                                                <i class="fas fa-chevron-right"></i>
                                            </a>
                                        </li>
                                    <#else>
                                        <li class="page-item disabled">
                                            <span class="page-link">
                                                <i class="fas fa-chevron-right"></i>
                                            </span>
                                        </li>
                                    </#if>

                                    <#if files.number lt files.totalPages - 1>
                                        <li class="page-item">
                                            <a class="page-link text-muted" href="/profile?page=${files.totalPages}<#if size??>&size=${size}</#if><#if categoryId??>&categoryId=${categoryId}</#if><#if contentTypeId??>&contentTypeId=${contentTypeId}</#if><#if sortBy??>&sortBy=${sortBy}</#if><#if sortDirection??>&sortDirection=${sortDirection}</#if>">
                                                <i class="fas fa-angle-double-right"></i>
                                            </a>
                                        </li>
                                    <#else>
                                        <li class="page-item disabled">
                                            <span class="page-link text-muted">
                                                <i class="fas fa-angle-double-right"></i>
                                            </span>
                                        </li>
                                    </#if>
                                </ul>
                            </nav>
                        </div>
                    </div>
                <#else>
                    <div class="text-center py-5">
                        <i class="fas fa-folder-open text-muted fs-1 mb-3"></i>
                        <p class="text-muted">Файлов не существует</p>
                        <a href="/files/upload" class="btn btn-outline-success mt-2">
                            Загрузите свой первый файл
                        </a>
                    </div>
                </#if>
            </div>
        </div>
    </div>
</@main.layout>