<?php

use RSThemes\Helpers\AddonHelper;
use RSThemes\View\ViewHelper;
add_hook('ClientAreaPage', 1, function($vars) {
    if(basename($_SERVER['SCRIPT_NAME']) == "index.php" && str_contains($_SERVER['REQUEST_URI'],"index.php")) {
        $getData = ["currency","language"];
        $activeDisplayName = \RSThemes\Models\Display::where('active', true)->value('name');
        if(method_exists("\RSThemes\Helpers\AddonHelper",'isExtensionEnabled') &&
            \RSThemes\Helpers\AddonHelper::isExtensionEnabled("CMS") &&
            $activeDisplayName == 'CMS' &&
            \RSThemes\Models\Settings::getValue(\RSThemes\Helpers\AddonHelper::getCurrentTemplate().'_custompage_homepage_id')
        ) {

            $found = false;
            if(count($_GET) == 0)
            {
                $found = true;
            }
            if(!$found) {
                if(count(array_diff(array_keys($_GET), $getData)) == 0) {
                    foreach ($getData as $data) {
                        if (isset($_GET[$data])) {
                            $found = true;
                        }
                    }
                }
            }
            if($found && $_SERVER['REQUEST_URI'] != "/?".http_build_query($_GET) && $_SERVER['REQUEST_URI'] != "/"){
                header("HTTP/1.1 301 Moved Permanently");
                if(!empty(http_build_query($_GET)))
                    header("Location: /?" . http_build_query($_GET));
                else
                    header("Location: /" . http_build_query($_GET));
                exit;
            }
        }
    }
});

add_hook('ClientAreaHeadOutput', 2, function($vars) {
    if(method_exists("\RSThemes\Helpers\AddonHelper",'isExtensionEnabled') && 
        \RSThemes\Helpers\AddonHelper::isExtensionEnabled("CMS") && 
        $vars['pageType'] == "website" && 
        isset($vars['pageContent'])
    ){
        $caCssURL = (new ViewHelper())->extensionStyle('CMS', 'lagom-cms.css');
        return '<link href="'.$caCssURL.'" rel="stylesheet" type="text/css"/>';
    }
});

add_hook('ClientAreaFooterOutput', 2, function($vars) {
    if(method_exists("\RSThemes\Helpers\AddonHelper",'isExtensionEnabled') && 
        \RSThemes\Helpers\AddonHelper::isExtensionEnabled("CMS") && 
        $vars['pageType'] == "website"
    ) {
        $caJsURL = (new ViewHelper())->extensionScript('CMS', 'lagom-cms.js');
        return '<script defer src="'.$caJsURL.'"></script>';
    }
});

add_hook("ClientAreaPage", 1, function($vars) {
    $template = \RSThemes\Helpers\AddonHelper::getTemplate();
    if (($vars['templatefile'] == 'homepage' || $vars['templatefile'] == "error/page-not-found") && $template->getActiveDisplay()->name === 'CMS') {
        $page = null;
        $isHomepage = true;
        if($vars['templatefile'] == "error/page-not-found") {
            $page = "404";
            $isHomepage = false;
        }
        $pageHelper = new \RSThemes\Helpers\PageHelper($page, "404.php", $isHomepage);
        $sections = $pageHelper->getPageSections(\Lang::getName());
        $pageContent = (new \RSThemes\Helpers\FrontBuilder($sections, \Lang::getName()))->output();
        return [
            'pageContent' => $pageContent
        ];
    }
});

add_hook('ClientAreaHeadOutput', 9999, function($vars) {
    $data = "";
    if(method_exists("\RSThemes\Helpers\AddonHelper",'isExtensionEnabled') &&
        \RSThemes\Helpers\AddonHelper::isExtensionEnabled("CMS")) {
        // if (\RSThemes\Models\Settings::getValue(AddonHelper::getCurrentTemplate() . '_header_content_security_policy_enabled')){
        //     $data .= "<meta http-equiv=\"Content-Security-Policy\" content=\"default-src 'self' 'unsafe-inline'; \">\n";
        // }
        if (\RSThemes\Models\Settings::getValue(AddonHelper::getCurrentTemplate() . '_header_origin_enabled')){
            $data .= "<meta name=\"referrer\" content=\"origin\">\n";
        }
    }
    return $data;
});