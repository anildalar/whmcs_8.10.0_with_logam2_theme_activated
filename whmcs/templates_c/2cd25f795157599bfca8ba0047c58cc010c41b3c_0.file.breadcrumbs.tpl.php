<?php
/* Smarty version 3.1.48, created on 2024-09-05 08:58:08
  from '/var/www/html/modules/addons/RSThemes/views/adminarea/extensions/cms/includes/breadcrumbs.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_66d972a0cc95c5_52799852',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '2cd25f795157599bfca8ba0047c58cc010c41b3c' => 
    array (
      0 => '/var/www/html/modules/addons/RSThemes/views/adminarea/extensions/cms/includes/breadcrumbs.tpl',
      1 => 1720189766,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_66d972a0cc95c5_52799852 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="app-main__top">
    <div class="container">
        <div class="top">
            <div class="top__toolbar">
                <a class="btn btn--default btn--outline btn--icon btn--rounded btn--mob-link" href="<?php echo $_smarty_tpl->tpl_vars['helper']->value->url('Template@extensions',array('templateName'=>$_smarty_tpl->tpl_vars['template']->value->getMainName()));?>
">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M19 12H5" stroke="#393D45" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                        <path d="M12 19L5 12L12 5" stroke="#393D45" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                    </svg>                
                </a>
            </div>
            <div class="top__content">
                <div class="top__title">
                    <h1 class="top__title-text">
                        <ul class="top__title-text breadcrumb breadcrumb--angle-separator">
                            <li class="breadcrumb__item"><a href="<?php echo $_smarty_tpl->tpl_vars['helper']->value->url('Template@extensions',array('templateName'=>$_smarty_tpl->tpl_vars['template']->value->getMainName()));?>
" class="breadcrumb__item-text">Extensions</a></li>
                            <li class="breadcrumb__item"><span class="breadcrumb__item-text">CMS</span></li>
                        </ul>
                    </h1>
                    <?php if ($_smarty_tpl->tpl_vars['extension']->value->isActive()) {?>
                        <span class="label label--outline label--success m-l-2x">Active</span>
                    <?php }?>
                </div>
            </div>
            <div class="top__toolbar">
                <div class="has-dropdown">
                    <a class="btn btn--default btn--outline" href="" data-toggle="lu-dropdown" data-placement="bottom right">
                        <span class="btn__text">Actions</span>
                        <span class="caret m-l-1x" data-arrow-target></span>
                    </a>
                    <div class="dropdown" data-dropdown-menu>
                        <div class="dropdown__arrow" data-arrow></div>
                        <div class="dropdown__menu">
                            <ul class="nav">
                                <?php if ($_smarty_tpl->tpl_vars['extension']->value->isActive()) {?>
                                    <li class="nav__item">
                                        <a class="nav__link" href="#" data-toggle="lu-modal" data-target="#deactivateModal">
                                            <span class=" nav__link-icon  lm lm-close"></span>
                                            <span class="nav__link-text">Deactivate</span>
                                        </a>
                                    </li>
                                <?php } else { ?>
                                    <li class="nav__item hidden">
                                        <a class="nav__link" href="<?php echo $_smarty_tpl->tpl_vars['extension']->value->getLink('activate');?>
">
                                            <span class=" nav__link-icon lm lm-check"></span>
                                            <span class="nav__link-text">Activate</span>
                                        </a>
                                    </li>
                                <?php }?>
                                <li class="nav__item">
                                    <a class="nav__link" href="https://rsstudio.net/my-account/submitticket.php?step=2&deptid=2" target="_blank">
                                        <span class="nav__link-icon lm lm-denied""></span>
                                        <span class="nav__link-text">Report Bug</span>
                                    </a>
                                </li>
                                <li class="nav__divider"></li>
                                <li class="nav__item">
                                    <a class="nav__link" href="https://lagom.rsstudio.net/docs/" target="_blank">
                                        <span class="nav__link-icon lm lm-book"></span>
                                        <span class="nav__link-text">Docs</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="activateModal">
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <h4 class="top__title h6 m-b-0x">Before activate</h4>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon zmdi zmdi-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body">
                <p class="p-1">Warning, enable backup before activation !</p>
                <div class="text-center">
                    <a href="<?php echo $_smarty_tpl->tpl_vars['extension']->value->getLink('activate');?>
" class="btn btn--xlg btn--success">
                        <span class="btn__text">Activate</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal modal--hero" id="deactivateModal">
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <div class="top__title type-4 text-danger"><i class="ls ls-exclamation-circle m-r-2x"></i>Deactivate Extension</div>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon zmdi zmdi-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body">
                <p>Deactivate will stop all functions provided by specific  Lagom theme <br> extension.</p>
                <div class="form-check">
                    <label>
                        <input onchange="deleteSwitch(this)" type="checkbox" name="deleteAll" id="delete" class="form-checkbox">
                        &nbsp;<span class="form-indicator"></span>
                        <span class="form-text" style="padding-top: 12px;">Clear all data used by this extension: images, files, database entries etc.
                            <span class="font-weight-bold">Removed data cannot be restored!</span></span>
                    </label>
                </div>
            </div>
            <div class="modal__actions">
                <a id="deactivateSwitch" href="<?php echo $_smarty_tpl->tpl_vars['extension']->value->getLink('deactivate');?>
" class="btn btn--danger">
                    <span class="btn__text">Yes, Deactivate</span>
                </a>
                <button data-dismiss="lu-modal" aria-label="Close" type="button" class="btn btn--default btn--outline"><span class="btn__text">No</span></button>
            </div>
        </div>
    </div>
</div>

<?php echo '<script'; ?>
>
    
    function deleteSwitch(el) {
        if($(el).is(':checked')){
            $('#deactivateSwitch').attr('href', '<?php echo $_smarty_tpl->tpl_vars['extension']->value->getLink('deactivate');?>
&delete=1')
        }else{
            $('#deactivateSwitch').attr('href', '<?php echo $_smarty_tpl->tpl_vars['extension']->value->getLink('deactivate');?>
')
        }
    }
    
<?php echo '</script'; ?>
>
<?php }
}
