{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    <div class="main-banner banner-center banner-home banner-{$siteBannerStyle}">
        <div class="container">
            <div class="banner-content">
            {if $registerdomainenabled || $transferdomainenabled}
                <h1 class="banner-title">{$LANG.findyourdomain}</h1>
                <form method="post" action="domainchecker.php" id="frmDomainHomepage">
                    <input type="hidden" name="transfer">
                    <div class="domain-search-input search-group search-group-lg search-group-combined has-shadow">
                        <div class="search-field">
                            <div class="search-field-icon"><i class="lm lm-search"></i></div>
                            <input class="form-control" type="text" name="domain" placeholder="{$LANG.exampledomain}" autocapitalize="none" data-toggle="tooltip" {if ($language == 'arabic' || $language == 'hebrew' || $language == 'farsi')} data-placement="right" {else} data-placement="left" {/if} data-trigger="manual" title="{lang key='orderForm.required'}"/>
                        </div>
                        <div class="search-group-btn">
                            {if $transferdomainenabled}
                                <button type="submit" class="btn btn-primary-faded transfer {$captcha->getButtonClass($captchaForm)}" data-domain-action="transfer">
                                    {$LANG.domainstransfer}
                                </button>
                            {/if}
                            {if $registerdomainenabled}
                                <button type="submit" class="btn btn-primary search {$captcha->getButtonClass($captchaForm)}" id="btnDomainSearch">
                                    {$LANG.search}
                                </button>
                            {/if}
                        </div>
                    </div>
                    {include file="$template/includes/captcha.tpl"}
                </form>
            {else}
                <h1 class="banner-title">Ocean PBX Cloud-Based PBX</h1>
            {/if}
            </div>
        </div>
        {include file="$template/includes/common/svg-illustration.tpl" illustration="site/banner-bg"} 
    </div>
	<div class="main-body ">
        <div class="container">
            <div class="">
                <div class="section text-center">
                    <div class="section-header">
                        <h2 class="section-title">{$LANG.howcanwehelp}</h2>
                    </div>
                    <div class="section-body">
                        <div class="tiles row">
                            {if $registerdomainenabled || $transferdomainenabled}
                                <div class="col-md-3">
                                    <a class="tile tile-home" href="domainchecker.php">
                                        <div class="tile-icon">
                                            {include file="$template/includes/common/svg-icon.tpl" icon="domain"}                                            
                                        </div>
                                        <div class="tile-title">{$LANG.buyadomain}</div>
                                    </a>
                                </div>
                            {/if}
                            <div class="col-md-3">
                                <a class="tile tile-home" id="btnOrderHosting" href="{$WEB_ROOT}/cart.php">
                                    <div class="tile-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="web-hosting"} 
                                    </div>
                                    <div class="tile-title">{$LANG.orderhosting}</div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a class="tile tile-home" id="btnMakePayment" href="clientarea.php">
                                    <div class="tile-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="comissions"} 
                                    </div>
                                    <div class="tile-title">{$LANG.makepayment}</div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a class="tile tile-home" id="btnGetSupport" href="submitticket.php">
                                    <div class="tile-icon">
                                        {include file="$template/includes/common/svg-icon.tpl" icon="comments"}                                         
                                    </div>
                                    <div class="tile-title">{$LANG.getsupport}</div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </div>
{/if}
