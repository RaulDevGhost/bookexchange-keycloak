<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "form">
        <div class="verify-email-form">
            <p class="instruction">
                ${msg("emailVerifyInstruction1")}
            </p>
            <p class="instruction">
                ${msg("emailVerifyInstruction2")}
            </p>

            <div class="form-group form-actions">
                <div class="verify-email-buttons">
                    <#if !isAppInitiatedAction??>
                        <form action="${url.loginAction}" class="verify-email-action" method="post">
                            <input type="hidden" name="resend" value="true">
                            <button type="submit" class="btn btn-outline">${msg("doResendEmail")}</button>
                        </form>
                    </#if>
                    <form action="${url.loginAction}" class="verify-email-action" method="post">
                        <button type="submit" class="btn btn-primary">${msg("doBackToLogin")}</button>
                    </form>
                </div>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>