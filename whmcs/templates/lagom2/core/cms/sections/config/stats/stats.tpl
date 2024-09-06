{assign var=darkIcons value=false}
{if ($theme == "primary" || $theme == "secondary") && $features_style != "boxed"}
    {assign var=darkIcons value=true}
{/if}
<div class="site-section section-title-above section-stats section-features section-{$theme} {if $overlay} section-overlay{/if} {if $combined}section-combined{/if} {if $custom_class} {$custom_class}{/if}">
    {include file="{$smarty.current_dir}/../../common/anchor.tpl"} 
    <div class="container {if $display_features_slider}container-slider{/if} {if $features_slider_type == "screen-slider"}full-screen-slider{/if}">
        {if $caption}
            <span class="section-caption">{$caption|unescape:'html'}</span>
        {/if}
        {if $title}
            <h2 class="section-title">{$title|unescape:'html'}</h2>
        {/if}
        {if $subtitle}
            <div class="section-subtitle">{$subtitle|unescape:'html'}</div>
        {/if}
            <div class="section-content section-content-features content-slider-parent">
            {if is_array($stats_group['groups']) && count($stats_group['groups']) > 1}
            <div class="tabs-multiple-container {if is_array($stats_group['groups']) && count($stats_group['groups']) <= 1}no-tabs{/if}">
                {if is_array($stats_group['groups']) && count($stats_group['groups']) > 1}
                    <div class="tabs content-slider"  data-cms-content-slider>
                        <ul class="nav nav-lg nav-tabs nav-tabs-slider content-slider-wrapper" data-content-slider-wrapper>
                            {foreach from=$stats_group['groups'] key=key item=$group}
                                <li class="content-slider-item nav-item">
                                    <a class="nav-link {if $group@first}active{else}tab-not-clicked{if $features_slider_type == "screen-slider"}-screen-slider{/if}{/if}" data-multitab data-multitab-target="#tab-compare-{strtolower($group['group_name']|replace:" ":"-"|replace:"/":"-"|replace:"&amp;":"and")}-{$sectionId}" href='#tab-{strtolower($group['group_name']|replace:" ":"-"|replace:"/":"-"|replace:"&amp;":"and")}-{$sectionId}' data-toggle="tab" data-animation-init>
                                        <span class="nav-link-text">{$group['group_name']|unescape:'html'}</span>
                                    </a>
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                {/if}
            </div>
        {/if}
        {if is_array($stats_group['groups']) && count($stats_group['groups']) > 0}    
            <div class="tab-content">
                {foreach $stats_group['groups'] as $group}
                    {if isset($group['fields']['features']) && is_array($group['fields']['features']) && count($group['fields']['features']) > 0}
                        <div class="tab-pane tab-pane-features {if $group@first}active{/if}" id='tab-{strtolower($group['group_name']|replace:" ":"-"|replace:"/":"-"|replace:"&amp;":"and")}-{$sectionId}'>
                            {if $display_features_slider}
                                <div class="section-slider content-slider content-slider-features {if $features_slider_type == "screen-slider"}screen-slider" data-screen-slider-simple {else}" data-cms-content-slider{/if}>   
                                    <div class="slider-cover-before"></div>
                                    <div class="content-slider-wrapper row-eq-height {if $features_slider_type == "screen-slider"} screen-slider-wrapper" data-screen-slider-wrapper{else}" data-content-slider-wrapper{/if}>
                            {else}
                            <div class="row row-eq-height row-eq-height-xs row-lg">
                            {/if}
                                {foreach $group['fields']['features'] as $feature}     
                                    {include file="{$smarty.current_dir}/../../common/feature.tpl" 
                                        feature=$feature  
                                        featureStyle=$features_style 
                                        featureIconPosition=$features_icon_position
                                        featureSize=$features_size
                                        featureColsDesktop=$cols_desktop
                                        featureColsTabH=$cols_tab_h
                                        featureColsTabV=$cols_tab_v
                                        featureColsMob=$cols_mob
                                        featureCustomClasses=$features_custom_classes
                                        displaySlider=$display_features_slider
                                        featureSliderType=$features_slider_type
                                        theme=$darkIcons
                                    }
                                {/foreach}
                            </div>
                            {if $display_features_slider}
                                <div class="slider-cover-after"></div>
                                </div>  
                                <div class="swiper-button-next" data-next-slide>
                                    <i class="lm lm-arrow-thin-right"></i>
                                </div>
                                <div class="swiper-button-prev" data-prev-slide>
                                    <i class="lm lm-arrow-thin-left"></i>
                                </div>  
                            {/if}
                        </div>
                    {/if}    
                {/foreach}
            </div>
        {/if} 
            </div>    
        {if $buttons} 
            <div class="section-actions">
                <div class="section-actions-buttons">
                    {foreach $buttons as $button}
                        {include file="{$smarty.current_dir}/../../common/button.tpl"}
                    {/foreach}
                </div>
            </div>
        {/if}
    </div>   
</div> 