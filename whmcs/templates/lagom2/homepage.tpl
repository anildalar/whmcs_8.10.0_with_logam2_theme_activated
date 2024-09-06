{if isset($RSThemes['pages'][$templatefile]) && file_exists($RSThemes['pages'][$templatefile]['fullPath'])}
    {include file=$RSThemes['pages'][$templatefile]['fullPath']}
{else}
    <div class="main-banner pb-0 banner-center banner-home banner-{$siteBannerStyle}">
        <div class="container">
            <img src="{$WEB_ROOT}/templates/lagom2/assets/img/ocean.jpeg" width="70%" />
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
                
                
            {/if}
            </div>
        </div>
        {include file="$template/includes/common/svg-illustration.tpl" illustration="site/banner-bg"} 
    </div>
    <div class="section text-center">
        <div class="section-header">    
            <h1 style="color: #1F3A6F;">How Hosted PBX Works</h1>
        </div>
        <img src="{$WEB_ROOT}/templates/lagom2/assets/img/howitworks.jpeg" width="60%" />
    </div>
	<div class="main-body ">
        <div class="container">
            <div class="">
                <div class="section text-center">
                    <div class="section-header">
                        <h2 style="color: #1F3A6F;">Our Partner's</h2>
                    </div>
                    <div class="section-body">
                        <div class="tiles row justify-content-center">
                            {if $registerdomainenabled || $transferdomainenabled}
                                <div class="col-md-2">
                                    <a class="tile tile-home" href="domainchecker.php">
                                        <div class="tile-icon">
                                            {include file="$template/includes/common/svg-icon.tpl" icon="domain"}                                            
                                        </div>
                                        <div class="tile-title">{$LANG.buyadomain}</div>
                                    </a>
                                </div>
                            {/if}
                            <div class="col-md-2">
                                <a class="tile decor0 tile-home" id="btnOrderHosting" href="{$WEB_ROOT}/cart.php">
                                    <div class="tile-icon">
                                        <img src="{$WEB_ROOT}/templates/lagom2/assets/img/british_telecom.png" alt="Custom Icon" style="width:100%; height:auto;">
                                    </div>
                                    <div class="tile-title">British Telecom</div>
                                </a>
                            </div>
                            <div class="col-md-2">
                                <a class="tile decor0 tile-home" id="btnMakePayment" href="clientarea.php">
                                    <div class="tile-icon">
                                        <img src="{$WEB_ROOT}/templates/lagom2/assets/img/France_telecom.png" alt="Custom Icon" style="width:100%; height:auto;">
                                    </div>
                                    <div class="tile-title">France Telecom</div>
                                </a>
                            </div>
                            <div class="col-md-2">
                                <a class="tile decor0 tile-home" id="btnGetSupport" href="submitticket.php">
                                    <div class="tile-icon">
                                        <img src="{$WEB_ROOT}/templates/lagom2/assets/img/telecom_italia.png" alt="Custom Icon" style="width:100%; height:auto;">
                                    </div>
                                    <div class="tile-title">Telecom Italia</div>
                                </a>
                            </div>
                            <div class="col-md-2">
                                <a class="tile decor0 tile-home" id="btnGetSupport" href="submitticket.php">
                                    <div class="tile-icon">
                                        <img src="{$WEB_ROOT}/templates/lagom2/assets/img/bharti_airtel.png" alt="Custom Icon" style="width:100%; height:auto;">
                                    </div>
                                    <div class="tile-title">Bharti Airtel</div>
                                </a>
                            </div>
                            <div class="col-md-2">
                                <a class="tile decor0 tile-home" id="btnGetSupport" href="submitticket.php">
                                    <div class="tile-icon">
                                        <img src="{$WEB_ROOT}/templates/lagom2/assets/img/idt.png" alt="Custom Icon" style="width:100%; height:auto;">
                                    </div>
                                    <div class="tile-title">IDT</div>
                                </a>
                            </div>
                            <div class="col-md-2">
                                <a class="tile decor0 tile-home" id="btnGetSupport" href="submitticket.php">
                                    <div class="tile-icon">
                                        <img src="{$WEB_ROOT}/templates/lagom2/assets/img/du_emirates_telecom.png" alt="Custom Icon" style="width:100%; height:auto;">
                                    </div>
                                    <div class="tile-title">Du Emirates Telecom</div>
                                </a>
                            </div>
                            <div class="col-md-2">
                                <a class="tile decor0 tile-home" id="btnGetSupport" href="submitticket.php">
                                    <div class="tile-icon">
                                        <img src="{$WEB_ROOT}/templates/lagom2/assets/img/lebara.png" alt="Custom Icon" style="width:100%; height:auto;">
                                    </div>
                                    <div class="tile-title">Lebara</div>
                                </a>
                            </div>
                            <div class="col-md-2">
                                <a class="tile decor0 tile-home" id="btnGetSupport" href="submitticket.php">
                                    <div class="tile-icon">
                                        <img src="{$WEB_ROOT}/templates/lagom2/assets/img/zian_group.png" alt="Custom Icon" style="width:100%; height:auto;">
                                    </div>
                                    <div class="tile-title">Zian group</div>
                                </a>
                            </div>
                            <div class="col-md-2">
                                <a class="tile decor0 tile-home" id="btnGetSupport" href="submitticket.php">
                                    <div class="tile-icon">
                                        <img src="{$WEB_ROOT}/templates/lagom2/assets/img/jordan_telecom_group.png" alt="Custom Icon" style="width:100%; height:auto;">
                                    </div>
                                    <div class="tile-title">Jordan Telecom Group</div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="section text-center">
                    <div class="section-header">
                        <h2 style="color: #1F3A6F;">Our Testimonials</h2>
                    </div>
                    <div class="section text-center">
                        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
                        <div id="testimonialCarousel" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <div class="testimonial text-center">
                                        <div class="testimonial-author">
                                            <img src="https://randomuser.me/api/portraits/men/4.jpg" alt="John Doe" class="testimonial-img rounded-circle mx-auto d-block">
                                            <h5 class="testimonial-name mt-3">John Doe</h5>
                                            <p>"This service has exceeded my expectations. The team was professional and the support was outstanding."</p>
                                            <p class="testimonial-title">CEO, CompanyName</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="testimonial text-center">
                                        <div class="testimonial-author">
                                            <img src="https://randomuser.me/api/portraits/men/3.jpg" alt="Jane Smith" class="testimonial-img rounded-circle mx-auto d-block">
                                            <p>"I've been using their service for years, and I've never been disappointed. Highly recommended!"</p>
                                            <h5 class="testimonial-name mt-3">Jane Smith</h5>
                                            <p class="testimonial-title">Marketing Director, AnotherCompany</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="testimonial text-center">
                                        <div class="testimonial-author">
                                            <img src="https://randomuser.me/api/portraits/women/3.jpg" alt="Alice Johnson" class="testimonial-img rounded-circle mx-auto d-block">
                                            <p>"Their attention to detail and commitment to customer satisfaction is top-notch."</p>
                                            <h5 class="testimonial-name mt-3">Alice Johnson</h5>
                                            <p class="testimonial-title">CTO, TechCompany</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#testimonialCarousel" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon w-25 h-25" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#testimonialCarousel" role="button" data-slide="next">
                                <span class="carousel-control-next-icon w-25 h-25" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>

            </div> 
        </div>
    </div>
{/if}
