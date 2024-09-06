{if file_exists("{$smarty.current_dir}/overwrites/graphic.tpl")}
    {include file="{$smarty.current_dir}/overwrites/graphic.tpl"}  
{else}
    {if $type == 'illustration'}
        {if $iconType != "modern" && $graphic|strstr:"/modern/"}
            {$graphic = $graphic|replace:'modern/':''}
        {/if}
        {include file="{$smarty.current_dir}/../../../../assets/svg-illustrations/$graphic"}
    {else if $type == 'media'}
    <img class="lazyload" data-src="{$WEB_ROOT}/templates/{$template}/assets/img/page-manager/{$graphic}" alt="{if $title || $caption}{if isset($pageSeoTitle)}{$pageSeoTitle|unescape:'html'|strip_tags} - {/if}{if $title}{$title|unescape:'html'|strip_tags}{elseif $caption}{$caption|unescape:'html'|strip_tags}{/if}{/if}">
    {else if $type == 'icon'}
        {if $theme == "primary" || $theme == "secondary"}
            {include file="{$smarty.current_dir}/../../../../assets/svg-icon/$graphic" onDark=true}
        {else}
            {include file="{$smarty.current_dir}/../../../../assets/svg-icon/$graphic"}
        {/if}
    {/if}
{/if}