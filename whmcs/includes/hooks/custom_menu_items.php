<?php

use WHMCS\View\Menu\Item as MenuItem;

add_hook('ClientAreaPrimaryNavbar', 1, function (MenuItem $primaryNavbar) {
    if (!is_null($primaryNavbar->getChild('Domains'))) {
        $primaryNavbar->removeChild('Domains');
    }
    if (!is_null($primaryNavbar->getChild('Website & Security'))) {
        $primaryNavbar->removeChild('Website & Security');
    }
    // Add "Terms of Use" menu item
    // Add "Terms of Use" menu item
    /* if (is_null($primaryNavbar->getChild('Terms Of Use'))) {
        $termsOfUse = $primaryNavbar->addChild('Terms Of Use', array(
            'label' => 'Terms Of Use',
            'uri' => 'terms-of-use.php',  // Update this to your actual Terms of Use URL
            'order' => 100, // Adjust the order number to control its position
        ));
        
    }

    // Add "Privacy Policy" menu item
    if (is_null($primaryNavbar->getChild('Privacy Policy'))) {
        $privacyPolicy = $primaryNavbar->addChild('Privacy Policy', array(
            'label' => 'Privacy Policy',
            'uri' => 'privacy-policy.php',  // Update this to your actual Privacy Policy URL
            'order' => 101, // Adjust the order number to control its position
        ));
        
    } */
});