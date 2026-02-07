<#import "../layout.ftlh" as main>

<@main.layout pageTitle="Скачивание приватного файла">
    <div class="container py-4">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow-sm">
                    <div class="card-header bg-success text-white">
                        <h1 class="h5 mb-0">Приватный файл</h1>
                        <p class="small mb-0 opacity-75">
                            Доступ предоставляется по одноразовой ссылке
                        </p>
                    </div>

                    <div class="card-body">

                        <div class="alert alert-warning border-start border-warning border-4 mb-4">
                            <div class="d-flex">
                                <div class="me-3">
                                    <i class="fas fa-envelope text-warning"></i>
                                </div>
                                <div>
                                    <p class="small mb-0">
                                        Этот файл является приватным.
                                        Укажите email — мы отправим вам одноразовую ссылку
                                        для скачивания.
                                    </p>
                                </div>
                            </div>
                        </div>

                        <#if error??>
                            <div class="alert alert-danger alert-dismissible fade show mb-4" role="alert">
                                <strong>Ошибка!</strong> ${error}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </#if>

                        <form action="/files/request-download" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input type="hidden" name="fileId" value="${fileId}"/>

                            <div class="mb-3">
                                <label for="email" class="form-label">
                                    Email для получения ссылки
                                </label>
                                <input
                                        type="email"
                                        name="email"
                                        id="email"
                                        class="form-control"
                                        placeholder="example@mail.com"
                                        required
                                />
                                <div class="form-text">
                                    Ссылка будет действительна ограниченное время и только для одного скачивания
                                </div>
                            </div>

                            <div class="d-flex justify-content-end gap-2">
                                <a href="/" class="btn btn-outline-secondary">
                                    Отмена
                                </a>
                                <button type="submit" class="btn btn-success text-white">
                                    <i class="fas fa-paper-plane me-2"></i>
                                    Отправить ссылку
                                </button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</@main.layout>