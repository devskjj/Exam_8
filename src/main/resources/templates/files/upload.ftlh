<#import "../layout.ftlh" as main>
<#import "/spring.ftl" as spring>

<@main.layout pageTitle="Загрузка файла">
    <div class="container py-4">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow-sm">
                    <div class="card-header bg-success text-white">
                        <h1 class="h5 mb-0">Загрузка файла</h1>
                        <p class="small mb-0 opacity-75">Загрузите файл и укажите необходимую информацию</p>
                    </div>

                    <div class="card-body">
                        <#if error??>
                            <div class="alert alert-danger alert-dismissible fade show mb-4" role="alert">
                                <strong>Ошибка!</strong> ${error}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </#if>
                        <#if success??>
                            <div class="alert alert-success alert-dismissible fade show mb-4" role="alert">
                                <strong>Успех!</strong> ${success}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </#if>

                        <form action="/files/upload" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <@spring.formHiddenInput "fileDto.user.id"/>
                            <input type="hidden" name="fileDto.user.name" value="${user.name}"/>
                            <input type="hidden" name="fileDto.user.email" value="${user.email}"/>
                            <#if user.surname??>
                                <input type="hidden" name="fileDto.user.surname" value="${user.surname}"/>
                            </#if>
                            <#if user.role??>
                                <input type="hidden" name="fileDto.user.role.id" value="${user.role.id}"/>
                                <input type="hidden" name="fileDto.user.role.name" value="${user.role.name}"/>
                            </#if>
                            <@spring.bind "fileDto.name"/>

                            <div class="mb-3">
                                <label for="${spring.status.expression}" class="form-label">Имя файла</label>
                                <@spring.formInput "fileDto.name", "class='form-control'", "text"/>
                                <@spring.showErrors "<br>", "text-danger small mt-1"/>
                            </div>

                            <div class="mb-4">
                                <label for="file" class="form-label">Загрузите файл</label>
                                <div class="border border-2 border-dashed rounded p-4 text-center">
                                    <div class="mb-3">
                                        <i class="fas fa-cloud-upload-alt text-muted fs-1"></i>
                                    </div>

                                    <div class="input-group">
                                        <input type="file" id="file" name="file" class="form-control">
                                    </div>

                                    <p class="small text-muted mb-0">
                                        PNG, JPG, PDF, DOC, XLS и другие форматы
                                    </p>

                                    <div id="filePreview" class="mt-4 p-3 border rounded bg-light d-none">
                                        <div class="d-flex align-items-center">
                                            <div class="me-3">
                                                <i class="fas fa-file text-primary fs-3"></i>
                                            </div>
                                            <div>
                                                <p class="small text-muted mb-0">Выбранный файл:</p>
                                                <p id="selectedFileName" class="fw-bold text-primary mb-0"></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <@spring.bind "fileDto.fileCategory.id"/>
                            <div class="mb-3">
                                <#assign categoryMap = {}>
                                <#list categories as category>
                                    <#assign categoryMap = categoryMap + {category.id?string: category.name}>
                                </#list>

                                <label for="${spring.status.expression}" class="form-label">
                                    Категория
                                </label>
                                <@spring.formSingleSelect "fileDto.fileCategory.id", categoryMap, "class='form-select'"/>
                                <@spring.showErrors "<br>", "text-danger small mt-1"/>
                            </div>

                            <@spring.bind "fileDto.isPublic"/>
                            <div class="mb-4">
                                <div class="form-check">
                                    <@spring.formCheckbox "fileDto.isPublic", "class='form-check-input'"/>
                                    <label class="form-check-label" for="${spring.status.expression}">
                                        Публичный доступ
                                    </label>
                                    <div class="form-text">Разрешить другим пользователям скачивать этот файл</div>
                                </div>
                                <@spring.showErrors "<br>", "text-danger small mt-1"/>
                            </div>

                            <div class="d-flex justify-content-end gap-2">
                                <a href="/profile" class="btn btn-outline-secondary">
                                    Отмена
                                </a>
                                <button type="submit" class="btn btn-success">
                                    <i class="fas fa-upload me-1"></i>
                                    Загрузить
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</@main.layout>