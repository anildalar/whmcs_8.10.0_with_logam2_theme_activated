
{if file_exists("templates/$template/overwrites/footer.tpl")}
    {include file="{$template}/overwrites/footer.tpl"}
{else}
    
    {if isset($RSThemes['footer-layouts'])}
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        {include file=$RSThemes['footer-layouts']['mediumPath']}
    {else}
        {include file="templates/{$template}/core/layouts/footer/default/default.tpl"}
    {/if}
{/if}
