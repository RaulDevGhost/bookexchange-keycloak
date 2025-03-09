<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="robots" content="noindex, nofollow">

        <title>${msg("loginTitle",(realm.displayName!''))}</title>

        <#if properties.styles?has_content>
            <#list properties.styles?split(' ') as style>
                <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
            </#list>
        </#if>
    </head>

    <body class="${properties.kcBodyClass!}">
    <div class="login-container">
        <div class="login-content">
            <div class="login-card">
                <!-- Header with Logo -->
                <div class="login-header">
                    <img src="${url.resourcesPath}/img/logo.png" alt="Book Exchange" class="logo" />
                    <h1>${kcSanitize(msg("loginTitle"))?no_esc}</h1>
                </div>

                <!-- Messages/Alerts -->
                <#if displayMessage && message?has_content>
                    <div class="alert alert-${message.type}">
                        <#if message.type='success'><span class="success-icon">✓</span></#if>
                        <#if message.type='warning'><span class="warning-icon">!</span></#if>
                        <#if message.type='error'><span class="error-icon">×</span></#if>
                        <#if message.type='info'><span class="info-icon">i</span></#if>
                        <span class="message-text">${kcSanitize(message.summary)?no_esc}</span>
                    </div>
                </#if>

                <!-- Main Content -->
                <div class="login-form">
                    <#nested "form">
                </div>

                <!-- Footer Links -->
                <div class="login-footer">
                    <#if realm.internationalizationEnabled && locale.supported?size gt 1>
                        <div class="language-picker">
                            <#list locale.supported as l>
                                <a href="${l.url}">${l.label}</a>
                            </#list>
                        </div>
                    </#if>
                </div>
            </div>
        </div>
    </div>

    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    </body>
    </html>
</#macro>