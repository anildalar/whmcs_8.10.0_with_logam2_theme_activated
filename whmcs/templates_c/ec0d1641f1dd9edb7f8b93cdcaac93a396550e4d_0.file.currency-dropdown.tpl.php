<?php
/* Smarty version 3.1.48, created on 2024-09-03 11:56:28
  from '/var/www/html/templates/lagom2/includes/common/currency-dropdown.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_66d6f96c2fb625_07026968',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ec0d1641f1dd9edb7f8b93cdcaac93a396550e4d' => 
    array (
      0 => '/var/www/html/templates/lagom2/includes/common/currency-dropdown.tpl',
      1 => 1714211436,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_66d6f96c2fb625_07026968 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/var/www/html/vendor/smarty/smarty/libs/plugins/modifier.replace.php','function'=>'smarty_modifier_replace',),));
if (file_exists("templates/".((string)$_smarty_tpl->tpl_vars['template']->value)."/includes/common/overwrites/currency-dropdown.tpl")) {?>
     <?php $_smarty_tpl->_subTemplateRender(((string)$_smarty_tpl->tpl_vars['template']->value)."/includes/common/overwrites/currency-dropdown.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
?>  
<?php } else { ?>
    <?php if (strstr($_smarty_tpl->tpl_vars['currentUrl']->value,"?")) {?>
        <?php $_smarty_tpl->_assignInScope('currentpagelinkback', rtrim($_smarty_tpl->tpl_vars['currentpagelinkback']->value,'&amp;'));?>
        <?php $_smarty_tpl->_assignInScope('divChar', "&amp;");?>
    <?php } else { ?>
        <?php $_smarty_tpl->_assignInScope('currentpagelinkback', rtrim($_smarty_tpl->tpl_vars['currentpagelinkback']->value,'?'));?>
        <?php $_smarty_tpl->_assignInScope('divChar', "?");?>
    <?php }?>
    <?php if ($_smarty_tpl->tpl_vars['pageType']->value == "website" && strstr($_smarty_tpl->tpl_vars['currentpagelinkback']->value,"cmsid")) {?>
        <?php $_smarty_tpl->_assignInScope('divChar', '');?>
        <?php $_smarty_tpl->_assignInScope('url', explode("?",$_smarty_tpl->tpl_vars['currentpagelinkback']->value));?>
        <?php $_smarty_tpl->_assignInScope('url2', explode("&amp;",$_smarty_tpl->tpl_vars['url']->value[1]));?>
        <?php $_smarty_tpl->_assignInScope('stringToReplace', ((string)$_smarty_tpl->tpl_vars['url2']->value[0]));?>
    <?php } else { ?>
        <?php $_smarty_tpl->_assignInScope('stringToReplace', '');?>
    <?php }?>
    <?php if (!$_smarty_tpl->tpl_vars['loggedin']->value && $_smarty_tpl->tpl_vars['currencies']->value && is_array($_smarty_tpl->tpl_vars['currencies']->value)) {?>
        <div class="dropdown-menu dropdown-menu-right">
            <div class="dropdown-menu-items has-scroll">
                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['currencies']->value, 'currency');
$_smarty_tpl->tpl_vars['currency']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['currency']->value) {
$_smarty_tpl->tpl_vars['currency']->do_else = false;
?>
                    <div class="dropdown-menu-item <?php if ($_smarty_tpl->tpl_vars['activeCurrency']->value['id'] == $_smarty_tpl->tpl_vars['currency']->value['id']) {?>active<?php }?>">
                        <a href="<?php echo smarty_modifier_replace($_smarty_tpl->tpl_vars['currentpagelinkback']->value,$_smarty_tpl->tpl_vars['stringToReplace']->value,'');
echo $_smarty_tpl->tpl_vars['divChar']->value;?>
currency=<?php echo $_smarty_tpl->tpl_vars['currency']->value['id'];?>
" rel="nofollow">
                            <span><?php echo $_smarty_tpl->tpl_vars['currency']->value['code'];?>
</span>
                        </a>
                    </div>
                <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
            </div>                 
        </div>
    <?php }
}
}
}
