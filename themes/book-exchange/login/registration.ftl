<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "form">
        <form id="kc-register-form" class="register-form" action="${url.registrationAction}" method="post">
            <div class="form-group">
                <label for="firstName" class="form-label">${msg("firstName")}</label>
                <input type="text" id="firstName" class="form-control" name="firstName"
                       value="${(register.formData.firstName!'')}"
                       aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                />
                <#if messagesPerField.existsError('firstName')>
                    <span class="error-message">${kcSanitize(messagesPerField.get('firstName'))?no_esc}</span>
                </#if>
            </div>

            <div class="form-group">
                <label for="lastName" class="form-label">${msg("lastName")}</label>
                <input type="text" id="lastName" class="form-control" name="lastName"
                       value="${(register.formData.lastName!'')}"
                       aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                />
                <#if messagesPerField.existsError('lastName')>
                    <span class="error-message">${kcSanitize(messagesPerField.get('lastName'))?no_esc}</span>
                </#if>
            </div>

            <div class="form-group">
                <label for="email" class="form-label">${msg("email")}</label>
                <input type="email" id="email" class="form-control" name="email"
                       value="${(register.formData.email!'')}"
                       aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                />
                <#if messagesPerField.existsError('email')>
                    <span class="error-message">${kcSanitize(messagesPerField.get('email'))?no_esc}</span>
                </#if>
            </div>

            <#if !realm.registrationEmailAsUsername>
                <div class="form-group">
                    <label for="username" class="form-label">${msg("username")}</label>
                    <input type="text" id="username" class="form-control" name="username"
                           value="${(register.formData.username!'')}"
                           aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                    />
                    <#if messagesPerField.existsError('username')>
                        <span class="error-message">${kcSanitize(messagesPerField.get('username'))?no_esc}</span>
                    </#if>
                </div>
            </#if>

            <div class="form-group">
                <label for="password" class="form-label">${msg("password")}</label>
                <input type="password" id="password" class="form-control" name="password"
                       aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                />
                <#if messagesPerField.existsError('password')>
                    <span class="error-message">${kcSanitize(messagesPerField.get('password'))?no_esc}</span>
                </#if>
            </div>

            <div class="form-group">
                <label for="password-confirm" class="form-label">${msg("passwordConfirm")}</label>
                <input type="password" id="password-confirm" class="form-control" name="password-confirm"
                       aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                />
                <#if messagesPerField.existsError('password-confirm')>
                    <span class="error-message">${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}</span>
                </#if>
            </div>

            <div class="form-group form-actions">
                <button type="submit" class="btn btn-primary btn-block btn-lg">${msg("doRegister")}</button>
            </div>

            <div class="form-group login-link">
                <span>${msg("alreadyHaveAccount")} <a href="${url.loginUrl}">${msg("doLogIn")}</a></span>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>