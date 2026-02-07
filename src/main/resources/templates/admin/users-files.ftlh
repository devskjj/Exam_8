<#import "../layout.ftlh" as main>
<@main.layout pageTitle="Файлы пользователя">
    <div class="container py-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="h2 fw-bold mb-0">Файлы пользователя: ${user.name} ${user.surname!}</h1>
            <a href="/admin/users" class="btn btn-secondary">
                <i class="fas fa-arrow-left me-2"></i> К списку пользователей
            </a>
        </div>

        <div class="card shadow-sm mb-4">
            <div class="card-body">
                <div class="d-flex align-items-center">
                    <div class="rounded-circle bg-primary p-3 me-3">
                        <i class="fas fa-user text-white fs-4"></i>
                    </div>
                    <div>
                        <h2 class="h5 fw-semibold mb-1">${user.name} ${user.surname!}</h2>
                        <p class="text-muted mb-1">${user.email}</p>
                        <p class="mb-0">
                            <span class="fw-medium">Статус:</span>
                            <#if user.enabled>
                                <span class="text-success">Активен</span>
                            <#else>
                                <span class="text-danger">Заблокирован</span>
                            </#if>
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <#if files?? && files.content?size gt 0>
            <div class="card shadow-sm">
                <div class="table-responsive">
                    <table class="table table-hover mb-0">
                        <thead class="table-light">
                        <tr>
                            <th scope="col" class="text-uppercase small fw-medium">ID</th>
                            <th scope="col" class="text-uppercase small fw-medium">Название</th>
                            <th scope="col" class="text-uppercase small fw-medium">Тип</th>
                            <th scope="col" class="text-uppercase small fw-medium">Категория</th>
                            <th scope="col" class="text-uppercase small fw-medium">Размер</th>
                            <th scope="col" class="text-uppercase small fw-medium">Дата загрузки</th>
                            <th scope="col" class="text-uppercase small fw-medium">Доступ</th>
                            <th scope="col" class="text-uppercase small fw-medium">Действия</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list files.content as file>
                            <tr>
                                <td class="text-muted small">${file.id}</td>
                                <td>
                                    <div class="fw-medium">${file.name}</div>
                                </td>
                                <td>
                                    <div class="fw-medium">${file.contentType.name}</div>
                                    <div class="text-muted small">${file.contentType.mimeType}</div>
                                </td>
                                <td class="text-muted">${file.fileCategory.name}</td>
                                <td class="text-muted">
                                    <#if file.size lt 1024>
                                        ${file.size} B
                                    <#elseif file.size lt 1048576>
                                        ${(file.size / 1024)?string("0.##")} KB
                                    <#else>
                                        ${(file.size / 1048576)?string("0.##")} MB
                                    </#if>
                                </td>
                                <td class="text-muted">${file.formattedUploadDate}</td>
                                <td>
                                    <#if file.isPublic>
                                        <span class="badge bg-success bg-opacity-10 text-success">
                                                Публичный
                                            </span>
                                    <#else>
                                        <span class="badge bg-warning bg-opacity-10 text-warning">
                                                Приватный
                                            </span>
                                    </#if>
                                </td>
                                <td>
                                    <#if file.isPublic>
                                        <a href="/files/download/${file.id}" class="btn btn-sm btn-outline-primary">
                                            <i class="fas fa-download me-1"></i> Скачать
                                        </a>
                                    <#else>
                                        <a href="/files/request-download?fileId=${file.id}"
                                           class="text-success text-decoration-none" title="Получить ссылку">
                                            <i class="fas fa-envelope fs-5"></i>
                                        </a>
                                    </#if>
                                </td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </div>

            <#if files.totalPages gte 1>
                <nav aria-label="Навигация по страницам" class="d-flex justify-content-center mt-4">
                    <ul class="pagination mb-0">
                        <#if currentPage gt 1>
                            <li class="page-item">
                                <a class="page-link" href="/admin/users/${user.id}/files?page=${currentPage - 1}">
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

                        <#list 1..files.totalPages as i>
                            <#if i == currentPage>
                                <li class="page-item active">
                                    <span class="page-link">${i}</span>
                                </li>
                            <#else>
                                <li class="page-item">
                                    <a class="page-link" href="/admin/users/${user.id}/files?page=${i}">${i}</a>
                                </li>
                            </#if>
                        </#list>

                        <#if currentPage lt files.totalPages>
                            <li class="page-item">
                                <a class="page-link" href="/admin/users/${user.id}/files?page=${currentPage + 1}">
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
                    </ul>
                </nav>
            </#if>
        <#else>
            <div class="card shadow-sm">
                <div class="card-body text-center py-5">
                    <p class="text-muted mb-0">У пользователя нет файлов.</p>
                </div>
            </div>
        </#if>
    </div>
</@main.layout>