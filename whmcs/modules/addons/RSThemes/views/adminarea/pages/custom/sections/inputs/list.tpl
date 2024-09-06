{if isset($sectionGroupField)}
    {if isset($sectionGroupInputValue) && is_countable($sectionGroupInputValue)}
        {assign var=newGroupItemPosition value=sizeof($sectionGroupInputValue) + 1} {*get the list size and add 1 to get the next position of the item*}
    {else}
        {assign var=newGroupItemPosition value=1}
    {/if}   
    {if isset($sectionGroupField['icons'])}
        {assign var=showModalIconsTabs value=$sectionGroupField['icons']}
    {/if}
    {if isset($sectionGroupField['sidebar'])} 
        {assign var=sidebarType value=$sectionGroupField['sidebar']}
    {/if}
    {$showModalStatsField = false}
    {if isset($sectionGroupField['stats'])} 
        {assign var=showModalStatsField value=$sectionGroupField['stats']}
    {/if}
    <div class="form-group">
        <label class="form-label">
            {$sectionGroupField['label']}
            {if $sectionGroupField['tooltip']}
                {if isset($sectionGroupField['tooltip_url']) && $sectionGroupField['tooltip_url'] != ""}
                    {assign var="popoverFooter" value="<a class='btn btn--secondary btn--xs' href='{$sectionGroupField['tooltip_url']}' target='_blank'>Learn More</a>"}
                {else}
                    {assign var="popoverFooter" value=false}
                {/if}
                {include 
                    file="adminarea/includes/helpers/popover.tpl" 
                    popoverClasses="notification__popover"
                    popoverBody="{$sectionGroupField['tooltip']}"
                    popoverFooter="{$popoverFooter}"
                }
            {/if}
            <a 
                href="#addNewListItemModal" 
                class="btn btn--link btn--sm m-l-a p-r-0x {if !isset($sectionGroupInputValue) || empty($sectionGroupInputValue)}is-hidden{/if}"
                data-add-new-item="list"
                data-list-name="{$sectionGroupField['name']}"
                data-new-index=""
                data-new-position="{$newGroupItemPosition}"
                data-section="{$sectionIndex}"
                data-group="{$groupIndex}"
                data-toggle="lu-modal"
                data-backdrop="static"
                data-keyboard="false"
                {if isset($sectionGroupField['icons'])} 
                    data-show-modal-icon="{if !$showModalIconsTabs}false{else}true{/if}"
                {/if}
                {if isset($sectionGroupField['link'])} 
                    data-show-modal-link="{if !$sectionGroupField['link']}false{else}true{/if}"
                {/if}
                {if isset($sidebarType) && $sidebarType}data-list-sidebar-type{/if}
                {if isset($showModalStatsField) && $showModalStatsField}data-show-modal-stats{/if}
               >
                <i class="btn__icon ls ls-plus"></i>
                <span class="btn__text">
                    Add New
                </span>
            </a>
        </label>
        {include file='adminarea/pages/includes/sortable-list.tpl'
            items=$sectionGroupInputValue
            btnAddAction='addNewListItemModal'
            btnEditAction='editListItemModal'
            listType='list' 
            groupIndex=$groupIndex
        }
        <input 
            type="hidden" 
            data-section="{$sectionIndex}" 
            data-list="{$sectionGroupField['name']}" 
            data-group="{$groupIndex}"
            name="sections[{$sectionIndex}][lang][{$sectionField['name']}][groups][{$groupIndex}][fields][{$sectionGroupField['name']}]" 
            {if isset($sectionGroupField['icons'])}
                data-show-modal-icon="{if !$showModalIconsTabs}false{else}true{/if}"
            {/if}
            {if isset($sectionGroupField['link'])} 
                data-show-modal-link="{if !$sectionGroupField['link']}false{else}true{/if}"
            {/if}
            {if isset($sidebarType) && $sidebarType}data-list-sidebar-type{/if}
            value=""
        >
    </div>
{else}
    {if isset($sectionFieldValue) && is_countable($sectionFieldValue)}
        {assign var=newPosition value=sizeof($sectionFieldValue) + 1} {*get the list size and add 1 to get the next position of the item*}
    {else}
        {assign var=newPosition value=1}
    {/if}  
    {if isset($sectionField['icons'])}
        {assign var=showModalIconsTabs value=$sectionField['icons']}
    {/if}
    {if isset($sectionField['sidebar'])} 
        {assign var=sidebarType value=$sectionField['sidebar']}
    {/if}
    {$showModalStatsField = false}
    {if isset($sectionField['stats'])} 
        {assign var=showModalStatsField value=$sectionField['stats']}
    {/if}
    <div class="section__field col-12">
        <div class="form-group">
            <label class="form-label">
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
                <a 
                    href="#addNewListItemModal" 
                    class="btn btn--link btn--sm m-l-a p-r-0x {if !isset($sectionFieldValue) || empty($sectionFieldValue)}is-hidden{/if}"
                    data-add-new-item="list"
                    data-list-name="{$sectionField['name']}"
                    data-new-index=""
                    data-new-position="{$newPosition}"
                    data-section="{$sectionIndex}"
                    data-toggle="lu-modal"
                    data-backdrop="static"
                    data-keyboard="false"
                    {if isset($sectionField['icons'])} 
                        data-show-modal-icon="{if !$showModalIconsTabs}false{else}true{/if}"
                    {/if}
                    {if isset($sectionField['link'])} 
                        data-show-modal-link="{if !$sectionField['link']}false{else}true{/if}"
                    {/if}
                    {if isset($sidebarType) && $sidebarType}data-list-sidebar-type{/if}
                    {if isset($showModalStatsField) && $showModalStatsField}data-show-modal-stats{/if}
                >
                    <i class="btn__icon ls ls-plus"></i>
                    <span class="btn__text">
                        Add New
                    </span>
                </a>
            </label>
            {include file='adminarea/pages/includes/sortable-list.tpl'
            items=$sectionFieldValue
            btnAddAction='addNewListItemModal'
            btnEditAction='editListItemModal'
            listType='list'
            }
            <input 
                type="hidden" 
                data-section="{$sectionIndex}" 
                data-list="{$sectionField['name']}"
                name="sections[{$sectionIndex}][lang][{$sectionField['name']}]" 
                {if isset($sectionField['icons'])} 
                    data-show-modal-icon="{if !$showModalIconsTabs}false{else}true{/if}"
                {/if}
                {if isset($sectionField['link'])} 
                    data-show-modal-link="{if !$sectionField['link']}false{else}true{/if}"
                {/if}
                {if isset($sidebarType) && $sidebarType}data-list-sidebar-type{/if}
                value=""
            >
        </div>
    </div>
{/if}