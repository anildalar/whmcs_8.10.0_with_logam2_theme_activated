<?php
/* Smarty version 3.1.48, created on 2024-09-05 09:13:29
  from '/var/www/html/templates/orderforms/lagom2/includes/viewcart/modal/remove-addon.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_66d97639909de6_07340436',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '025274917fde34c34dbe2bb7928211b2a09237d9' => 
    array (
      0 => '/var/www/html/templates/orderforms/lagom2/includes/viewcart/modal/remove-addon.tpl',
      1 => 1679479492,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_66d97639909de6_07340436 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="modal fade modal-remove-item" id="modalRemoveAddon" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="<?php echo $_smarty_tpl->tpl_vars['LANG']->value['orderForm']['close'];?>
">
                    <span aria-hidden="true"><i class="lm lm-close"></i></span>
                </button>
                <h3 class="modal-title">
                    <span><?php echo $_smarty_tpl->tpl_vars['LANG']->value['orderForm']['removeItem'];?>
</span>
                </h3>
            </div>
            <div class="modal-body">
                <?php echo $_smarty_tpl->tpl_vars['LANG']->value['cartremoveitemconfirm'];?>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-btn-loader data-remove-addon-confirm data-pid="" data-aid="" data-type="" onclick="removeAddonConfirm($(this));">
                    <span><?php echo $_smarty_tpl->tpl_vars['LANG']->value['yes'];?>
</span>
                    <div class="loader loader-button hidden" >
                        <?php $_smarty_tpl->_subTemplateRender(((string)$_smarty_tpl->tpl_vars['template']->value)."/includes/common/loader.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('classes'=>"spinner-sm spinner-light"), 0, true);
?>  
                    </div>
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $_smarty_tpl->tpl_vars['LANG']->value['no'];?>
</button>
            </div>
        </div>
    </div>
</div><?php }
}
