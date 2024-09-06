<div class="tab-pane {if $smarty.get.tab == 'media'} is-active {/if}" id="settings-media">
    <div class="section__header top">
        <div class="top__toolbar">
            <h3 class="section__title">
                Media Manager
                {include file="adminarea/includes/helpers/docs.tpl" link=$cms_docs->pages['media_manager']}
            </h3>
            
        </div>
        <div class="top__toolbar is-right">
            <div class="top__search input-group">
                <span class="input-group__icon lm lm-search"></span>
                {* TODO - podpiąć wyszukiwarkę *}
                <input class="form-control input-group__form-control table-search" data-media-manager-search placeholder="Search...">
            </div>
            <form id="pageManagerMediaForm" 
                data-upload-images-count="{$media|count}" 
                data-upload-images 
                data-ajax-url="{$helper->apiUrl('MediaApi@newImage', ['templateName'=>$template->getMainName()])}" 
                enctype="multipart/form-data"
                data-alert-success-text="{$lang.flash_message.media.upload.sucess}"
                data-alert-error-size-text="{$lang.flash_message.media.upload.error.size}"
                data-alert-error-extension-text="{$lang.flash_message.media.upload.error.extension}"
                data-alert-error-other-text="{$lang.flash_message.media.upload.error.other}"
            >
                <div class="d-flex">
                    <label class="btn btn--primary uploadStatus m-b-0x" for="images"> 
                        <span class="btn__icon lm lm-upload"></span>
                        <span class="btn__text">Upload image</span>
                        <span class="btn__preloader preloader preloader--light"></span>
                        <input class="is-hidden" data-upload-images-input name="image[]" id="images" type="file" accept="image/*" multiple>
                    </label>
                </div>
            </form>
        </div>
    </div>
    <div class="widget widget--media-box">
        <div class="widget__body">
            <div class="widget__content">
                <div class="row row--eq-height" data-media-manager-container>
                    {foreach $media as $k => $media_img}
                        {*media_img['extension'] to get file extension*}
                        <div class="col-lg-3 col-md-4 col-sm-6" data-media-item="{$media_img['filename']}" data-media-item-key='{$k}'>
                            <div data-icon="{$media_img['filename']}" data-type="default" class="widget widget--media-manager media-overlay" href="#modalPreviewMedia-{$k}" data-toggle="lu-modal">
                                {* TODO - wybrać sposób wyświetlania zdjęć *}
                                {if $media_img['type'] == 'default'}
                                <a class="widget__media">
                                    <img src="{$whmcsURL}/templates/lagom2/assets/img/page-manager/default/{$media_img['filename']}">
                                    {else}
                                    <a class="widget__media">
                                        <img src="{$whmcsURL}/templates/lagom2/assets/img/page-manager/{$media_img['filename']}">
                                        {/if}

                                        <div class="widget__overlay">
                                            <div class="widget__content">
                                                <div class="msg">
                                                    <div class="msg__icon i-circled  bg-primary">
                                                        <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                            <path d="M17.85 16.44L14.31 12.9C15.37 11.54 16 9.85 16 8C16 3.59 12.41 0 8 0C3.59 0 0 3.59 0 8C0 12.41 3.59 16 8 16C9.85 16 11.54 15.37 12.9 14.31L16.44 17.85C16.54 17.95 16.67 18 16.79 18C16.91 18 17.05 17.95 17.14 17.85L17.85 17.14C18.05 16.95 18.05 16.63 17.85 16.44ZM6.5 9H4V7H6.5C6.78 7 7 6.78 7 6.5V4H9V6.5C9 6.78 9.22 7 9.5 7H12V9H9.5C9.22 9 9 9.22 9 9.5V12H7V9.5C7 9.22 6.78 9 6.5 9Z" fill="white"/>
                                                        </svg>
                                                    </div>
                                                    <div class="msg__body">
                                                        <div class="p-d">Click to enlarge</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        {* {if $media_img['type'] == 'default'}
                                            <img src="/templates/lagom2/assets/img/page-manager/default/{$media_img['filename']}"
                                                 alt="{$media_img['filename']}">
                                        {else}
                                            <img src="/templates/lagom2/assets/img/page-manager/{$media_img['filename']}"
                                                 alt="{$media_img['filename']}">
                                        {/if} *} 
                                    </a>
                                    <div class="widget__actions widget__actions--raised">
                                        <span class="truncate">{$media_img['filename']}</span>
                                        {if $media_img['type'] == 'custom'}
                                            <span class="tooltip-toggle" data-toggle="lu-tooltip" data-title="Delete">
                                                <a class="btn btn--icon btn--link btn--xs delete-image" href="#deleteImgModal" data-toggle="lu-modal" data-backdrop="static" data-media-name="{$media_img['filename']}" data-init-remove-media-modal>
                                                    <i class="btn__icon lm lm-trash"></i>
                                                </a>
                                            </span>
                                        {/if}
                                    </div>
                            </div>
                        </div>
                        <div id="modalPreviewMedia-{$k}" class="modal modal--media-preview is-hidden">
                            <div class="modal__dialog">
                                <div class="modal__content">
                                    <button class="close btn btn--xs btn--icon btn--link is-absolute" data-dismiss="lu-modal" aria-label="Close">
                                        <i class="btn__icon lm lm-close"></i>
                                    </button>
                                    {if $media_img['type'] == 'default'}
                                        <img src="{$whmcsURL}/templates/lagom2/assets/img/page-manager/default/{$media_img['filename']}"
                                             alt="{$media_img['filename']}">
                                    {else}
                                        <img src="{$whmcsURL}/templates/lagom2/assets/img/page-manager/{$media_img['filename']}"
                                             alt="{$media_img['filename']}">
                                    {/if}
                                </div>
                            </div>
                        </div>
                        
                    {/foreach} 
                    {include file="adminarea/includes/media/no-data.tpl" customClass="col-lg-9 col-md-8 col-sm-6 m-r-1x has-shadow"}     
                    <div class="col-lg-3 col-md-4 col-sm-6" data-media-item-upload-new>
                        <form 
                            id="pageManagerMediaNewItemForm" 
                            data-upload-images 
                            data-ajax-url="{$helper->apiUrl('MediaApi@newImage', ['templateName'=>$template->getMainName()])}" 
                            enctype="multipart/form-data"
                            data-alert-success-text="{$lang.flash_message.media.upload.sucess}"
                            data-alert-error-size-text="{$lang.flash_message.media.upload.error.size}"
                            data-alert-error-extension-text="{$lang.flash_message.media.upload.error.extension}"
                            data-alert-error-other-text="{$lang.flash_message.media.upload.error.other}"
                        >
                            <label class="widget widget__media-add">
                                <div class="widget__main-icon">
                                    <i class="lm lm-upload"></i>
                                </div>
                                <div class="widget__desc">Upload Image</div>
                                <div class="widget__extensions text-center">Allowed extensions .PNG, .JPG, <br>.SVG, .GIF. Max size {$maxUploadSize}.</div>
                                <input class="is-hidden" data-upload-images-input name="image[]" id="images" type="file" accept="image/*" multiple>
                            </label>
                        </form>
                    </div>
                                 
                </div>
            </div>
        </div>
    </div>
</div>