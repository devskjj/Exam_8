<#import "../layout.ftlh" as main>
<@main.layout pageTitle="Управление пользователями">
    <div class="container py-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="h2 fw-bold mb-0">Управление пользователями</h1>
            <a href="/admin" class="btn btn-secondary">
                <i class="fas fa-arrow-left me-2"></i> Назад
            </a>
        </div>

        <#if users?? && users.content?size gt 0>
            <div class="card shadow-sm mb-4">
                <#if RequestParameters.error??>
                    <div class="alert alert-danger border-start border-danger border-4 mb-4 mx-3 mt-3" role="alert">
                        <h5 class="alert-heading fw-bold">Ошибка</h5>
                        <p class="mb-0">Вы не можете заблокировать свой собственный аккаунт.</p>
                    </div>
                </#if>

                <#if RequestParameters.success??>
                    <div class="alert alert-success border-start border-success border-4 mb-4 mx-3 mt-3" role="alert">
                        <h5 class="alert-heading fw-bold">Успешно</h5>
                        <p class="mb-0">Операция выполнена успешно.</p>
                    </div>
                </#if>

                <div class="table-responsive">
                    <table class="table table-hover mb-0">
                        <thead class="table-light">
                        <tr>
                            <th scope="col" class="text-uppercase small fw-medium">ID</th>
                            <th scope="col" class="text-uppercase small fw-medium">Имя</th>
                            <th scope="col" class="text-uppercase small fw-medium">Email</th>
                            <th scope="col" class="text-uppercase small fw-medium">Роль</th>
                            <th scope="col" class="text-uppercase small fw-medium">Статус</th>
                            <th scope="col" class="text-uppercase small fw-medium">Действия</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#list users.content as user>
                            <tr>
                                <td class="text-muted small">${user.id}</td>
                                <td>
                                    <div class="fw-medium">${user.name} ${user.surname!}</div>
                                </td>
                                <td>${user.email}</td>
                                <td class="text-muted">${user.role.name}</td>
                                <td>
                                    <#if user.enabled>
                                        <span class="badge bg-success bg-opacity-10 text-success">
                                                Активен
                                            </span>
                                    <#else>
                                        <span class="badge bg-danger bg-opacity-10 text-danger">
                                                Заблокирован
                                            </span>
                                    </#if>
                                </td>
                                <td>
                                    <div class="d-flex gap-2">
                                        <a href="/admin/users/${user.id}/files" class="pe-5 btn btn-sm btn-primary">
                                            <i class="fas fa-folder-open me-1"></i> Файлы
                                        </a>

                                        <#if user.id != currentUserId>
                                            <#if user.enabled>
                                                <form action="/admin/users/${user.id}/block" method="post"
                                                      class="d-inline">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                           value="${_csrf.token}"/>
                                                    <button type="submit" class="btn btn-sm btn-danger">
                                                        <i class="fas fa-ban me-1"></i> Блокировать
                                                    </button>
                                                </form>
                                            <#else>
                                                <form action="/admin/users/${user.id}/unblock" method="post"
                                                      class="d-inline">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                           value="${_csrf.token}"/>
                                                    <button type="submit" class="btn btn-sm btn-success">
                                                        <i class="fas fa-check-circle me-1"></i> Разблокировать
                                                    </button>
                                                </form>
                                            </#if>
                                        </#if>
                                    </div>
                                </td>
                            </tr>
                        </#list>
                        </tbody>
                    </table>
                </div>
            </div>

            <#if users.totalPages gte 1>
                <nav aria-label="Навигация по страницам" class="d-flex justify-content-center mt-4">
                    <ul class="pagination mb-0">
                        <#if currentPage gt 1>
                            <li class="page-item">
                                <a class="page-link" href="/admin/users?page=${currentPage - 1}">
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

                        <#list 1..users.totalPages as i>
                            <#if i == currentPage>
                                <li class="page-item active">
                                    <span class="page-link">${i}</span>
                                </li>
                            <#else>
                                <li class="page-item">
                                    <a class="page-link" href="/admin/users?page=${i}">${i}</a>
                                </li>
                            </#if>
                        </#list>

                        <#if currentPage lt users.totalPages>
                            <li class="page-item">
                                <a class="page-link" href="/admin/users?page=${currentPage + 1}">
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
                    <p class="text-muted mb-0">Пользователи не найдены.</p>
                </div>
            </div>
        </#if>
    </div>
</@main.layout>