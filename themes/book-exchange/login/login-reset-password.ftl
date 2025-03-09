<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "form">
        <form id="kc-reset-password-form" class="reset-password-form" action="${url.loginAction}" method="post">
            <div class="form-group">
                <label for="username" class="form-label">
                    <#if !realm.loginWithEmailAllowed>
                        ${msg("username")}
                    <#elseif !realm.registrationEmailAsUsername>
                        ${msg("usernameOrEmail")}
                    <#else>
                        ${msg("email")}
                    </#if>
                </label>
                <input type="text" id="username" name="username" class="form-control"
                       autofocus
                       aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                />
                <#if messagesPerField.existsError('username')>
                    <span class="error-message">${kcSanitize(messagesPerField.get('username'))?no_esc}</span>
                </#if>
            </div>

            <div class="form-group form-actions">
                <button type="submit" class="btn btn-primary btn-block btn-lg">${msg("doSubmit")}</button>
            </div>

            <div class="form-group back-to-login">
                <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>