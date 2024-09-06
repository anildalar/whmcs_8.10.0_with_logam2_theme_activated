{if file_exists("{$smarty.current_dir}/overwrites/package.tpl")}
    {include file="{$smarty.current_dir}/overwrites/package.tpl"}  
{else}
    {include file="{$smarty.current_dir}/feature-cols.tpl"}
    <div class="{if $productType == "horizontal"} col-12 {else}{foreach $cols as $col} {$col}{/foreach}{/if} package-col {if $featureSlider}content-slider-item{/if}">
        {if $productType == "condensed" || $productType == "graphic"}
            {$actionCycle = false}
            {$actionDataPeriod = false}
            {if $product.product.price.type == "recurring"}  
                {if $displayBestPrice}
                    {$actionCycle = $product.product.price.bestCycle}
                {else}
                    {$actionCycle = $firstAvailableCycle}
                    {if !$displayFirstAvailableCycle}
                        {$actionDataPeriod = $product.product.price.tabs}
                    {/if}
                {/if}
            {/if}
        {/if}    
        {if $productType == "graphic"}
            {if isset($product.show_link) && $product.show_link == 1 && ((($product.link_type == "custom-url" || $product.link_type == "homepage") && $product.custom_url != "") ||  ($product.link_type == "whmcs-page" && $product.whmcs_page != ""))}
                <a href="{if $product.link_type == "custom-url" ||  $product.link_type == "homepage"}{if $product.link_type == "homepage" || $product.custom_url|substr:0:1 == "/"}{$WEB_ROOT}{/if}{$product.custom_url}{elseif $product.link_type == "whmcs-page"}{$WEB_ROOT}{if $product.url|substr:0:1 != "/"}/{/if}{$product.url}{/if}" class="package is-{$productStyle} {if $productType == "graphic"} package-type-graphic package-condensed package-sm{/if} {if $product.custom_classes} {$product.custom_classes}{/if}{if $productCustomClasses} {$productCustomClasses}{/if} {if !$displayBestPrice && !$displayFirstAvailableCycle && $product.product.price.tabs[$firstAvailableCycle].price == "-1"} is-disabled{/if}">
            {else}
                <a href="{$WEB_ROOT}/cart.php?a=add&pid={$product['product_id']}{if isset($actionCycle) && $actionCycle}&billingcycle={$actionCycle}{/if}" class="package is-{$productStyle} {if $productType == "graphic"} package-type-graphic package-condensed package-sm{/if} {if $product.custom_classes} {$product.custom_classes}{/if}{if $productCustomClasses} {$productCustomClasses}{/if} {if !$displayBestPrice && !$displayFirstAvailableCycle && $product.product.price.tabs[$firstAvailableCycle].price == "-1"} is-disabled{/if}">
            {/if}
        {else}
            <div class="package is-{$productStyle} {if $productType == "condensed"} package-sm{elseif $productType == "horizontal"} package-horizontal package-sm{/if} {if $productType != "default"} package-{$productType}{/if}{if $product.custom_classes} {$product.custom_classes}{/if}{if $productCustomClasses} {$productCustomClasses}{/if} {if !$displayBestPrice && !$displayFirstAvailableCycle && $product.product.price.tabs[$firstAvailableCycle].price == "-1"} is-disabled{/if}">
        {/if}
            {* Package Graphic *}
            {if $product['show_icon'] && ($product['icon'] || $product['font-icon'] || $product['media'] || $product['illustration'])}
                {if isset($product['illustration'])}
                    <div class="package-graphic package-illustration" data-animation-css>
                        {include file="{$smarty.current_dir}/graphic.tpl" 
                            graphic=$product['illustration']
                            type="illustration"
                        }
                    </div>
                {elseif isset($product['media'])}
                    <div class="package-graphic package-media">
                        {include file="{$smarty.current_dir}/graphic.tpl" 
                            graphic=$product['media']
                            type="media"
                        }
                    </div>
                {else}
                    <div class="package-graphic package-icon" data-animation-css>
                        {if isset($product['icon'])}
                            {include file="{$smarty.current_dir}/graphic.tpl" 
                                graphic=$product['icon']
                                type="icon"
                                theme=$theme
                            }
                        {elseif isset($product['font-icon'])}
                            <div class="font-icon {if isset($product['font-icon']) && $product['font-icon']|strstr:"fa-"} font-icon-fa{/if}">
                                <i class="{$product['font-icon']}"></i>
                            </div>
                        {/if}
                    </div>
                {/if}
            {/if}

            {* Package Title *}
            {if $productType != "horizontal"}
                <h3 class="package-title {if $productType == "condensed" || $productType == "graphic"} h6{/if}">
                    {$product['product']['name']}
                </h3>
            {/if}
            
            <div class="package-box">

                {* Package Header *}
                <div class="package-header">
                    {$packageDiscountHidden = false}
                    {$packageDiscountPrice = false}
                    {$packageDiscountValue = false}
                    {$packageDataDiscountPrice = false}
                    {$packagePriceValue = false}
                    {$packageMonthlyBreakdown = false}
                    {$packageCycle = false}
                    {$packageDataPrice = false}
                    {$packageDataPeriod = false}
                    {$startingfromtext = false}
                    {if $product.product.hasConfigurableOptions && $hide_starting_from == "0"}
                        {$startingfromtext = true}
                    {/if}
     
                    {if !isset($productType)}
                        {$productType = false}
                    {/if}

                    {* recurring products *}
                    {if $product.product.price.type == "recurring"}
                    {if $displayBestPrice}
                        {* get best cycle *}
                        {$bestCycle = $product.product.price.bestCycle} 

                        {* check discount *}
                        {if $product.product.price.tabs.$bestCycle.discount.applied === true}
                            {if $display_billing_monthly_price}
                                {$packageDiscountPrice = formatCurrency($product.product.price.tabs.$bestCycle.discount.before)}
                            {else}
                                {$packageDiscountPrice = formatCurrency($product.product.price.tabs.$bestCycle.discount.real_before)}
                            {/if}
                            {$packageDiscountValue = $product.product.price.tabs.$bestCycle.discount.percentage}
                        {/if}

                        {* get price *}
                        {if $display_billing_monthly_price}
                            {$packagePriceValue = formatCurrency($product.product.price.tabs[$bestCycle].price)}
                            {$packageMonthlyBreakdown = true}
                        {else}
                            {$packagePriceValue = formatCurrency($product.product.price.tabs[$bestCycle].real_price)}
                            {$packageCycle = $bestCycle}
                        {/if}
                    {else}
                        {* check if first cycle (billing switcher not active) *}
                        {if $displayFirstAvailableCycle}
                            {foreach $product.product.price.tabs key=key item=$tab}
                                {if $tab['price'] != "-1"}
                                    {$firstAvailableCycle = $key}
                                    {break}
                                {/if}
                            {/foreach}
                        {/if}      
                        
                        {* check discount *}
                        {if !$displayFirstAvailableCycle}
                            {$packageDataDiscountPrice = $product.product.price.tabs}
                        {/if}
                        {if $product.product.price.tabs.$firstAvailableCycle.discount.applied === true}
                            {if $display_billing_monthly_price}
                                {$packageDiscountPrice = formatCurrency($product.product.price.tabs.$firstAvailableCycle.discount.before)}
                            {else}
                                {$packageDiscountPrice = formatCurrency($product.product.price.tabs.$firstAvailableCycle.discount.real_before)}
                            {/if}
                            {$packageDiscountValue = $product.product.price.tabs.$firstAvailableCycle.discount.percentage}
                        {else}
                            {$packageDiscountHidden = true}    
                        {/if}

                        {* get price *}
                        {if $display_billing_monthly_price}
                            {if $product.product.price.tabs[$firstAvailableCycle].price == "-1"}
                                {$packagePriceValue = $LANG.unavailable}
                            {else}
                                {$packagePriceValue = formatCurrency($product.product.price.tabs[$firstAvailableCycle].price)}
                            {/if}
                            {$packageMonthlyBreakdown = true}
                        {else}
                            {if $product.product.price.tabs[$firstAvailableCycle].real_price == "-1"}
                                {$packagePriceValue = $LANG.unavailable}
                            {else}
                                {$packagePriceValue = formatCurrency($product.product.price.tabs[$firstAvailableCycle].real_price)}
                            {/if}
                            {$packageCycle = $firstAvailableCycle}
                        {/if}

                        {* get data price and periods *}
                        {if !$displayFirstAvailableCycle}
                            {$packageDataPrice = $product.product.price.tabs}
                            {if !$display_billing_monthly_price}
                                {$packageDataPeriod = $product.product.price.tabs}
                            {/if}    
                        {/if}
                    {/if}
                {elseif $product.product.price.type == "onetime"}
                    {$packagePriceValue = formatCurrency($product.product.price.tabs.onetime.price)}
                    {$packageCycle = "onetime"}
                {elseif $product.product.price.type == "free"}
                    {if isset($free_product_price) && $free_product_price == "enabled"}
                        {$packagePriceValue = $LANG.orderpaymenttermfree}
                    {else}
                        {$packagePriceValue = formatCurrency(0)}
                    {/if}
                {/if}   

                    {* Package Price *}
                    {include 
                        file="{$smarty.current_dir}/package/price.tpl"
                        discountPrice=$packageDiscountPrice
                        discountValue=$packageDiscountValue
                        type=$productType
                        priceValue=$packagePriceValue
                        montlyBreakdown=$packageMonthlyBreakdown
                        cycle=$packageCycle    
                        dataPrice=$packageDataPrice
                        dataPeriod=$packageDataPeriod
                        dataDiscountPrice=$packageDataDiscountPrice
                        discountHidden=$packageDiscountHidden
                        startingFrom=$startingfromtext
                    } 

                    {* Package Actions *}    
                    {if $productType == "default" || $productType == "horizontal"}
                        {include 
                            file="{$smarty.current_dir}/package/actions.tpl"
                            pid=$product['product_id']
                            cycle=$actionCycle
                            dataPeriod=$actionDataPeriod
                            classes=$product.custom_classes
                        }
                    {/if}
                </div>

                {* Package Body *}
                 {if ($productType == "horizontal" || (isset($product['custom_description']) && $product['custom_description'] != "") || $product['product']['description']) && $productType != "graphic"}
                    <div class="package-body">
                        {if $productType == "horizontal"}
                            <h3 class="package-title h6">
                                {$product['product']['name']}
                            </h3>
                        {/if}
                        {if isset($product['custom_description']) && $product['custom_description'] != ""}
                            <div class="package-content">           
                                {$product['custom_description']}
                            </div>          
                        {elseif $product['product']['description']}
                            <div class="package-content">
                                {$product['product']['description']}
                            </div>
                        {/if}
                    </div>
                {/if} 

                {* Package Actions Bottom *}   
                {if $productType == "condensed" || $productType == "graphic"}
                    {include 
                        file="{$smarty.current_dir}/package/actions.tpl"
                        pid=$product['product_id']
                        cycle=$actionCycle
                        dataPeriod=$actionDataPeriod
                        classes=$product.custom_classes
                        typePackage=$productType
                    }
                {/if}
            </div>
        {if $productType == "graphic"}
        </a>
        {else}
        </div>                
        {/if}
    </div>
{/if}    