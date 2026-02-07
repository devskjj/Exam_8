<#import "../layout.ftlh" as main>
<@main.layout pageTitle="Регистрация" centered=true>

    <div class="p-4">
        <h2 class="h4 fw-bold text-center mb-4">Создание аккаунта</h2>

        <#import "/spring.ftl" as spring>
        <form action="/auth/register" method="post" class="needs-validation" novalidate>
            <input type="hidden" name="role.id" value="${role.id}"/>
            <input type="hidden" name="role.name" value="${role.name}"/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div class="mb-3">
                <label for="name" class="form-label small fw-medium">Имя</label>
                <@spring.formInput "user.name", "class='form-control'", "text"/>
                <@spring.showErrors "<br>", "text-danger small mt-1"/>
            </div>

            <div class="mb-3">
                <label for="surname" class="form-label small fw-medium">Фамилия</label>
                <@spring.formInput "user.surname", "class='form-control'", "text"/>
                <@spring.showErrors "<br>", "text-danger small mt-1"/>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label small fw-medium">Email</label>
                <@spring.formInput "user.email", "class='form-control'", "email"/>
                <@spring.showErrors "<br>", "text-danger small mt-1"/>
            </div>

            <div class="mb-4">
                <label for="password" class="form-label small fw-medium">Пароль</label>
                <@spring.formPasswordInput "user.password", "class='form-control' minlength='8' maxlength='20'"/>
                <@spring.showErrors "<br>", "text-danger small mt-1"/>
                <div class="form-text">Минимум 8 символов, включая буквы и цифры</div>
            </div>

            <button
                    type="submit"
                    class="btn btn-success w-100 py-2 fw-medium d-flex align-items-center justify-content-center"
            >
                <i class="fas fa-user-plus me-2"></i>
                <span>Зарегистрироваться</span>
            </button>
        </form>

        <div class="position-relative my-4">
            <hr class="text-secondary">
            <span class="position-absolute top-50 start-50 translate-middle bg-white px-3 small text-muted">
                или
            </span>
        </div>

        <div class="text-center">
            <p class="small text-muted mb-0">
                Уже есть аккаунт?
                <a href="/auth/login" class="text-success text-decoration-none fw-medium">
                    Войти
                </a>
            </p>
        </div>
    </div>
</@main.layout>