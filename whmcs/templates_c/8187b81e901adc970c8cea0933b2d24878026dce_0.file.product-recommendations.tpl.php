<?php
/* Smarty version 3.1.48, created on 2024-09-03 11:59:52
  from '/var/www/html/templates/orderforms/lagom2/includes/product-recommendations.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_66d6fa3839e2a9_18433586',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '8187b81e901adc970c8cea0933b2d24878026dce' => 
    array (
      0 => '/var/www/html/templates/orderforms/lagom2/includes/product-recommendations.tpl',
      1 => 1694185706,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:templates/orderforms/".((string)$_smarty_tpl->tpl_vars[\'carttpl\']->value)."/includes/overwrites/product-recommendations.tpl' => 1,
  ),
),false)) {
function content_66d6fa3839e2a9_18433586 (Smarty_Internal_Template $_smarty_tpl) {
if (file_exists("templates/orderforms/".((string)$_smarty_tpl->tpl_vars['carttpl']->value)."/includes/overwrites/product-recommendations.tpl")) {?>
    <?php $_smarty_tpl->_subTemplateRender("file:templates/orderforms/".((string)$_smarty_tpl->tpl_vars['carttpl']->value)."/includes/overwrites/product-recommendations.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, true);
} else { ?>
    <?php if (!empty($_smarty_tpl->tpl_vars['lastProduct']->value)) {?>
    <div class="product-added-panel">
        <div class="product-added-body">
            <div class="product-added-icon">
                <i class="lm lm-check"></i>
            </div>
            <div class="product-added-info">
                <div>
                    <span class="product-name">&nbsp;<?php echo $_smarty_tpl->tpl_vars['lastProduct']->value['product']['name'];?>
 - </span>
                    <span class="product-group">&nbsp;<?php echo $_smarty_tpl->tpl_vars['lastProduct']->value['product']['productGroup']['name'];?>
</span>
                </div>
                <div>
                    <span class="product-price">
                        <?php if (!$_smarty_tpl->tpl_vars['lastProduct']->value['pricing']->isFree()) {?>
                            &nbsp;<?php echo $_smarty_tpl->tpl_vars['lastProduct']->value['pricing']->price()->toFull();?>

                            <?php if ($_smarty_tpl->tpl_vars['lastProduct']->value['pricing']->setup() && $_smarty_tpl->tpl_vars['lastProduct']->value['pricing']->setup()->toNumeric() > 0) {?>
                                + <?php echo $_smarty_tpl->tpl_vars['lastProduct']->value['pricing']->setup()->toFull();?>
 <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['lang'][0], array( array('key'=>"ordersetupfee"),$_smarty_tpl ) );?>

                            <?php }?>
                        <?php }?>
                    </span>
                    <span class="product-cycle">&nbsp;<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['lang'][0], array( array('key'=>('orderpaymentterm').($_smarty_tpl->tpl_vars['lastProduct']->value['pricing']->cycle())),$_smarty_tpl ) );?>
</span>
                </div>
            </div>
        </div>
    </div>
    <?php }?>
    <div class="product-recommendations-container">
        <div class="product-recommendations">
            <?php if (in_array($_smarty_tpl->tpl_vars['templatefile']->value,array('viewcart','checkout','complete'))) {?>
                <h5 class="recommendation-title"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['lang'][0], array( array('key'=>"recommendations.explain.product"),$_smarty_tpl ) );?>
</h5>
            <?php } elseif (!$_smarty_tpl->tpl_vars['recommendStyle']->value && $_smarty_tpl->tpl_vars['templatefile']->value != 'complete') {?>
                <h5 class="recommendation-title"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['lang'][0], array( array('key'=>"recommendations.explain.generic"),$_smarty_tpl ) );?>
</h5>
            <?php } elseif ($_smarty_tpl->tpl_vars['templatefile']->value == 'complete') {?>
                <div>
                    <h4 class="recommendation-title"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['lang'][0], array( array('key'=>"recommendations.title.generic"),$_smarty_tpl ) );?>
</h4>
                    <p class="">
                        <?php if (!empty($_smarty_tpl->tpl_vars['productRecommendations']->value['order'])) {?>
                            <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['lang'][0], array( array('key'=>"recommendations.title.yourOrder"),$_smarty_tpl ) );?>

                        <?php } else { ?>
                            <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['lang'][0], array( array('key'=>"recommendations.title.yourProducts"),$_smarty_tpl ) );?>

                        <?php }?>
                    </p>
                </div>
            <?php }?>
            <?php if ($_smarty_tpl->tpl_vars['productRecommendations']->value) {?>
                <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['productRecommendations']->value, 'categoryRecommendations', false, 'categoryKey');
$_smarty_tpl->tpl_vars['categoryRecommendations']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['categoryKey']->value => $_smarty_tpl->tpl_vars['categoryRecommendations']->value) {
$_smarty_tpl->tpl_vars['categoryRecommendations']->do_else = false;
?>
                    <?php if ($_smarty_tpl->tpl_vars['templatefile']->value == 'complete' && $_smarty_tpl->tpl_vars['categoryKey']->value == 'own' && !empty($_smarty_tpl->tpl_vars['productRecommendations']->value['own']) && !empty($_smarty_tpl->tpl_vars['productRecommendations']->value['order'])) {?>
                        <h5 class="recommendation-title">
                            <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['lang'][0], array( array('key'=>"recommendations.title.yourProducts"),$_smarty_tpl ) );?>

                        </h5>
                    <?php }?>
                    <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['categoryRecommendations']->value, 'categoryRecommendation');
$_smarty_tpl->tpl_vars['categoryRecommendation']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['categoryRecommendation']->value) {
$_smarty_tpl->tpl_vars['categoryRecommendation']->do_else = false;
?>
                        <?php if ($_smarty_tpl->tpl_vars['recommendStyle']->value && $_smarty_tpl->tpl_vars['templatefile']->value != 'complete') {?>
                            <h5 class="recommendation-title"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['lang'][0], array( array('key'=>"recommendations.explain.ordered",'productName'=>$_smarty_tpl->tpl_vars['categoryRecommendation']->value['name']),$_smarty_tpl ) );?>
</h5>
                        <?php }?>
                        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['categoryRecommendation']->value['recommendations'], 'recommendation');
$_smarty_tpl->tpl_vars['recommendation']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['recommendation']->value) {
$_smarty_tpl->tpl_vars['recommendation']->do_else = false;
?>
                            <?php $_smarty_tpl->_assignInScope('price', $_smarty_tpl->tpl_vars['recommendation']->value->pricing()->first());?>
                            <div class="product-recommendation" data-color="<?php echo $_smarty_tpl->tpl_vars['recommendation']->value['color'];?>
">
                                <div class="el-left" style="background-color:<?php echo $_smarty_tpl->tpl_vars['recommendation']->value->color;?>
;"></div>
                                <div class="product-recommendation-content<?php if (!$_smarty_tpl->tpl_vars['recommendation']->value['shortDescription']) {?> header-static<?php }?>">
                                    <h6 class="product-recommendation-title truncate"><?php echo $_smarty_tpl->tpl_vars['recommendation']->value['productGroup']['name'];?>
 - <?php echo $_smarty_tpl->tpl_vars['recommendation']->value['name'];?>
</h6>
                                    <p class="product-recommendation-desc truncate">
                                        <?php echo $_smarty_tpl->tpl_vars['recommendation']->value['shortDescription'];?>

                                    </p>
                                </div>
                                <div class="product-recommendation-footer">
                                    <div class="product-recommendation-price">
                                        <h4 <?php if (!$_smarty_tpl->tpl_vars['recommendation']->value->isFree()) {?>class="w-hidden hidden"<?php }?>><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['lang'][0], array( array('key'=>"orderfree"),$_smarty_tpl ) );?>
</h4>
                                        <?php if (!$_smarty_tpl->tpl_vars['recommendation']->value->isFree() && $_smarty_tpl->tpl_vars['price']->value) {?>
                                            <h4 class="breakdown-price">
                                                <?php if ($_smarty_tpl->tpl_vars['price']->value->isOneTime()) {?>
                                                    <?php echo $_smarty_tpl->tpl_vars['price']->value->price()->toFull();?>

                                                <?php } elseif ($_smarty_tpl->tpl_vars['price']->value->isRecurring()) {?>
                                                    <?php echo $_smarty_tpl->tpl_vars['price']->value->breakdownPrice();?>

                                                <?php }?>
                                            </h4>
                                        <?php }?>
                                        <?php if (!$_smarty_tpl->tpl_vars['recommendation']->value->isFree() && !is_null($_smarty_tpl->tpl_vars['price']->value->setup()) && $_smarty_tpl->tpl_vars['price']->value->setup()->toNumeric() > 0) {?>
                                            <span class="setup-fee"><small><?php echo $_smarty_tpl->tpl_vars['price']->value->setup()->toFull();?>
&nbsp;<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['lang'][0], array( array('key'=>"ordersetupfee"),$_smarty_tpl ) );?>
</small></span>
                                        <?php }?>
                                    </div>
                                    <div class="product-recommendation-actions">
                                        <a class="btn btn-sm btn-add" href="<?php echo $_smarty_tpl->tpl_vars['recommendation']->value->getRoutePath();?>
" role="button" style="background-color:<?php echo $_smarty_tpl->tpl_vars['recommendation']->value->color;?>
;">
                                            <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['lang'][0], array( array('key'=>"addtocart"),$_smarty_tpl ) );?>

                                        </a>
                                    </div>
                                </div>
                            </div>
                        <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                    <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
                <?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
            <?php }?>
        </div>
    </div>
<?php }?>    <?php }
}
