<?php
/* Smarty version 3.1.48, created on 2024-09-03 11:56:28
  from '/var/www/html/templates/lagom2/includes/common/svg-icon.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_66d6f96c3a47f1_60604312',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ecbcd3579bc1a9a64340840b876e3bcd0b3a249f' => 
    array (
      0 => '/var/www/html/templates/lagom2/includes/common/svg-icon.tpl',
      1 => 1681719928,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_66d6f96c3a47f1_60604312 (Smarty_Internal_Template $_smarty_tpl) {
if (file_exists("templates/".((string)$_smarty_tpl->tpl_vars['template']->value)."/includes/common/overwrites/svg-icon.tpl")) {?>
    <?php $_smarty_tpl->_subTemplateRender(((string)$_smarty_tpl->tpl_vars['template']->value)."/includes/common/overwrites/svg-icon.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
} else { ?>
    <?php if (file_exists("templates/".((string)$_smarty_tpl->tpl_vars['template']->value)."/assets/svg-icon/custom/".((string)$_smarty_tpl->tpl_vars['icon']->value).".tpl")) {?>
        <?php if ((isset($_smarty_tpl->tpl_vars['onDark']->value))) {?>
            <?php $_smarty_tpl->_subTemplateRender(((string)$_smarty_tpl->tpl_vars['template']->value)."/assets/svg-icon/custom/".((string)$_smarty_tpl->tpl_vars['icon']->value).".tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('onDark'=>$_smarty_tpl->tpl_vars['onDark']->value), 0, true);
?>
        <?php } else { ?>
            <?php $_smarty_tpl->_subTemplateRender(((string)$_smarty_tpl->tpl_vars['template']->value)."/assets/svg-icon/custom/".((string)$_smarty_tpl->tpl_vars['icon']->value).".tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('onDark'=>false), 0, true);
?>
        <?php }?>
    <?php } elseif (file_exists("templates/".((string)$_smarty_tpl->tpl_vars['template']->value)."/assets/svg-icon/".((string)$_smarty_tpl->tpl_vars['icon']->value).".tpl")) {?>
        <?php if ((isset($_smarty_tpl->tpl_vars['onDark']->value))) {?>
            <?php $_smarty_tpl->_subTemplateRender(((string)$_smarty_tpl->tpl_vars['template']->value)."/assets/svg-icon/".((string)$_smarty_tpl->tpl_vars['icon']->value).".tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('onDark'=>$_smarty_tpl->tpl_vars['onDark']->value), 0, true);
?>
        <?php } else { ?>
            <?php $_smarty_tpl->_subTemplateRender(((string)$_smarty_tpl->tpl_vars['template']->value)."/assets/svg-icon/".((string)$_smarty_tpl->tpl_vars['icon']->value).".tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('onDark'=>false), 0, true);
?>
        <?php }?>
    <?php }
}
}
}
