<div class="modal modal--hero" id="pagePermissionsModal" data-page-permissions-modal>
    <div class="modal__dialog">
        <div class="modal__content">
            <div class="modal__top top">
                <div class="top__title type-4 text-danger"><i class="ls ls-exclamation-circle m-r-2x"></i>Can't create page</div>
                <div class="top__toolbar">
                    <button class="close btn btn--xs btn--icon btn--link" data-dismiss="lu-modal" aria-label="Close">
                        <i class="btn__icon lm lm-close"></i>
                    </button>
                </div>
            </div>
            <div class="modal__body" 
                data-page-permissions-ajax-url="{$helper->url('CustomPage@customPageVerify', ['templateName'=>$template->getMainName()])}"
                data-page-permissions-href="{$helper->url('CustomPage@new',['templateName'=>$template->getMainName()])}"
            >
                <p>Check permissions</p>
                <p data-page-permissions-root class="is-hidden">We cannot create page, check your permissions on main catalog of WHMCS if it is writable.</p>
                <p data-page-permissions-template class="is-hidden">We cannot create page, check your permissions on template catalog of WHMCS if it is writable.</p>
                <p data-page-permissions-htaccess class="is-hidden">We cannot create page, check your permissions of .htaccess if it is writable.</p>
            </div>
            <div class="modal__actions">
                <a class="btn btn--primary">
                    <span class="btn__text">Check Again</span>
                </a>
                <button data-dismiss="lu-modal" aria-label="Close" type="button" class="btn btn--default btn--outline"><span class="btn__text">{$lang.general.cancel}</span></button>
            </div>
        </div>
    </div>
</div>