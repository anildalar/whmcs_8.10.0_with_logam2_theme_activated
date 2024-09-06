{if file_exists("{$smarty.current_dir}/overwrites/domain-search.tpl")}
    {include file="{$smarty.current_dir}/overwrites/domain-search.tpl"}  
{else}
    <form 
        method="post" 
        action="{$WEB_ROOT}{if $type == "register"}/cart.php?a=add&domain=register{elseif $type == "transfer"}/cart.php?a=add&domain=transfer{/if}"
    >
        {if $captcha}
            <script>
                var recaptchaSiteKey = "{$captcha->recaptcha->getSiteKey()}";
            </script>
        {/if}
        <div class="domain-search-input search-group search-group-lg search-group-combined has-shadow search-w-tooltip {if $customClass}{$customClass}{/if}" data-container=".search-w-tooltip" data-trigger="manual" data-no-domain="{$rslang->trans('banner_domain.tooltip.no_domain')}" data-no-tld="{$rslang->trans('banner_domain.tooltip.no_tld')}" data-no-domain-name="{$rslang->trans('banner_domain.tooltip.no_domain_name')}">
            <div class="search-field">
                <input 
                    class="form-control" 
                    type="text" 
                    name="query"
                    placeholder="{$LANG.searchenterdomain}" 
                    autocapitalize="none"
                    data-domain-input
                />
                <div class="search-field-icon">
                    {if file_exists("templates/$template/assets/svg-icon/custom/search-field-icon.tpl")}
                        {include file="{$smarty.current_dir}/../../../../assets/svg-icon/custom/search-field-icon.tpl"}
                    {else}
                        <i class="lm lm-search"></i>
                    {/if}  
                </div>
            </div>
            <div class="search-group-btn">
                <button 
                    type="submit" 
                    data-btn-loader
                    class="btn btn-primary domainSearchBtn {if in_array($captcha, ['invisible']) && $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm)}{$captcha->getButtonClass($captchaForm)}{/if}" 
                >
                    {if $type == "register"}<span>{$LANG.search}</span>{elseif $type == "transfer"}<span>{$LANG.orderForm.transfer}</span>{/if}
                    <div class="loader loader-button hidden" >
                        {include file="{$smarty.current_dir}/../../../../includes/common/loader.tpl" classes="spinner-sm spinner-light"}  
                    </div>
                </button>
            </div>
        </div>
    </form>
{/if}