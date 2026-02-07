<#import "layout.ftlh" as main>

<@main.layout pageTitle="Сообщение">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-6">

                <#if message??>
                    <div class="alert alert-success text-center">
                        <i class="fas fa-check-circle me-2"></i>
                        ${message}
                    </div>
                </#if>

                <#if error??>
                    <div class="alert alert-danger text-center">
                        <i class="fas fa-exclamation-circle me-2"></i>
                        ${error}
                    </div>
                </#if>

                <div class="text-center mt-4">
                    <a href="/" class="btn btn-outline-secondary">
                        Вернуться на главную
                    </a>
                </div>

            </div>
        </div>
    </div>
</@main.layout>
