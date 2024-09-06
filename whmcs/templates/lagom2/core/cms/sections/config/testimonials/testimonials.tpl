<div
    class="site-section section-{$theme} section-testimonials {if $overlay} section-overlay{/if} {if $combined}section-combined{/if} {if $custom_class} {$custom_class}{/if}">
    {include file="{$smarty.current_dir}/../../common/anchor.tpl"}
    <div class="{if $type != "type-1"}container{/if}{if $type == "type-2"} container-slider{/if}">
        {if $caption}
            <span class="section-caption">{$caption|unescape:'html'}</span>
        {/if}
        {if $title}
            <h2 class="section-title">{$title|unescape:'html'}</h2>
        {/if}
        {if $subtitle}
            <p class="section-subtitle">{$subtitle|unescape:'html'}</p>
        {/if}

       
        {if $testimonials_shuffle}
            {capture}{$testimonials|@shuffle}{/capture}
        {/if}

        {if $testimonials}
            {if $type == "type-3"}
                 {assign var=imgs value=[] }

                {foreach $testimonials as $testimonial}
                    {if ($testimonials_shuffle && $testimonials_shuffle_number) && $testimonial@iteration > $testimonials_shuffle_number}{break}{/if}
                    {append var=imgs value="{$WEB_ROOT}/templates/{$template}/assets/img/page-manager/{$testimonial.media}"}
                {/foreach}

                <div class="section-content swiper swiper-testimonials" data-testimonial-single-slider>
                <div class="swiper-wrapper">
                {foreach $testimonials as $testimonial} 
                    {if ($testimonials_shuffle && $testimonials_shuffle_number) && $testimonial@iteration > $testimonials_shuffle_number}{break}{/if}
                    <div class="swiper-slide">
                        {include file="{$smarty.current_dir}/testimonial-item.tpl"
                            type=$type}
                    </div>
                {/foreach}
                </div>
                <div class="avatars-wrapper">
                    <div class="swiper-pagination testimonials-avatars" data-slider-pagination data-images={$imgs|json_encode}>
                    </div>
                </div>
              </div> 

            {else}

                <div class="section-content content-slider-parent content-slider-parent-testimonials">
                {if $type != 'type-4'}
                    <div class="content-slider-testimonials section-slider content-slider {if $type == "type-3"} testimonials-single{/if}{if $testimonials|count <= 3} slider-pagination--hidden{/if}" data-cms-content-slider data-options="loop: true;{if $type == "type-2"} disabled: {$testimonials|count}{/if}">
                        {if $type == "type-2"}<div class="slider-cover-before"></div>{/if}
                        <div class="row row-eq-height content-slider-wrapper" data-content-slider-wrapper>
                {else}
                    <div class="testimonials-grid">
                {/if}

                        {foreach $testimonials as $testimonial}
                            {if ($testimonials_shuffle && $testimonials_shuffle_number) && $testimonial@iteration > $testimonials_shuffle_number}{break}{/if}
                            <div {if $type != "type-4"}class="{if $type != "type-3"}col-lg-4 col-md-6 col-12 {/if}content-slider-item{if $type == "type-1"} col-custom{/if}"{/if}>
                                {include file="{$smarty.current_dir}/testimonial-item.tpl"
                                type=$type}
                            </div>
                        {/foreach}
                </div>
                {if $type == "type-2"}<div class="slider-cover-after"></div>{/if}
                </div>
                {if $type == "type-2"}
                    <div class="swiper-button-next" data-next-slide>
                        <i class="lm lm-arrow-thin-right"></i>
                    </div>
                    <div class="swiper-button-prev" data-prev-slide>
                        <i class="lm lm-arrow-thin-left"></i>
                    </div>
                {/if}   
                {if $type == "type-3"}
                    <div class="slider avatars" data-cms-content-slider>
                        <div class="content-slider-wrapper slider-avatars" data-cms-content-wrapper>
                            {foreach $testimonials as $testimonial}
                                {if ($testimonials_shuffle && $testimonials_shuffle_number) && $testimonial@iteration > $testimonials_shuffle_number}{break}{/if}
                                <div class="testimonials-avatar">
                                    {if isset($testimonial.media)}
                                        {include file="{$smarty.current_dir}/../../common/graphic.tpl"
                                        graphic=$testimonial.media
                                        type="media"
                                        }
                                    {/if}
                                </div>
                            {/foreach}
                        </div>
                    </div> 
                {/if} 

                </div>
            
            {/if}

            
        {/if}

{if $type != "type-4"}
    </div>
{/if}
</div>


