<#import "../layout.ftlh" as main>
<@main.layout pageTitle="Панель администратора">

    <div class="container py-4">
        <h1 class="h2 fw-bold mb-4">Панель администратора</h1>

        <div class="card shadow-sm mb-4">
            <div class="card-body">
                <h2 class="h5 fw-semibold mb-3">Управление пользователями и файлами</h2>
                <p class="text-muted mb-4">Добро пожаловать в панель администратора. Здесь вы можете управлять
                    пользователями и просматривать их файлы.</p>

                <div class="row mt-3">
                    <div class="col-md-12">
                        <a href="/admin/users"
                           class="card text-decoration-none text-white bg-primary border-0 h-100 transition">
                            <div class="card-body d-flex align-items-center">
                                <div class="rounded-circle bg-primary bg-opacity-75 p-3 me-3">
                                    <i class="fas fa-users fs-4"></i>
                                </div>
                                <div>
                                    <h3 class="h6 fw-bold mb-1">Управление пользователями</h3>
                                    <p class="small mb-0 opacity-75">Просмотр, блокировка и разблокировка
                                        пользователей</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="card shadow-sm">
            <div class="card-body">
                <h2 class="h5 fw-semibold mb-3">Статистика</h2>
                <p class="text-muted mb-4">Здесь будет отображаться статистика по пользователям и файлам.</p>

                <div class="row g-3">
                    <div class="col-md-4">
                        <div class="bg-success bg-opacity-10 rounded p-3 h-100">
                            <div class="d-flex align-items-center">
                                <div class="rounded-circle bg-success p-3 me-3">
                                    <i class="fas fa-users text-white"></i>
                                </div>
                                <div>
                                    <h3 class="h6 fw-semibold text-success">Пользователи</h3>
                                    <p class="h3 fw-bold text-success mb-0">${userCount}</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="bg-primary bg-opacity-10 rounded p-3 h-100">
                            <div class="d-flex align-items-center">
                                <div class="rounded-circle bg-primary p-3 me-3">
                                    <i class="fa-solid fa-folder-open text-white"></i>
                                </div>
                                <div>
                                    <h3 class="h6 fw-semibold text-primary">Файлы</h3>
                                    <p class="h3 fw-bold text-primary mb-0">${fileCount}</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="bg-purple bg-opacity-10 rounded p-3 h-100">
                            <div class="d-flex align-items-center">
                                <div class="rounded-circle bg-purple p-3 me-3">
                                    <i class="fa-solid fa-cloud-arrow-down text-white"></i>
                                </div>
                                <div>
                                    <h3 class="h6 fw-semibold text-purple">Загрузки</h3>
                                    <p class="h3 fw-bold text-purple mb-0">${downloadCount}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</@main.layout>
