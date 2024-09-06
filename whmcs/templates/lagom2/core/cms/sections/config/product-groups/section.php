<?php

return [
    'default_type' => true,
    'name' => 'Product Groups',
    'slug' => 'product-groups',
    'cache' => ['product', 'product_price_refresh'],
    'thumb' => 'thumb.png',
    'fields' => [
        [   // Subsection - Section Desctiption
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Section Description',
            'collapse' => false
        ],
        [   // Caption
            'type' => 'text',
            'name' => 'caption',
            'label' => 'Caption',
            'placeholder' => 'Enter caption...',
            'tooltip' => 'Provide a brief section caption to appear above the main title in a smaller font. You can skip this if you don`t wish to display this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-product-groups/#section-description'
        ],
        [   // Title
            'type' => 'text',
            'name' => 'title',
            'label' => 'Title',
            'placeholder' => 'Enter title...',
            'tooltip' => 'Elevate page clarity and visual hierarchy using section titles. Optionally skip for not displaying this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-product-groups/#section-description'
        ],
        [   // Subtitle
            'type' => 'text-editor',
            'name' => 'subtitle',
            'label' => 'Subtitle',
            'placeholder' => 'Enter subtitle...',
            'tooltip' => 'Add concise text to clarify section content, enhancing context and user understanding. You can skip this if you don`t wish to display this element.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-product-groups/#section-description'
        ],
        [   // Subsection - Product Group List
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Product Group List',
            'collapse' => false
        ],
        [   // Group Product Groups Packages
            'type' => 'group-input',
            'name' => 'products_group',
            'label' => 'Group products in multiple tabs',
            'grouped' => false, 
            'group_forced' => false, 
            'fields' => [
                [   // Product Groups
                    'type' => 'group',
                    'name' => 'product_groups',
                    'label' => 'Product groups',
                    'tooltip' => 'Shows a list of items added to this section for display on the website. You can easily arrange them by dragging and dropping, adjusting their order as you like.',
                    'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-product-groups/#product-grpups'
                ],
            ],
            'tooltip' => 'This option enables you to generate multiple groups, which will subsequently appear on the frontend as distinct tabs.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-product-groups/#group-product-group'
        ],
        [   // Product Group Settings
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Product Group Settings',
            'collapse' => true
        ],
        [   // Package Type
            'type' => 'select',
            'name' => 'type',
            'label' => 'Product type',
            'container_class' => 'col-sm-6',
            'options' =>  [
                [
                    'name' => 'Type 1 - Product with big price and "Learn More" button',
                    'value' => 'default'
                ],
                [
                    'name' => 'Type 2 - Product with link style button',
                    'value' => 'link'
                ],
                [
                    'name' => 'Type 3 - Condensed product with link style button',
                    'value' => 'condensed'
                ]
            ],
            'tooltip' => 'Choose the appearance of the product boxes on your generated website page by selecting one of the predefined types from the provided list.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-product-groups/#product-group-type'
        ],
        [   // Package Style
            'type' => 'select',
            'name' => 'style',
            'label' => 'Product style',
            'container_class' => 'col-sm-6',
            'options' =>  [
                [
                    'name' => 'Bordered',
                    'value' => 'bordered'
                ],
                [
                    'name' => 'Boxed',
                    'value' => 'boxed'
                ]
            ],
            'tooltip' => 'Choose the style for the created packages to determine how you want them to be displayed on the generated website page.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-product-groups/#product-group-style'
        ],
        [   // Display Package Slider
            'type' => 'checkbox',
            'name' => 'display_package_slider',
            'label' => 'Display product slider on selected resolutions',
            'label_attributes' => [
                [
                    'name' => 'toggle',
                    'value' => 'lu-collapse'
                ],
                [
                    'name' => 'target',
                    'value' => '#display_package_slider'
                ],
            ],
            'tooltip' => 'Decide when the product packages will appear as a sliding display on different screen sizes. This is useful when you have many products to show and want to avoid making the page too long..',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-product-groups/#product-group-slider'
        ],
        [   // Package Slider
            'type' => 'multiselect',
            'name' => 'package_slider',
            'container_id' => 'display_package_slider',
            'container_collapse' => true,
            'container_collapse_target' => 'display_package_slider',
            'attributes' => [
                [
                    'name' => 'selectize-all'
                ]
            ],
            'options' => [
                [
                    'name' => 'All',
                    'value' => 'all',
                    'default' => true
                ],
                [
                    'name' => 'Desktop',
                    'value' => 'desktop'
                ],
                [
                    'name' => 'Tablet Horizontal',
                    'value' => 'tab-h'
                ],
                [
                    'name' => 'Tablet Vertical',
                    'value' => 'tab-v'
                ],
                [
                    'name' => 'Mobile',
                    'value' => 'mob'
                ]
            ]
        ],
        [ // Price Display
            'type' => 'select',
            'name' => 'package_price_display',
            'label' => 'Choose product group price display',
            'options' => [
                [
                    'name' => 'Cheapest billing cycle',
                    'value' => 'cheapest',
                    'default' => true
                ],
                [
                    'name' => 'Monthly',
                    'value' => 'monthly'
                ],
                [
                    'name' => 'Quarterly',
                    'value' => 'quarterly'
                ],
                [
                    'name' => 'Semiannually',
                    'value' => 'semiannually'
                ],
                [
                    'name' => 'Annually',
                    'value' => 'annually'
                ],
                [
                    'name' => 'Biennially',
                    'value' => 'biennially'
                ],
                [
                    'name' => 'Triennially',
                    'value' => 'triennially'
                ],
            ],
            'tooltip' => 'Decide what pricing should be shown for selected product group box.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-product-groups/#price-display'
        ],
        [   // Columns on desktop
            'type' => 'select',
            'name' => 'cols_desktop',
            'label' => 'Columns on desktop',
            'container_class' => 'col-sm-3',
            'options' =>  [
                [
                    'name' => '1',
                    'value' => '1'
                ],
                [
                    'name' => '2',
                    'value' => '2'
                ],
                [
                    'name' => '3',
                    'value' => '3'
                ],
                [
                    'name' => '4',
                    'value' => '4',
                    'default' => true
                ],
                [
                    'name' => '5',
                    'value' => '5'
                ],
                [
                    'name' => '6',
                    'value' => '6'
                ],
            ],
            'tooltip' => 'efine the number of columns for features displayed on screens wider than 1320px.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-product-groups/#product-columns'
        ],
        [   // Columns on tablet horizontal
            'type' => 'select',
            'name' => 'cols_tab_h',
            'label' => 'Columns on tablet horizontal',
            'container_class' => 'col-sm-3',
            'options' =>  [
                [
                    'name' => '1',
                    'value' => '1'
                ],
                [
                    'name' => '2',
                    'value' => '2',
                ],
                [
                    'name' => '3',
                    'value' => '3',
                ],
                [
                    'name' => '4',
                    'value' => '4',
                    'default' => true
                ],
                [
                    'name' => '5',
                    'value' => '5'
                ],
                [
                    'name' => '6',
                    'value' => '6'
                ],
            ],            
            'tooltip' => 'Specify the number of columns for features displayed on screens with widths ranging from 992px to 1319px.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-product-groups/#product-columns'
        ],
        [   // Columns on tablet vertical
            'type' => 'select',
            'name' => 'cols_tab_v',
            'label' => 'Columns on tablet vertical',
            'container_class' => 'col-sm-3',
            'options' =>  [
                [
                    'name' => '1',
                    'value' => '1'
                ],
                [
                    'name' => '2',
                    'value' => '2',
                    'default' => true
                ],
                [
                    'name' => '3',
                    'value' => '3',
                ],
                [
                    'name' => '4',
                    'value' => '4'
                ]
            ],            
            'tooltip' => 'Choose the number of columns for features displayed on screens with widths ranging from 768px to 991px.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-product-groups/#product-columns'
        ],
        [   // Columns on mobile
            'type' => 'select',
            'name' => 'cols_mob',
            'label' => 'Columns on mobile',
            'container_class' => 'col-sm-3',
            'options' =>  [
                [
                    'name' => '1',
                    'value' => '1'
                ],
                [
                    'name' => '2',
                    'value' => '2'
                ]
            ],
            'tooltip' => 'Set amount of columns with features, shown on screens with width smaller than 767px.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-product-groups/#product-columns'
        ],
        [   // Subsection - Section Actions
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Section Actions',
            'collapse' => true
        ],
        [   // Buttons
            'type' => 'buttons',
            'name' => 'buttons',
            'label' => 'Buttons',
            'tooltip' => 'Create and assign custom buttons to this section with ease. Boost user engagement and enhance website conversion with effective call-to-action buttons.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-common-settings/#button-manager'
        ],
        [   // Subsection - Advanced Section Settings
            'type' => 'subsection',
            'name' => 'subsection',
            'label' => 'Advanced Section Settings',
            'collapse' => true
        ],
        [
            'type' => 'checkbox',
            'name' => 'combined',
            'label' => 'Combine this section with section below',
            'attributes' => [
                [
                    'name' => 'uncheck-switcher',
                    'value' => [
                        'overlay'
                    ]
                ]
            ],
            'tooltip' => 'Eliminate bottom padding and borders from this section, allowing the fusion of these two sections. It`s recommended to apply identical "Section Style" in the "Section Panel" for seamless integration.',            
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-common-settings/#combine-sections'
        ],
        [
            'type' => 'checkbox',
            'name' => 'overlay',
            'label' => 'Overlay section below on this section',
            'attributes' => [
                [
                    'name' => 'uncheck-switcher',
                    'value' => [
                        'combined'
                    ]
                ]
            ],
            'tooltip' => 'This configuration pulls the section below over the currently managed section while adding an extra 200px padding at the bottom. You can adjust the pixel value by customizing the <b>--cms-section-overlay-margin</b> CSS variable through custom CSS rules.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-common-settings/#overlay-sections'
        ],
        [   // Package custom class
            'type' => 'text',
            'name' => 'package_custom_classes',
            'label' => 'Package custom class',
            'placeholder' => 'Enter class...',
            'tooltip' => 'Assign custom class to all product items generated in this section.'
        ],
        [   // Section anchor
            'type' => 'text',
            'name' => 'section_anchor',
            'label' => 'Section anchor',
            'placeholder' => 'Enter anchor...',
            'tooltip' => 'Assign special names to section anchors. This makes it easy to guide people to specific parts of the page when you share links',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-common-settings/#section-anchor'
        ],
        [   // Section custom class
            'type' => 'text',
            'name' => 'custom_class',
            'label' => 'Section custom class',
            'placeholder' => 'Enter class...',
            'tooltip' => 'This setting allows you to assign custom classes to the section container. You can input your own CSS class here and then apply the necessary styling in the <b>theme-custom.css</b> file.',
            'tooltip_url' => 'https://lagom.rsstudio.net/docs/website-builder/section-common-settings/#section-custom-class'
        ]
    ]
];
