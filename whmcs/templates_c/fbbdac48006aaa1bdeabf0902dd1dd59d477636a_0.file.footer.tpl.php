<?php
/* Smarty version 3.1.48, created on 2024-09-01 00:52:20
  from '/var/www/html/templates/lagom2/footer.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_66d3bac4922ce7_81539874',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'fbbdac48006aaa1bdeabf0902dd1dd59d477636a' => 
    array (
      0 => '/var/www/html/templates/lagom2/footer.tpl',
      1 => 1681716328,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:templates/".((string)$_smarty_tpl->tpl_vars[\'template\']->value)."/core/layouts/footer/default/default.tpl' => 1,
  ),
),false)) {
function content_66d3bac4922ce7_81539874 (Smarty_Internal_Template $_smarty_tpl) {
if (file_exists("templates/".((string)$_smarty_tpl->tpl_vars['template']->value)."/overwrites/footer.tpl")) {?>
    <?php $_smarty_tpl->_subTemplateRender(((string)$_smarty_tpl->tpl_vars['template']->value)."/overwrites/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
} else { ?>
    <?php if ((isset($_smarty_tpl->tpl_vars['RSThemes']->value['footer-layouts']))) {?>
        <?php $_smarty_tpl->_subTemplateRender($_smarty_tpl->tpl_vars['RSThemes']->value['footer-layouts']['mediumPath'], $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>
    <?php } else { ?>
        <?php $_smarty_tpl->_subTemplateRender("file:templates/".((string)$_smarty_tpl->tpl_vars['template']->value)."/core/layouts/footer/default/default.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>
    <?php }
}
}
}
