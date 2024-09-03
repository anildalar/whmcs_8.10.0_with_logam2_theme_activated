<?php
/* Smarty version 3.1.48, created on 2024-09-03 11:56:28
  from '/var/www/html/templates/lagom2/homepage.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_66d6f96c38a251_83714513',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '5ff7e7d1ad4e9fecc685643b3cb31cf4742d790b' => 
    array (
      0 => '/var/www/html/templates/lagom2/homepage.tpl',
      1 => 1725364028,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_66d6f96c38a251_83714513 (Smarty_Internal_Template $_smarty_tpl) {
if ((isset($_smarty_tpl->tpl_vars['RSThemes']->value['pages'][$_smarty_tpl->tpl_vars['templatefile']->value])) && file_exists($_smarty_tpl->tpl_vars['RSThemes']->value['pages'][$_smarty_tpl->tpl_vars['templatefile']->value]['fullPath'])) {?>
    <?php $_smarty_tpl->_subTemplateRender($_smarty_tpl->tpl_vars['RSThemes']->value['pages'][$_smarty_tpl->tpl_vars['templatefile']->value]['fullPath'], $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
} else { ?>
    <div class="main-banner banner-center banner-home banner-<?php echo $_smarty_tpl->tpl_vars['siteBannerStyle']->value;?>
">
        <div class="container">
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
                <h1 class="banner-title">Ocean PBX Cloud-Based PBX</h1>
            <?php }?>
            </div>
        </div>
        <?php $_smarty_tpl->_subTemplateRender(((string)$_smarty_tpl->tpl_vars['template']->value)."/includes/common/svg-illustration.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('illustration'=>"site/banner-bg"), 0, true);
?> 
    </div>
	<div class="main-body ">
        <div class="container">
            <div class="">
                <div class="section text-center">
                    <div class="section-header">
                        <h2 class="section-title"><?php echo $_smarty_tpl->tpl_vars['LANG']->value['howcanwehelp'];?>
</h2>
                    </div>
                    <div class="section-body">
                        <div class="tiles row">
                            <?php if ($_smarty_tpl->tpl_vars['registerdomainenabled']->value || $_smarty_tpl->tpl_vars['transferdomainenabled']->value) {?>
                                <div class="col-md-3">
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
                            <div class="col-md-3">
                                <a class="tile tile-home" id="btnOrderHosting" href="<?php echo $_smarty_tpl->tpl_vars['WEB_ROOT']->value;?>
/cart.php">
                                    <div class="tile-icon">
                                        <?php $_smarty_tpl->_subTemplateRender(((string)$_smarty_tpl->tpl_vars['template']->value)."/includes/common/svg-icon.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('icon'=>"web-hosting"), 0, true);
?> 
                                    </div>
                                    <div class="tile-title"><?php echo $_smarty_tpl->tpl_vars['LANG']->value['orderhosting'];?>
</div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a class="tile tile-home" id="btnMakePayment" href="clientarea.php">
                                    <div class="tile-icon">
                                        <?php $_smarty_tpl->_subTemplateRender(((string)$_smarty_tpl->tpl_vars['template']->value)."/includes/common/svg-icon.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('icon'=>"comissions"), 0, true);
?> 
                                    </div>
                                    <div class="tile-title"><?php echo $_smarty_tpl->tpl_vars['LANG']->value['makepayment'];?>
</div>
                                </a>
                            </div>
                            <div class="col-md-3">
                                <a class="tile tile-home" id="btnGetSupport" href="submitticket.php">
                                    <div class="tile-icon">
                                        <?php $_smarty_tpl->_subTemplateRender(((string)$_smarty_tpl->tpl_vars['template']->value)."/includes/common/svg-icon.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('icon'=>"comments"), 0, true);
?>                                         
                                    </div>
                                    <div class="tile-title"><?php echo $_smarty_tpl->tpl_vars['LANG']->value['getsupport'];?>
</div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </div>
<?php }
}
}
