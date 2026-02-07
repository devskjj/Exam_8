<#import "../layout.ftlh" as main>
<@main.layout pageTitle="Вход в систему" centered=true>
    <#assign content>
        <h2 class="h5 text-center text-dark mb-4">Вход в аккаунт</h2>

        <form action="/auth/login" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="mb-3">
                <label for="email" class="form-label small fw-semibold text-secondary">
                    Электронная почта
                </label>
                <div class="input-group">
                    <span class="input-group-text bg-light border-end-0">
                        <i class="fas fa-envelope text-muted"></i>
                    </span>
                    <input type="email"
                           id="email"
                           name="username"
                           placeholder="example@mail.ru"
                           class="form-control border-start-0"
                           required>
                </div>
            </div>

            <div class="mb-4">
                <label for="password" class="form-label small fw-semibold text-secondary">
                    Пароль
                </label>
                <div class="input-group">
                    <span class="input-group-text bg-light border-end-0">
                        <i class="fas fa-lock text-muted"></i>
                    </span>
                    <input type="password"
                           id="password"
                           name="password"
                           placeholder="Введите пароль"
                           class="form-control border-start-0"
                           required>
                </div>
            </div>

            <#if error??>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>Ошибка!</strong> ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </#if>

            <button type="submit" class="btn btn-success w-100 py-2 fw-semibold">
                <i class="fas fa-sign-in-alt me-2"></i>
                Войти
            </button>
        </form>

        <div class="text-center my-4 position-relative">
            <hr class="text-secondary">
            <span class="bg-white px-3 small text-muted position-absolute top-50 start-50 translate-middle">
                или
            </span>
        </div>

        <div class="text-center">
            <p class="small text-muted mb-0">
                Ещё нет аккаунта?
                <a href="/auth/register" class="text-success text-decoration-none fw-semibold">
                    Зарегистрироваться
                </a>
            </p>
        </div>
    </#assign>
    ${content}
</@main.layout>