{if count($compare_plans['groups']) > 1 || !$display_billing_cycle}
    {$displayBestPrice = true}
{else}
    {$displayBestPrice = false}
    {foreach $compare_plans['groups'] as $group}
        {foreach from=$group['fields']['products_list'] key=key item=$product}
            {assign var='useDCDiscount' value=false}
            {assign var='billingCyclesCount' value=$billing_cycle_select|@count}
            {foreach from=$product['product']['price']['tabs'] key=tabKey item=$tab}
                {foreach from=$billing_cycle_select key=key item=$billing_cycle}
                    {if strtolower($billing_cycle) == $tabKey}
                        {append var='dataTempPrice' value=$tab['price'] index=$tabKey}
                        {append var='dataTempDiscount' value=$tab['discount']['value'] index=$tabKey}
                        {append var='dataTempDiscountPercentage' value=$tab['discount']['percentage'] index=$tabKey}
                        {append var='dataTempOldPrice' value=$tab['real_price'] index=$tabKey}
                        {if $tab['price'] != $tab['real_price'] && $tab['real_price'] !== "0.00" && $tab['price'] != "Not Available"}                   
                            {assign var='useDCDiscount' value=true}
                        {/if}
                    {/if}
                {/foreach}
            {/foreach}
            {append var='dataPrice' value=$dataTempPrice index=$product['product_id']}
            {append var='dataDiscount' value=$dataTempDiscount index=$product['product_id']} 
            {append var='dataDiscountPercentage' value=$dataTempDiscountPercentage index=$product['product_id']} 
            {append var='dataOldPrice' value=$dataTempOldPrice index=$product['product_id']} 
        {/foreach}
    {/foreach}  
	{foreach from=$billing_cycle_select|@array_reverse:true key=key item=$billing_cycle}
		{if $billing_cycle@first}
			{assign var="firstBillingCycle" value=$billing_cycle|lower}
		{/if}
	{/foreach}      
{/if}

<div class="site-section section-compare-packages section-{$theme}{if $custom_class} {$custom_class}{/if}" id="comparePackages">
    {include file="{$smarty.current_dir}/../../common/anchor.tpl"} 
    <div class="container">
        {if $title}
            <h2 class="section-title">{$title|unescape:'html'}</h2>
        {/if}
        {if $subtitle}
            <p class="section-subtitle">{$subtitle|unescape:'html'}</p>
        {/if}
        <div class="section-content" data-sticky-header-container>
			{if count($compare_plans['groups']) > 1}
				<div class="tabs content-slider--horizontal content-slider--free-mode" >
					<ul class="nav nav-lg nav-tabs nav-tabs-slider content-slider-wrapper">
						{foreach from=$compare_plans['groups'] key=key item=$group}
							<li class="content-slider-item nav-item">
								<a class="nav-link {if $group@first}active{/if}" data-multitab data-multitab-target="#tab-{strtolower($group['group_name']|replace:" ":"-"|replace:"/":"-")}" href='#tab-compare-{strtolower($group['group_name']|replace:" ":"-"|replace:"/":"-")}' data-toggle="tab" data-plan-tab>
									{$group['group_name']|unescape:'html'}
								</a>
							</li>
						{/foreach}
					</ul>
				</div>
			{/if}
			<div class="tab-content">
				{foreach $compare_plans['groups'] as $group}
					<div class="tab-pane {if $group@first}active{/if}" id='tab-compare-{strtolower($group['group_name']|replace:" ":"-"|replace:"/":"-")}'>
						<div class="section-header-sticky plan" data-js-plan-container data-section-header-sticky>
							<div class="plan-header-sticky" data-js-plan data-plan-header-sticky>
								<div class="container {if $group['fields']['products_list']|@count > 4} section-fade {/if}" data-plan-header-sticky-container>
									<div class="swiper-inner-wrapper" data-plan-header-swiper-inner-wrapper>
										<div class="swiper-container" data-js-plan-slider>
											<div class="plan__wrapper swiper-wrapper plan-wrapper" {if $group['fields']['products_list']|@count == 3} data-slide-width='["308.67", "308.67", "333", "200", "130"]' {/if} {if $group['fields']['products_list']|@count > 3} data-slide-width='["232", "232", "232", "232", "130"]' {/if} data-plan-header-swiper-wrapper>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="section-main-wrapper" data-js-plan-container>
							<div class="section-main-plan" data-js-plan>
								<div class="slider-nav " data-js-plan-nav>
									<a class="js-previous-plan is-disabled" data-js-plan-prev>
										{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="arrow-left"}
									</a>
									<a class="js-next-plan" data-js-plan-next>
										{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="arrow-right"}
									</a>
								</div>
								<div class="hidden" data-sticky-header>
									<span data-sticky-header-top>{$rslang->trans('packages.choose_your_plan')}</span>
									<span data-sticky-header-bottom><a href="javascript:void(Tawk_API.toggle())">{$rslang->trans('packages.chat_with_expert')}</a></span>
								</div>
								<div class="compare-plans" id="plan1" data-js-plan-slider-wrapper>
									<div class="loader section-loader" data-plan-loader>
										{include file="{$smarty.current_dir}/../../../../../includes/common/loader.tpl"}  
									</div>
									<div class="plan-sticky visibility-hidden-md" data-plan-sticky="" ></div>
									<div class="package-background visibility-hidden-md" data-package-background></div>
									<div class="package package-header-primary package-compare package-compare-first visibility-hidden-md" data-package>
										<div class="package-header package-desc-center" data-package-header>
											<h3>{$rslang->trans('packages.compare')}</h3>
										</div>
										<div class="package-body-compare" data-package-footer>
											<div class="compare-item">
									Websites Hosted
									<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
										{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
									</span> 
								</div>
								<div class="compare-item">
									SSD DIsk Space
									<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
										{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
									</span> 
								</div>
								<div class="compare-item">
									Suitable Monthly Visits
									<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
										{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
									</span> 
								</div>
								<div class="compare-item">
									Bandwidth
									<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
										{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
									</span> 
								</div>
								<div class="compare-item">
									Addon Domains
									<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
										{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
									</span> 
								</div>
								<div class="compare-item">
									Subdomains
									<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
										{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
									</span> 
								</div>
										</div>
									</div>
									<div class="mobile-slider swiper-container" data-js-plan-slider>
										<div class="swiper-wrapper plan-wrapper d-flex flex-nowrap">
											{foreach from=$group['fields']['products_list'] key=product_key item=$product name=foo}	
												<div class="swiper-slide" {if $group['fields']['products_list']|@count == 3} data-slide-width='["308.67", "308.67", "333", "200", "200"]' {/if} {if $group['fields']['products_list']|@count > 3} data-slide-width='["232", "232", "232", "232", "130"]' {/if}>
													<div class="package package-header-primary package-compare {if $smarty.foreach.foo.last}last-package{/if}" data-package>
														<div class="package-header" data-package-header>
															<h3 class="package-title">{$product.product.name}</h3>
															<div class="package-available">
																<div class="package-price" data-pricing-container>
																	{if $displayBestPrice}
																		<div class="price">
																			<span class="price-currency h2">{$WHMCSCurrency.prefix}</span><span class="price-ammount h2">{$product.product.price.single.best}</span><span class="price-period">/{$LANG['pricingCycleShort']['monthly']}</span>
																		</div>
																		{if $product.product.price.single.discount.applied === true}
																			<div class="price-discount">
																				<span class="price-discount-old">
																					{if $product.product.price.tabs[$product.product.price.single.bestCycle].price != $product.product.price.tabs[$product.product.price.single.bestCycle].real_price}
																						<span class="price-discount-currency">{$WHMCSCurrency.prefix}</span><span class="price-discount-ammount">{$product.product.price.tabs[$product.product.price.single.bestCycle].real_price}</span>
																					{else}                                            
																						<span class="price-discount-currency">{$WHMCSCurrency.prefix}</span><span class="price-discount-ammount">{$WHMCSCurrency.prefix}{$product.product.price.single.worst}</span>
																					{/if}
																				</span>
																				<span class="price-discount-save label label-primary">
																					{$rslang->trans('packages.save')}&nbsp;
																					<span>{$product.product.price.single.discount.percentage}</span>%
																				</span>
																			</div>
																		{/if}
																	{else}
																		<div class="price">
																			<span class="price-currency h2">{$WHMCSCurrency.prefix}</span><span class="price-ammount h2" data-price='[{foreach from=$dataPrice[$product['product_id']] item=$price}"{$price}"{if !$price@last},{/if}{/foreach}]'>{$dataPrice[$product['product_id']][$firstBillingCycle]}</span><span class="price-period" data-pricing-period='[{for $i=1 to $billingCyclesCount}"/{$LANG['pricingCycleShort']['monthly']}"{if $i != $billingCyclesCount},{/if}{/for}]'>/{$LANG['pricingCycleShort']['monthly']}</span>
																		</div>
																		{if $useDCDiscount || $product['product']['price']['single']['worst'] != "0.00"}
																			<div class="price-discount">
																				<span class="price-discount-old">
																					{if $useDCDiscount}
																						<span class="price-discount-currency">{$WHMCSCurrency.prefix}</span><span class="price-discount-ammount" data-price-old='[{foreach from=$dataOldPrice[$product['product_id']] item=$price}"{$price}"{if !$price@last},{/if}{/foreach}]'>{$dataOldPrice[$product['product_id']][$firstBillingCycle]}</span>
																					{else}
																						{assign var="worstPrice" value=$product['product']['price']['single']['worst']}
																						<span class="price-discount-currency">{$WHMCSCurrency.prefix}</span><span class="price-discount-ammount" data-price-old data-price-old='[{for $i=1 to $billingCyclesCount}"{$worstPrice}"{if $i != $billingCyclesCount},{/if}{/for}]'>{$WHMCSCurrency.prefix}{$worstPrice}</span>
																					{/if}
																				</span>
																				<span class="price-discount-save label label-primary">
																					{$rslang->trans('packages.save')}&nbsp;
																					<span data-price-discount='[{foreach from=$dataDiscountPercentage[$product['product_id']] item=$discount}"{$discount}"{if !$discount@last},{/if}{/foreach}]'> {$dataDiscountPercentage[$product['product_id']][$firstBillingCycle]}</span>%
																				</span>
																			</div>
																		{/if}
																	{/if}												
																</div>
																<div class="package-actions">
																	<a href="/cart.php?a=add&pid={$product.product_id}?billingcycle={$product.product.price.single.bestCycle}" data-href="/cart.php?a=add&pid={$product['product']['id']}" class="btn btn-secondary btn-lg" data-plan-link='[{foreach from=$billing_cycles key=key item=$billing_cycle}"&billingcycle={$billing_cycle|lower}"{if !$billing_cycle@last},{/if}{/foreach}]'>
																		<span class="btn-text">{$LANG.domainordernow}</span>
																	</a>
																</div>
															</div>
															<div class="package-not-available">
																<span class="h5"> {$LANG.serverstatusnotavailable}</span>
																<span class="p-4">
																	{$rslang->trans('packages.not_available_desc')}
																</span>
															</div>	
														</div>
														<div class="package-body-compare" data-package-footer>
															<div class="compare-item">1 Website</div>
												<div class="compare-item">20 GB</div>
												<div class="compare-item">~25 000 Visits</div>
												<div class="compare-item">{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-error"}</div>
												<div class="compare-item">Unlimited</div>
												<div class="compare-item">{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-check"} </div>
														</div>
														{* {include file="templates/lagom2/core/cms/sections/config/web-hosting-compare-packages/compare-packages.tpl" product_index=$product@index} *}
													</div>
												</div>
											{/foreach}									
										</div>
									</div>

								</div>
								<div data-plan-sticky-bottom></div>
							</div>
							<div class="section-collapse" data-compare-packages-collapse>
								<div class="section-collapse-item collapsed" data-toggle="collapse" data-target="#compare-packages-1"
									aria-expanded="false" aria-controls="compare-packages-1" data-js-plan-container data-compare-packages-item>
									<div class="collapse-item-top h5">
										<i class="lm lm-plus"></i>
										Security & Reliability
									</div>
									<div class="collapse-item-content collapse" id="compare-packages-1">
											<div class="collapse-item-packages" id="plan1" data-js-plan>
												<div class="package package-compare package-compare-first package-collapse">
													<div class="package-body-compare">
														<div class="compare-item">
															Websites Hosted
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
														<div class="compare-item">
															SSD DIsk Space
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
														<div class="compare-item">
															Suitable Monthly Visits
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
														<div class="compare-item">
															Bandwidth
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
														<div class="compare-item">
															Addon Domains
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
														<div class="compare-item">
															Subdomains
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
													</div>
												</div>
												<div class="mobile-slider swiper-container visibility-hidden-md" data-js-plan-slider>
													<div class="swiper-wrapper plan-wrapper d-flex flex-nowrap">
														{foreach from=$group['fields']['products_list'] key=key item=$product name=foo}
															<div class="swiper-slide">
																<div class="package package-compare package-collapse {if $smarty.foreach.foo.last}last-package{/if}">
																	<div class="package-body-compare">
																		<div class="compare-item">1 Website</div>
																		<div class="compare-item">20 GB</div>
																		<div class="compare-item">~25 000 Visits</div>
																		<div class="compare-item">{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-error"}</div>
																		<div class="compare-item">Unlimited</div>
																		<div class="compare-item">{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-check"} </div>
																	</div>
																</div>
															</div>
														{/foreach}
													</div>
												</div>
											</div>
									</div>
								</div>
								<div class="section-collapse-item collapsed" data-toggle="collapse" data-target="#compare-packages-2"
									aria-expanded="false" aria-controls="compare-packages-2" data-js-plan-container data-compare-packages-item>
									<div class="collapse-item-top h5">
										<i class="lm lm-plus"></i>
										Website Performance Features
									</div>
									<div class="collapse-item-content collapse" id="compare-packages-2">
											<div class="collapse-item-packages" id="plan2" data-js-plan>
												<div class="package package-compare package-compare-first package-collapse">
													<div class="package-body-compare">
														<div class="compare-item">
															Websites Hosted
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
														<div class="compare-item">
															SSD DIsk Space
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
														<div class="compare-item">
															Suitable Monthly Visits
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
														<div class="compare-item">
															Bandwidth
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
														<div class="compare-item">
															Addon Domains
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
														<div class="compare-item">
															Subdomains
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
													</div>
												</div>
												<div class="mobile-slider swiper-container" data-js-plan-slider>
													<div class="swiper-wrapper plan-wrapper d-flex flex-nowrap">
														{foreach from=$group['fields']['products_list'] key=key item=$product name=foo}
															<div class="swiper-slide">
																<div class="package package-compare package-collapse {if $smarty.foreach.foo.last}last-package{/if}">
																	<div class="package-body-compare">
																		<div class="compare-item">1 Website</div>
																		<div class="compare-item">20 GB</div>
																		<div class="compare-item">~25 000 Visits</div>
																		<div class="compare-item">{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-error"}</div>
																		<div class="compare-item">Unlimited</div>
																		<div class="compare-item">{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-check"} </div>
																	</div>
																</div>
															</div>
														{/foreach}
													</div>
												</div>
											</div>
									</div>
								</div>
								<div class="section-collapse-item collapsed" data-toggle="collapse" data-target="#compare-packages-3"
									aria-expanded="false" aria-controls="compare-packages-3" data-js-plan-container data-compare-packages-item>
									<div class="collapse-item-top h5">
										<i class="lm lm-plus"></i>
										Email Features
									</div>
									<div class="collapse-item-content collapse" id="compare-packages-3">
											<div class="collapse-item-packages" id="plan3" data-js-plan>
												<div class="package package-compare package-compare-first package-collapse">
													<div class="package-body-compare">
														<div class="compare-item">
															Websites Hosted
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
														<div class="compare-item">
															SSD DIsk Space
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
														<div class="compare-item">
															Suitable Monthly Visits
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
														<div class="compare-item">
															Bandwidth
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
														<div class="compare-item">
															Addon Domains
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
														<div class="compare-item">
															Subdomains
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
													</div>
												</div>
												<div class="mobile-slider swiper-container" data-js-plan-slider>
													<div class="swiper-wrapper plan-wrapper d-flex flex-nowrap">
														{foreach from=$group['fields']['products_list'] key=key item=$product name=foo}
															<div class="swiper-slide"  data-slide-width='["308.67", "308.67", "333", "200", "200"]'>
																<div class="package package-compare package-collapse {if $smarty.foreach.foo.last}last-package{/if}">
																	<div class="package-body-compare">
																		<div class="compare-item">1 Website</div>
																		<div class="compare-item">20 GB</div>
																		<div class="compare-item">~25 000 Visits</div>
																		<div class="compare-item">{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-error"}</div>
																		<div class="compare-item">Unlimited</div>
																		<div class="compare-item">{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-check"} </div>
																	</div>
																</div>
															</div>
														{/foreach}
													</div>
												</div>
											</div>
									</div>
								</div>
								<div class="section-collapse-item collapsed" data-toggle="collapse" data-target="#compare-packages-4"
									aria-expanded="false" aria-controls="compare-packages-4" data-js-plan-container data-compare-packages-item>
									<div class="collapse-item-top h5">
										<i class="lm lm-plus"></i>
										Developer Features
									</div>
									<div class="collapse-item-content collapse" id="compare-packages-4">
											<div class="collapse-item-packages" id="plan4" data-js-plan>
												<div class="package package-compare package-compare-first package-collapse">
													<div class="package-body-compare">
														<div class="compare-item">
															Websites Hosted
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
														<div class="compare-item">
															SSD DIsk Space
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
														<div class="compare-item">
															Suitable Monthly Visits
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
														<div class="compare-item">
															Bandwidth
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
														<div class="compare-item">
															Addon Domains
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
														<div class="compare-item">
															Subdomains
															<span data-toggle="tooltip" data-title=" Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" aria-label="Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip Comparision table test tooltip" data-placement="right">
																{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-info"}
															</span> 
														</div>
													</div>
												</div>
												<div class="mobile-slider swiper-container" data-js-plan-slider>
													<div class="swiper-wrapper plan-wrapper d-flex flex-nowrap">
														{foreach from=$group['fields']['products_list'] key=key item=$product name=foo}
															<div class="swiper-slide">
																<div class="package package-compare package-collapse {if $smarty.foreach.foo.last}last-package{/if}">
																	<div class="package-body-compare">
																		<div class="compare-item">1 Website</div>
																		<div class="compare-item">20 GB</div>
																		<div class="compare-item">~25 000 Visits</div>
																		<div class="compare-item">{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-error"}</div>
																		<div class="compare-item">Unlimited</div>
																		<div class="compare-item">{include file="{$smarty.current_dir}/../../../../../includes/common/svg-icon.tpl" icon="comparision-table-check"} </div>
																	</div>
																</div>
															</div>
														{/foreach}
													</div>
												</div>
											</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				{/foreach}
			</div>		
        </div>
		{if $buttons}
            <div class="section-actions">
                <div class="section-actions-buttons">
                    {foreach $buttons as $button}
                        {include file="{$smarty.current_dir}/../../../cms/sections/common/button.tpl"}
                    {/foreach}
                </div>
            </div>
        {/if}
    </div>
</div>     