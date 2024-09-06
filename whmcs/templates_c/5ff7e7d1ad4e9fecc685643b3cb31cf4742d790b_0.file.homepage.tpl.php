<?php
/* Smarty version 3.1.48, created on 2024-09-05 09:01:48
  from '/var/www/html/templates/lagom2/homepage.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_66d9737ccd57a7_51320852',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '5ff7e7d1ad4e9fecc685643b3cb31cf4742d790b' => 
    array (
      0 => '/var/www/html/templates/lagom2/homepage.tpl',
      1 => 1725451145,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_66d9737ccd57a7_51320852 (Smarty_Internal_Template $_smarty_tpl) {
if ((isset($_smarty_tpl->tpl_vars['RSThemes']->value['pages'][$_smarty_tpl->tpl_vars['templatefile']->value])) && file_exists($_smarty_tpl->tpl_vars['RSThemes']->value['pages'][$_smarty_tpl->tpl_vars['templatefile']->value]['fullPath'])) {?>
    <?php $_smarty_tpl->_subTemplateRender($_smarty_tpl->tpl_vars['RSThemes']->value['pages'][$_smarty_tpl->tpl_vars['templatefile']->value]['fullPath'], $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
} else { ?>
    <div class="main-banner pb-0 banner-center banner-home banner-<?php echo $_smarty_tpl->tpl_vars['siteBannerStyle']->value;?>
">
        <div class="container">
            <img src="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/templates/lagom2/assets/img/ocean.jpeg" width="70%" />
            <div class="banner-content">
            <?php if ($_smarty_tpl->tpl_vars['registerdomainenabled']->value || $_smarty_tpl->tpl_vars['transferdomainenabled']->value) {?>
                <h1 class="banner-title"><?php echo $_smarty_tpl->tpl_vars['LANG']->value['findyourdomain'];?>
</h1>
                <form method="post" action="domainchecker.php" id="frmDomainHomepage">
                    <input type="hidden" name="transfer">
                    <div class="domain-search-input search-group search-group-lg search-group-combined has-shadow">
                        <div class="search-field">
                            <div class="search-field-icon"><i class="lm lm-search"></i></div>
                            <input class="form-control" type="text" name="domain" placeholder="<?php echo $_smarty_tpl->tpl_vars['LANG']->value['exampledomain'];?>
" autocapitalize="none" data-toggle="tooltip" <?php if (($_smarty_tpl->tpl_vars['language']->value == 'arabic' || $_smarty_tpl->tpl_vars['language']->value == 'hebrew' || $_smarty_tpl->tpl_vars['language']->value == 'farsi')) {?> data-placement="right" <?php } else { ?> data-placement="left" <?php }?> data-trigger="manual" title="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['lang'][0], array( array('key'=>'orderForm.required'),$_smarty_tpl ) );?>
"/>
                        </div>
                        <div class="search-group-btn">
                            <?php if ($_smarty_tpl->tpl_vars['transferdomainenabled']->value) {?>
                                <button type="submit" class="btn btn-primary-faded transfer <?php echo $_smarty_tpl->tpl_vars['captcha']->value->getButtonClass($_smarty_tpl->tpl_vars['captchaForm']->value);?>
" data-domain-action="transfer">
                                    <?php echo $_smarty_tpl->tpl_vars['LANG']->value['domainstransfer'];?>

                                </button>
                            <?php }?>
                            <?php if ($_smarty_tpl->tpl_vars['registerdomainenabled']->value) {?>
                                <button type="submit" class="btn btn-primary search <?php echo $_smarty_tpl->tpl_vars['captcha']->value->getButtonClass($_smarty_tpl->tpl_vars['captchaForm']->value);?>
" id="btnDomainSearch">
                                    <?php echo $_smarty_tpl->tpl_vars['LANG']->value['search'];?>

                                </button>
                            <?php }?>
                        </div>
                    </div>
                    <?php $_smarty_tpl->_subTemplateRender(((string)$_smarty_tpl->tpl_vars['template']->value)."/includes/captcha.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>
                </form>
            <?php } else { ?>
                
                
            <?php }?>
            </div>
        </div>
        <?php $_smarty_tpl->_subTemplateRender(((string)$_smarty_tpl->tpl_vars['template']->value)."/includes/common/svg-illustration.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('illustration'=>"site/banner-bg"), 0, true);
?> 
    </div>
    <div class="section text-center">
        <div class="section-header">    
            <h1 style="color: #1F3A6F;">How Hosted PBX Works</h1>
        </div>
        <img src="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/templates/lagom2/assets/img/howitworks.jpeg" width="60%" />
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
                            <?php if ($_smarty_tpl->tpl_vars['registerdomainenabled']->value || $_smarty_tpl->tpl_vars['transferdomainenabled']->value) {?>
                                <div class="col-md-2">
                                    <a class="tile tile-home" href="domainchecker.php">
                                        <div class="tile-icon">
                                            <?php $_smarty_tpl->_subTemplateRender(((string)$_smarty_tpl->tpl_vars['template']->value)."/includes/common/svg-icon.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('icon'=>"domain"), 0, true);
?>                                            
                                        </div>
                                        <div class="tile-title"><?php echo $_smarty_tpl->tpl_vars['LANG']->value['buyadomain'];?>
</div>
                                    </a>
                                </div>
                            <?php }?>
                            <div class="col-md-2">
                                <a class="tile decor0 tile-home" id="btnOrderHosting" href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/cart.php">
                                    <div class="tile-icon">
                                        <img src="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/templates/lagom2/assets/img/british_telecom.png" alt="Custom Icon" style="width:100%; height:auto;">
                                    </div>
                                    <div class="tile-title">British Telecom</div>
                                </a>
                            </div>
                            <div class="col-md-2">
                                <a class="tile decor0 tile-home" id="btnMakePayment" href="clientarea.php">
                                    <div class="tile-icon">
                                        <img src="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/templates/lagom2/assets/img/France_telecom.png" alt="Custom Icon" style="width:100%; height:auto;">
                                    </div>
                                    <div class="tile-title">France Telecom</div>
                                </a>
                            </div>
                            <div class="col-md-2">
                                <a class="tile decor0 tile-home" id="btnGetSupport" href="submitticket.php">
                                    <div class="tile-icon">
                                        <img src="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/templates/lagom2/assets/img/telecom_italia.png" alt="Custom Icon" style="width:100%; height:auto;">
                                    </div>
                                    <div class="tile-title">Telecom Italia</div>
                                </a>
                            </div>
                            <div class="col-md-2">
                                <a class="tile decor0 tile-home" id="btnGetSupport" href="submitticket.php">
                                    <div class="tile-icon">
                                        <img src="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/templates/lagom2/assets/img/bharti_airtel.png" alt="Custom Icon" style="width:100%; height:auto;">
                                    </div>
                                    <div class="tile-title">Bharti Airtel</div>
                                </a>
                            </div>
                            <div class="col-md-2">
                                <a class="tile decor0 tile-home" id="btnGetSupport" href="submitticket.php">
                                    <div class="tile-icon">
                                        <img src="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/templates/lagom2/assets/img/idt.png" alt="Custom Icon" style="width:100%; height:auto;">
                                    </div>
                                    <div class="tile-title">IDT</div>
                                </a>
                            </div>
                            <div class="col-md-2">
                                <a class="tile decor0 tile-home" id="btnGetSupport" href="submitticket.php">
                                    <div class="tile-icon">
                                        <img src="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/templates/lagom2/assets/img/du_emirates_telecom.png" alt="Custom Icon" style="width:100%; height:auto;">
                                    </div>
                                    <div class="tile-title">Du Emirates Telecom</div>
                                </a>
                            </div>
                            <div class="col-md-2">
                                <a class="tile decor0 tile-home" id="btnGetSupport" href="submitticket.php">
                                    <div class="tile-icon">
                                        <img src="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/templates/lagom2/assets/img/lebara.png" alt="Custom Icon" style="width:100%; height:auto;">
                                    </div>
                                    <div class="tile-title">Lebara</div>
                                </a>
                            </div>
                            <div class="col-md-2">
                                <a class="tile decor0 tile-home" id="btnGetSupport" href="submitticket.php">
                                    <div class="tile-icon">
                                        <img src="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/templates/lagom2/assets/img/zian_group.png" alt="Custom Icon" style="width:100%; height:auto;">
                                    </div>
                                    <div class="tile-title">Zian group</div>
                                </a>
                            </div>
                            <div class="col-md-2">
                                <a class="tile decor0 tile-home" id="btnGetSupport" href="submitticket.php">
                                    <div class="tile-icon">
                                        <img src="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/templates/lagom2/assets/img/jordan_telecom_group.png" alt="Custom Icon" style="width:100%; height:auto;">
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
<?php }
}
}
