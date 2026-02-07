<#macro layout pageTitle="" centered=false>
    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JavaShareHub - <#if pageTitle??>${pageTitle}<#else>Платформа для обмена файлами</#if></title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
              integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
              crossorigin="anonymous" referrerpolicy="no-referrer"/>

        <link rel="stylesheet" href="/static/css/styles.css">
    </head>

    <#assign known = SPRING_SECURITY_CONTEXT?? >
    <#if known>
        <#assign
        currentUser = SPRING_SECURITY_CONTEXT.authentication.principal
        currentUserId = currentUser.getUserId()
        roles = currentUser.authorities
        >
    </#if>

    <body class="bg-light min-vh-100 <#if centered??>d-flex justify-content-center align-items-center p-3</#if>">
    <#if !centered??>
        <nav class="navbar navbar-expand-lg navbar-orange text-white shadow">
            <div class="container">
                <div class="d-flex align-items-center me-3">
                    <i class="fa-solid fa-cloud fs-3 me-2"></i>

                    <span class="navbar-brand fw-bold fs-4 mb-0">JavaShareHub</span>
                </div>

                <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
                    <span class="navbar-toggler-icon text-white"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarContent">
                    <#if currentUser??>
                        <div class="d-flex align-items-center w-100 justify-content-between">
                            <div class="d-flex align-items-center">
                                <a href="/" class="text-white text-decoration-none me-3 nav-link-hover btn-nav-hover px-3 py-2 rounded">
                                    <i class="fas fa-home me-1"></i> Главная
                                </a>
                                <a href="/profile" class="text-white text-decoration-none me-3 nav-link-hover btn-nav-hover px-3 py-2 rounded">
                                    <i class="fas fa-folder me-1"></i> Мои файлы
                                </a>
                                <a href="/files/upload" class="text-white text-decoration-none me-3 nav-link-hover btn-nav-hover px-3 py-2 rounded">
                                    <i class="fas fa-upload me-1"></i> Загрузить файл
                                </a>
                                <#if roles??>
                                    <#list roles as current>
                                        <#if current.authority == "ROLE_ADMIN">
                                            <a href="/admin" class="text-white text-decoration-none me-3 nav-link-hover btn-nav-hover px-3 py-2 rounded">
                                                <i class="fas fa-shield-alt me-1"></i> Админ панель
                                            </a>
                                            <#break>
                                        </#if>
                                    </#list>
                                </#if>
                            </div>

                            <div class="dropdown dropdown-hover">
                                <button class="btn text-white d-flex align-items-center p-0 nav-link-hover btn-nav-hover px-3 py-2 rounded" type="button">
                                    <i class="fas fa-user-circle fs-5 me-2"></i>
                                    <span>${currentUser.name}</span>
                                    <i class="fas fa-chevron-down ms-1 fs-6"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-end mt-0 shadow border-orange">
                                    <a href="/profile" class="dropdown-item">
                                        <i class="fas fa-user me-2"></i> Профиль
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <#if _csrf??>
                                        <form action="/logout" method="post" class="dropdown-item p-0">
                                            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}"
                                                   value="${(_csrf.token)!'--no-token--'}"/>
                                            <button type="submit" class="btn-logout p-2 text-start w-100" id="logout">
                                                <i class="fas fa-sign-out-alt me-2"></i> Выход
                                            </button>
                                        </form>
                                    <#else>
                                        <a href="/logout" class="dropdown-item">
                                            <i class="fas fa-sign-out-alt me-2"></i> Выход
                                        </a>
                                    </#if>
                                </div>
                            </div>
                        </div>
                    <#else>
                        <div class="d-flex align-items-center ms-auto">
                            <a href="/auth/login" class="text-white text-decoration-none me-3 nav-link-hover btn-nav-hover px-3 py-2 rounded">
                                <i class="fas fa-sign-in-alt me-1"></i> Вход
                            </a>
                            <a href="/auth/register" class="text-white text-decoration-none nav-link-hover btn-nav-hover px-3 py-2 rounded">
                                <i class="fas fa-user-plus me-1"></i> Регистрация
                            </a>
                        </div>
                    </#if>
                </div>
            </div>
        </nav>
    </#if>

    <#if centered = true>
        <div class="container-centered">
            <div class="bg-white rounded shadow overflow-hidden border-orange">
                <div class="p-4 bg-orange text-white text-center">
                    <div class="d-flex align-items-center justify-content-center mb-3">
                        <i class="fa-solid fa-cloud fs-3 me-2"></i>
                        <span class="fs-4 fw-bold">JavaShareHub</span>
                    </div>
                    <#if currentUser??>
                        <div class="d-flex align-items-center justify-content-center flex-wrap gap-3">
                            <a href="/" class="text-white text-decoration-none nav-link-hover btn-nav-hover px-3 py-2 rounded">
                                <i class="fas fa-home me-1"></i> Главная
                            </a>
                            <a href="/profile" class="text-white text-decoration-none nav-link-hover btn-nav-hover px-3 py-2 rounded">
                                <i class="fas fa-folder me-1"></i> Мои файлы
                            </a>
                            <a href="/files/upload" class="text-white text-decoration-none nav-link-hover btn-nav-hover px-3 py-2 rounded">
                                <i class="fas fa-upload me-1"></i> Загрузить файл
                            </a>

                            <#if roles??>
                                <#list roles as current>
                                    <#if current.authority == "ROLE_ADMIN">
                                        <a href="/admin" class="text-white text-decoration-none nav-link-hover btn-nav-hover px-3 py-2 rounded">
                                            <i class="fas fa-shield-alt me-1"></i> Админ панель
                                        </a>
                                        <#break>
                                    </#if>
                                </#list>
                            </#if>
                            <div class="dropdown dropdown-hover d-inline">
                                <button class="btn text-white p-0 nav-link-hover btn-nav-hover px-3 py-2 rounded" type="button">
                                    <i class="fas fa-user-circle fs-5"></i>
                                    <i class="fas fa-chevron-down ms-1 fs-6"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-end shadow border-orange">
                                    <a href="/profile" class="dropdown-item">
                                        <i class="fas fa-user me-2"></i> Профиль
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <#if _csrf??>
                                        <form action="/logout" method="post" class="dropdown-item p-0">
                                            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}"
                                                   value="${(_csrf.token)!'--no-token--'}"/>
                                            <button type="submit" class="btn-logout p-2 text-start w-100" id="logout">
                                                <i class="fas fa-sign-out-alt me-2"></i> Выход
                                            </button>
                                        </form>
                                    <#else>
                                        <a href="/logout" class="dropdown-item">
                                            <i class="fas fa-sign-out-alt me-2"></i> Выход
                                        </a>
                                    </#if>
                                </div>
                            </div>
                        </div>
                    <#else>
                        <div class="d-flex align-items-center justify-content-center gap-3">
                            <a href="/auth/login" class="text-white text-decoration-none nav-link-hover btn-nav-hover px-3 py-2 rounded">
                                <i class="fas fa-sign-in-alt me-1"></i> Вход
                            </a>
                            <a href="/auth/register" class="text-white text-decoration-none nav-link-hover btn-nav-hover px-3 py-2 rounded">
                                <i class="fas fa-user-plus me-1"></i> Регистрация
                            </a>
                        </div>
                    </#if>
                </div>
                <div class="p-4">
                    <#nested "content">
                </div>
            </div>
        </div>
    <#else>
        <div class="container w-100 mt-3">
            <div class="bg-white rounded shadow overflow-hidden border-orange">
                <div class="p-4 bg-orange text-white text-center">
                    <div class="d-inline-flex align-items-center justify-content-center bg-white rounded-circle mb-3" style="width: 80px; height: 80px;">
                        <i class="fa-solid fa-cloud text-orange fs-3"></i>
                    </div>
                    <p class="small mb-3">Скачивайте и делитесь файлами</p>
                    <#if currentUser??>
                        <div class="d-flex align-items-center justify-content-center flex-wrap gap-3">
                            <a href="/" class="text-white text-decoration-none nav-link-hover btn-nav-hover px-3 py-2 rounded">
                                <i class="fas fa-home me-1"></i> Главная
                            </a>
                            <a href="/profile" class="text-white text-decoration-none nav-link-hover btn-nav-hover px-3 py-2 rounded">
                                <i class="fas fa-folder me-1"></i> Мои файлы
                            </a>
                            <a href="/files/upload" class="text-white text-decoration-none nav-link-hover btn-nav-hover px-3 py-2 rounded">
                                <i class="fas fa-upload me-1"></i> Загрузить файл
                            </a>
                            <#if roles??>
                                <#list roles as current>
                                    <#if current.authority == "ROLE_ADMIN">
                                        <a href="/admin" class="text-white text-decoration-none nav-link-hover btn-nav-hover px-3 py-2 rounded">
                                            <i class="fas fa-shield-alt me-1"></i> Админ панель
                                        </a>
                                        <#break>
                                    </#if>
                                </#list>
                            </#if>

                            <#if _csrf??>
                                <form action="/logout" method="post" class="d-inline">
                                    <input type="hidden" name="${(_csrf.parameterName)!'csrf'}"
                                           value="${(_csrf.token)!'--no-token--'}"/>
                                    <button type="submit" class="text-white text-decoration-none border-0 bg-transparent nav-link-hover btn-nav-hover px-3 py-2 rounded"
                                            id="logout">
                                        <i class="fas fa-sign-out-alt me-1"></i> Выход
                                    </button>
                                </form>
                            <#else>
                                <a href="/logout" class="text-white text-decoration-none nav-link-hover btn-nav-hover px-3 py-2 rounded">
                                    <i class="fas fa-sign-out-alt me-1"></i> Выход
                                </a>
                            </#if>
                        </div>
                    <#else>
                        <div class="d-flex align-items-center justify-content-center gap-3">
                            <a href="/auth/login" class="text-white text-decoration-none nav-link-hover btn-nav-hover px-3 py-2 rounded">
                                <i class="fas fa-sign-in-alt me-1"></i> Вход
                            </a>
                            <a href="/auth/register" class="text-white text-decoration-none nav-link-hover btn-nav-hover px-3 py-2 rounded">
                                <i class="fas fa-user-plus me-1"></i> Регистрация
                            </a>
                        </div>
                    </#if>
                </div>
                <div class="p-4">
                    <#nested "content">
                </div>
            </div>
        </div>
    </#if>

    </body>
    </html>
</#macro>