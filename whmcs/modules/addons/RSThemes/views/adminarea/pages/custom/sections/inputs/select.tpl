{if isset($sectionGroupField)}
    <div class="form-group {$sectionGroupField['container_class']}" {foreach $sectionGroupField['container_attributes'] as $attribute} data-{$attribute['name']}="{$attribute['value']}" {/foreach}>
        <label class="form-label">{$sectionGroupField['label']}</label>
        <select class="form-control" name="sections[{$sectionIndex}][lang][{$sectionField['name']}][groups][{$groupIndex}][fields][{$sectionGroupField['name']}]" {foreach $sectionField['attributes'] as $attribute} data-{$attribute['name']}="{$attribute['value']}" {/foreach}>
            {foreach $sectionGroupField['options'] as $option}
                <option value="{$option}" {if $sectionGroupInputValue == $option} selected {/if}>{$option}</option>
            {/foreach}
        </select>
    </div>
{else}
    {if $sectionField['container_collapse_target']}
        {if $pageSection}
            {assign var=sectionLang value=$pageSection['lang'][$language]['translation']}
        {elseif $section}
            {assign var=pageSection value=$section}
            {assign var=sectionLang value=$section['lang'][$language]['translation']}
        {/if}

        {foreach $pageSection['type']['fields'] as $fields}
            {if $fields['name'] == $sectionField['container_collapse_target']}
                {assign var="collapseTargetValue" value=$sectionLang[$fields['name']]}
            {/if}
        {/foreach}
    {/if}

    <div
        {if $sectionField['container_id']}
            id="{$sectionField['container_id']}"
        {/if}
        class="section__field col-12 {$sectionField['container_class']} {if $sectionField['container_collapse']}collapse {if $collapseTargetValue}show{/if}{/if}"
        {foreach $sectionField['container_attributes'] as $attribute}
            data-{$attribute['name']}="{$attribute['value']}"
        {/foreach}
    >
        <div class="form-group">
            {if $sectionField['label']}
                <label
                        class="form-label"
                        {foreach $sectionField['label_attributes'] as $attribute} data-{$attribute['name']}="{$attribute['value']}" {/foreach}
                >
                    {$sectionField['label']}
                    {if $sectionField['tooltip']}
                        {if isset($sectionField['tooltip_url']) && $sectionField['tooltip_url'] != ""}
                            {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$sectionField['tooltip_url']}' target='_blank'>Learn More</a>"}
                        {else}
                            {assign var="popoverFooter" value=false}
                        {/if}
                        {include
                        file="adminarea/includes/helpers/popover.tpl"
                        popoverClasses="notification__popover"
                        popoverBody="{$sectionField['tooltip']}"
                        popoverFooter="{$popoverFooter}"
                        }
                    {/if}
                </label>
            {/if}
           
            <select
                class="form-control"
                name="sections[{$sectionIndex}][lang][{$sectionField['name']}]"
                {foreach $sectionField['attributes'] as $attribute} data-{$attribute['name']}="{$attribute['value']}" {/foreach}
                {if isset($sectionField['dependence']) && is_array($sectionField['dependence']['options'])}
                    data-field-dependence="{$sectionField['dependence']['field']}"
                    data-field-dependence-main="{$sectionField['name']}"                
                    data-field-dependence-options='{literal}{{/literal}{foreach $sectionField['dependence']['options'] as $key=>$dependenceOption}"{$key}":{literal}{{/literal}{foreach $dependenceOption as $key2 => $option}"{$key2}":"{$option}"{if !$option@last},{/if}{/foreach}{literal}}{/literal}{if !$dependenceOption@last},{/if}{/foreach}{literal}}{/literal}'
                {/if}
                {if isset($sectionField['depending_on'])}
                    data-field-depending-on="{$sectionField['depending_on']}"
                    data-field-dependence-main="{$sectionField['name']}"
                {/if}
            >
                {if $sectionField['name'] == "product_group_pricing"}
                    <option value="none" {if !$sectionFieldValue}selected{/if}>Choose Product Group</option>
                    {foreach $productGroups as $productGroup}
                        {if !$productGroup->hidden}
                            <option value="{$productGroup->id}" {if $sectionFieldValue == $productGroup->id} selected {/if}>{$productGroup->name} (Product Group)</option>
                            {foreach $products as $product}
                                {if $productGroup['id'] == $product['gid']}
                                    <option value="p{$product['id']}" {if $sectionFieldValue == "p`$product['id']`"}selected{/if}>{$productGroup->name} - {$product['name']}{if $product->hidden} (hidden){/if}</option>
                                {/if}
                            {/foreach}
                        {/if}
                    {/foreach}
                    {foreach $productGroups as $productGroup}
                        {if $productGroup->hidden}
                            <option value="{$productGroup->id}" {if $sectionFieldValue == $productGroup->id} selected {/if}>{$productGroup->name} (Product Group) (hidden)</option>
                            {foreach $products as $product}
                                {if $productGroup['id'] == $product['gid']}
                                    <option value="p{$product['id']}" {if $sectionFieldValue == "p`$product['id']`"}selected{/if}>{$productGroup->name} - {$product['name']}{if $product->hidden} (hidden){/if}</option>
                                {/if}
                            {/foreach}
                        {/if}
                    {/foreach}
                {elseif $sectionField['name'] == "link_to_page"}
                    <option value="none" {if !$sectionFieldValue}selected{/if}>None</option>
                    {foreach $pages as $key => $page}
                        <option value="{$page['name']}" {if $sectionFieldValue == $page['name']} selected {/if}>{$page['label']}</option>
                    {/foreach}
                {else}
                    {$hasSelectedValue = false}
                    {foreach $sectionField['options'] as $option}
                        {if $sectionFieldValue == $option['value']}
                            {$hasSelectedValue = true}
                        {/if}
                    {/foreach}
                    {foreach $sectionField['options'] as $option}
                        {if is_array($option)}
                            <option value="{$option['value']}" {if $sectionFieldValue == $option['value']} selected {elseif isset($option['default']) && $option['default'] && !$hasSelectedValue}selected{/if}>{$option['name']}</option>
                        {else}
                            <option value="{$option}" {if $sectionFieldValue == $option} selected {/if}>{$option}</option>
                        {/if}
                    {/foreach}
                {/if}
            </select>
        </div>
    </div>
    {if isset($sectionField['container_break']) && $sectionField['container_break']}
        </div>
        <div class="row m-t-2x">
    {/if}
{/if}