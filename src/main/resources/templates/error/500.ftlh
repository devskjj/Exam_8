<#import "../layout.ftlh" as main>
<@main.layout>

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow-lg">

                    <div class="card-header bg-danger text-white py-3">
                        <h1 class="h2 mb-0">${status!500}</h1>
                    </div>

                    <div class="card-body p-4">

                        <div class="d-flex align-items-center mb-4">
                            <svg xmlns="http://www.w3.org/2000/svg" class="text-danger me-3" width="48" height="48"
                                 fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"/>
                            </svg>
                            <div>
                                <h2 class="h4 fw-semibold text-dark mb-0">
                                    UH OH! ${reason!"Внутренняя ошибка сервера"}
                                </h2>
                            </div>
                        </div>

                        <p class="text-muted mb-4">
                            Произошла непредвиденная ошибка на сервере. Попробуйте позже.
                        </p>

                        <div class="mt-5 text-center">
                            <a href="/" class="btn btn-primary px-4 py-2">
                                На главную
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</@main.layout>